Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CC6CD37A7
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 22:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A47C10E120;
	Thu,  7 May 2026 22:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loZOkFQK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDC610E120
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 22:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778194733; x=1809730733;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1oCNgRPe39SLi/o8vpQAcpuIhYVpP3BGijwzjskeWNc=;
 b=loZOkFQKmPpbl7oqbkSKjPjIUV+oRqLfqQDaoKwR76ULwyXavrCA5K+S
 YrS4vYHGsvqu5T30Ma9nfi4n6/X9R2ml8POqmj3KzdxjG4JuI3U/End1s
 bzLpgVhir8wJRWOP2UrTRX+1q5S4iyGrFhwSrT0T+9cVRaaiRxWwR8zz7
 WZ9Kjyvc8WD/eFlQHXue/ZjAjNBiERx83XO8B1YbXuQlk/JYCRf/6ELxR
 oLEsb5XtGyJo6Rjf1AxkZ53Kz5IMpGgB51+M1LQc/W4p4v5wMMppc03Tm
 JFhiyobeLVhjSxETtBliNN6N8DomVzRt6Z02f9k+8NjFyRHxHK5r/Ka4J A==;
X-CSE-ConnectionGUID: WwIrcpJTTOqdEW0X4xwQyw==
X-CSE-MsgGUID: oVDb1u1ARSGlG8Mn7RycUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79346288"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="79346288"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 15:58:53 -0700
X-CSE-ConnectionGUID: rs+3gEhHTNqFinEJuRDPGw==
X-CSE-MsgGUID: 5YjkqQHNSkq8SLkAxe4FgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="233543823"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 15:58:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 15:58:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 15:58:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 15:58:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVLsHxOthkmQru+wEZlMOoWG9guudG0+snD3uCBKnAPMuZ2VIdyZWEBtRafvPH+Pbj4usbdPNWfY9ppXiFniVOa1qdmua+oEPSX/18hAva9FNOX0NqpJWyFN4lb5w8NgsfIQ6buGpMOTuXl6pNu6FSbThieJkhiFKeG7vtm1+MdjQLqqbiEJd+mMDmL65v489dS+6NMNi5azHBTkEvCxCJueDAk9uTR0rjfl/ZMMuB7trefHWVMM15QZTDv1QvxyPkfuSCXryEJ+gn9/mnTxl3lGYnYRynWRndIRw5kW7actm9Wid+TOgeJqu9i7jVrYCeBsgvGRLv57vzm4fDf7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBp6NW/UcJlDGZZ13iIhyyzRHp2oOTV8XsM4LX0FbZI=;
 b=ke7cikrh+7zl89kW16JTwigP8OzAM9ocjXw6qevZWKs1XiAI56wKTp3D+ofnV6zXlttnxY+WfbS0KoBZe4KCBj+5Nv9RPNmxbAYxg6HaOJ9gxQg6g8eaTQrWp+WPIgcCy34vCD0/nb+edOMkxCEuDWt4G9fFX8g2w/WgqoMSRfL78Ia3hZowJ5rHJFVXGfIZszHbx6QNBf+IErZgbVx2ZmQXpRgLqdCIIOOvhJq2kdfdbd6Scs1LWDt4oHAZqs1XoexOsirCOvQiwNMMDhf7NVDC/d4JsekH20Jh9AXVK2ahDoPU8xD8woIlICzu9SvPZVHqXi5c/3N93ZV4H3zRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8461.namprd11.prod.outlook.com (2603:10b6:408:1e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 22:58:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 22:58:47 +0000
Date: Thu, 7 May 2026 15:58:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
Message-ID: <20260507225845.GB3397116@mdroper-desk1.amr.corp.intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-5-stuart.summers@intel.com>
 <875x53dvvo.fsf@intel.com>
 <0579da16c8a003849b608d29ea37b3f86a9ddc17.camel@intel.com>
 <873407dqxw.fsf@intel.com>
 <dede21f05cac6e683c4f001a8cc31b883ba2810c.camel@intel.com>
 <87zf2fc7ys.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zf2fc7ys.fsf@intel.com>
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: e8deaf84-c5cd-49d4-b3fe-08deac8c326f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: AtM4ZICTrA8LGar156byCDI5dXSQpwgN+xQ4Oj2nNVJaPGf/9/VltfOh/yVC5Qwph5EDpRTfEn0iD8DmxureWLaBiJJad86kIgarB2YOvEs8vUeVPt4Nm2VveBewlq+kp9BaKyulIJIh8CuOZhFFv0iov33ltO7/Wvs6nBXnX6BlIvars29UmB/kgsVwKO5qQJG8dKkXI3gCUbNih8G+shFKYrBlZIzbsHv/8K2Fj//Ak6Wy/oyaahjwo5hLGn5LUefndc8AMyLVOORkHt3QayGcsyYY6V4yqFrimwdHeDnmeFwuGmPWucMGqK3sjVJOw/eno4YRGg2lmHDgnE19KVII6sMUXT+y8AyMGV50ZyZFpuePqSclJVInLGre+mIIGokFJTz4AB9X1e8Fl9dCIQ2EzQa4v7NoY01pZjqo621OpvKz+6YlDcuFdgBqoDfTgP5bzf4Wim0r+0vrYfREZPLH7L/mh+UDN6nHEgyi1uQ64bXLX+v8ABF6DdT2gdTGYWEhPNEVOouzE63ieWBO7XhQlmRDRmvMsSPkhiR9pix54OI31OMGb/mk+F/0UqsL9BDy7UnreBWSNtJFivBLPLyHGfeQMGg9vUIqqy15yevhfGt6f5Zei26ERm/KAIzD+KpoLHwVZ1qBvWSDbiOk6JvYwcuUzWamXv+/JT506V9mrzcm+kYcAxJ3LySgoQ1r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(3023799003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xy1+Hf20w6Xl80PXVCsZ4kV/eJbUMT/TaZTsSzuEpkO5tGrVcDoIRSauMg?=
 =?iso-8859-1?Q?Y3aO8SmZfD16w97SMguzowPDFrQAWPxXtiSL/Uy5XPuxQw2ZJTwKc3cN4L?=
 =?iso-8859-1?Q?nbNfVyC1xXqjYDJoBZ+EMJhnA3LUJeCYdr9PusawXVd31giSzp9uy2L3ZY?=
 =?iso-8859-1?Q?T3VDeDdFAZB0ew8UCxf95TiY3I1/U0cy/DbAy2n8b/JLNgD3oauh2cHkCQ?=
 =?iso-8859-1?Q?2iY/LMahc6hpNcncjTzAHlpG0eduueLiehvnyPpKy+YXyhuoJjPIVoxyRt?=
 =?iso-8859-1?Q?VDF66H2sL+FK5CjTGur+JQCTKSeEsryzk+bzu+aH8QUAlL9PL1QwDc7h8x?=
 =?iso-8859-1?Q?Di9ocPXUXK++1lVhPk7r49i9UwIJX/tLVeX1LDo5lyqp/E35RlpPkOlLXP?=
 =?iso-8859-1?Q?QPR4BUstGEEA+2W41lB6dJ1jMfE3Qx+NCR4kwIuwCpuEI9ZcgmOg84Mn45?=
 =?iso-8859-1?Q?zqUy4yUqkhqlqrxzgSVl7WEowepded8lhrDvN5998Z/+6hjcnFm/+GKSQG?=
 =?iso-8859-1?Q?407xtAndlPTQUb66Il84q8zebagX3F4do96Y+kgma9ErrR0XN5VdBxu+nb?=
 =?iso-8859-1?Q?38R2BkSPX4E5kM5iFzpmSBXnRISJuNNUp9nzyA23LDlu2HDGdkiK4+19Q0?=
 =?iso-8859-1?Q?xP7BfbkFm8K4eFQAhgmRvdfhYIcGTRNKwOcsIrWr0m3CmDUAGPHTL9DVoD?=
 =?iso-8859-1?Q?TEfzt5L3PjoEa0yPVzF+GuAN+L7fn7htr+hyA11x6XVAzjg3G7ow0L8n/B?=
 =?iso-8859-1?Q?O5/ZXcYxXz8M/brGcZNyBm9XNOCe1rtDhOtHaYBGsYukeIuxsMvYloxqxe?=
 =?iso-8859-1?Q?tn0dAXDfCS0R3V7mLQN0WdRsmgRZnDVrOl38vDKj1/xwjCP7T272IHT9Im?=
 =?iso-8859-1?Q?sK+U2qs9jRvFJCrFJb27ORdR1LFl9Frget07KHGXjTnN2sgdSEHTUDCdFO?=
 =?iso-8859-1?Q?UXDsGLBdk9Td/s4PVRHygLwDHHZrK2L3B+SJ5Nf894NoIPfWjd0zHJ2sF3?=
 =?iso-8859-1?Q?kzsgJFZjWCNx0x6TiiecWFnLyfsVScTSqm8X0DqGUZveIA46RWowBmrMxa?=
 =?iso-8859-1?Q?5T7RkT0/yb2Ry5pvYWPMZMvzpqhSoqAYU9a9hq3rjW25fknevLbHsoGF9T?=
 =?iso-8859-1?Q?VY2TcyumMakzum/Fz9Fuw5wexnQsyb/by9g9sTaI9JGot5JKhMbfQE5W3Z?=
 =?iso-8859-1?Q?bhQhZkZn3+QWGVmnnZCVvJP29nl3XvfggAmQ5wBj/hwY+nlCDPYeIxuR21?=
 =?iso-8859-1?Q?IFzvL3D+VLrpzaIvjS4c1F7RPQighUQ+89vQU7HO7zs7aedqbOmim7wUnt?=
 =?iso-8859-1?Q?RIGja3ZQVWmopoaWcIqVp/t73i8ac/BMiqwprHN9nED4xa485ASjRv9E/r?=
 =?iso-8859-1?Q?hZU14dBpb61/RFmksxUr5QMyQE2wj3uGFDVvZ049+LqTzU/bNEYfQcTKZj?=
 =?iso-8859-1?Q?ZB/Dprql0XshJb0ACl0PNtD6qsrG3zp928TVJcRZRGGcvSGA9mGvSAlitW?=
 =?iso-8859-1?Q?KkHMaUxfgBXhcMo1lONZ04Pv/hdSq9rv/ohg+qx2ayt2v6e58GLHfxD0kS?=
 =?iso-8859-1?Q?ri2Dh2sTUOaQUVrsAcVP5ylI67LDnhPxprauKsNgUzY0KcS8Kiedq3bDac?=
 =?iso-8859-1?Q?3STTz8RdA03mRgT3SQVABDSrppW+bbG/DWI+A6H6kMf7tiumnTsARMdppM?=
 =?iso-8859-1?Q?SYzYrvJSLQYChUwasKKRiA8p3qk4r4P62/2yqYWPysK/I+BUeMYfUHkkHM?=
 =?iso-8859-1?Q?FQffacit8KVlfEiTUT/XOo7mNnu4JqoHBnqw7FyJgBHbxl2xwNEELFfeog?=
 =?iso-8859-1?Q?H7rSic11BVlhC2dsw9+HiV9zWi+dfio=3D?=
X-Exchange-RoutingPolicyChecked: uqZRttly8S7bDBQ2SEpSkvobYFWiQOEKS/5HG5KJOejhzPkJ4XhAg/k0hBqU+dfVX2L5UzjRXHUOMawZAEeP3oiYebHjvIHtICNr2RwSK2Z/IHV+b3yfZupol4pb97TSiJrJi3kgngOL7UXqeh0+kJ5LJFtsyVnve6VeZL/Y316hFi7JOpg4OqS4Awcq29U7HhGC1vFHwNOES9Z08hpe/T85WGPirRogRKHOZZZMmmrAn22ejo42IioBywZsuqRqx/eQp9zQEst/yegqnu0nLg7CXKBk0BKbgYqXXD5FDLUoHAG7lSMrF1D9dfpYnATIYlgyBCMVDBuWAYcSEPZcdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8deaf84-c5cd-49d4-b3fe-08deac8c326f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 22:58:47.7056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuoDA9z+4uXHLPt2k2iQeJX/+J93rHyG65kgTY3bmUI6FBLXcltYzewJ7o2Oy/noJ5QkzgY5GnMHQBuotuMEyvY3j5GFilWkZ/diI+qomfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8461
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

On Mon, May 04, 2026 at 04:04:11PM -0300, Gustavo Sousa wrote:
> "Summers, Stuart" <stuart.summers@intel.com> writes:
> 
> > On Mon, 2026-05-04 at 14:28 -0300, Gustavo Sousa wrote:
> >> "Summers, Stuart" <stuart.summers@intel.com> writes:
> >> 
> >> > On Mon, 2026-05-04 at 12:42 -0300, Gustavo Sousa wrote:
> >> > > Stuart Summers <stuart.summers@intel.com> writes:
> >> > > 
> >> > > > Add the skeleton code for a new debug specific configfs group.
> >> > > > 
> >> > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> >> > > > Assisted-by: Copilot:claude-opus-4.7
> >> > > > ---
> >> > > >  drivers/gpu/drm/xe/Makefile            |  2 ++
> >> > > >  drivers/gpu/drm/xe/xe_configfs.c       |  4 ++++
> >> > > >  drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
> >> > > >  drivers/gpu/drm/xe/xe_configfs_debug.h |  8 ++++++++
> >> > > >  drivers/gpu/drm/xe/xe_configfs_types.h |  7 +++++++
> >> > > >  5 files changed, 35 insertions(+)
> >> > > >  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
> >> > > >  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
> >> > > > 
> >> > > > diff --git a/drivers/gpu/drm/xe/Makefile
> >> > > > b/drivers/gpu/drm/xe/Makefile
> >> > > > index 09661f079d03..b58667b0b18e 100644
> >> > > > --- a/drivers/gpu/drm/xe/Makefile
> >> > > > +++ b/drivers/gpu/drm/xe/Makefile
> >> > > > @@ -161,6 +161,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
> >> > > >  
> >> > > >  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> >> > > >  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
> >> > > > +xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) :=
> >> > > > xe_configfs_debug.o
> >> > > > +xe-$(CONFIG_CONFIGFS_FS) += $(xe_debug_configfs_obj-y)
> >> > > 
> >> > > What are the downsides of keeping this available for non-debug
> >> > > builds?
> >> > > 
> >> > > I imagine that the debug configfs could be useful for someone not
> >> > > involved in kernel development working together with the
> >> > > developers
> >> > > to
> >> > > debug issues without needing to rebuild their kernel.
> >> > 
> >> > So the focal parameter we had in i915 was enable_rc6. Something
> >> > like
> >> > this is what we explicitly don't want to expose to a general user
> >> > as it
> >> > can have unforeseen consequences (like having very high power
> >> > usage).
> >> > But, having the ability to disable rc6 for debug purposes as a
> >> > developer is extremely useful at narrowing down certain types of
> >> > bugs
> >> > at the hardware/software interface.
> >> 
> >> We could probably keep the debug stuff available but cause a taint if
> >> they ever get used?
> >
> > So the tainting is really just for our CI I think. This won't
> > necessarily impact end users - at least on the client side - who might
> > just ignore it (or not even notice it).
> 
> I *think* tainting is not only for CI (someone could correct me here).
> I see that our driver adds a taint when the user is applying some
> parameters (module parameters or configfs) that alters the "officially
> supported" behavior of the driver.
> 
> Some examples I could find are usages of module_param_named_unsafe() in
> the module param front, and setup_configfs_post_ctx_restore_bb(),
> setup_configfs_mid_ctx_restore_bb() in configfs.

Yeah, there are various reasons to taint the kernel (hardware, software,
or behavioral/usage) and they indicate different things; some are more
serious than others.  See Documentation/admin-guide/tainted-kernels.rst
for details.  The general idea though is that you've entered a
dangerous/risky situation and we can no longer trust the system to
behave properly going forward.  I believe the kernel community will
often ignore or de-prioritize bug reports that arise from tainted
kernels because there isn't really any guarantee of proper behavior or
support from the community at that point.

Some of our configfs entries in Xe are "official" and end-user focused
(e.g., SR-IOV configuration settings and such) so those shouldn't cause
any taint.  But others are low-level debugging knobs that are
effectively handing the user a loaded gun to shoot themselves in the
foot with.  E.g., the "workaround batchbuffer" configfs stuff is very
useful for hardware debugging sessions by expert driver developers, but
if used improperly makes it it very easy to mess up both hardware and
software internal state in ways that make the system unstable.  Tainting
on these developer-focused debug facilities is important because we
can't trust any bug reports that show up after someone has used those
settings.  With i915 module parameters we got into situations where a
bunch of websites and wikis posted horribly inaccurate suggestions and
users would blindly copy those settings without realizing that they were
deliberately breaking their systems, and some of the debug knobs we're
making available in configfs are even more risky.  Honestly, it might be
best to even stick them behind CONFIG_EXPERT and/or other build
settings.


Matt

> 
> >
> >> 
> >> The scenario I had in mind is someone who is not familiar with
> >> building
> >> their own kernel working together with the development community on a
> >> hard-to-reproduce issue and some of the debug configfs attributes
> >> being
> >> useful to gather more relevant data.
> >
> > Yeah but IMO we really should be able to instruct such a user how to do
> > that - the steps there aren't too difficult if they're already
> > installing kernels etc.
> >
> > A lot of our debug hooks are already held under various Kconfig options
> > anyway like DRM_XE_DEBUG, DRM_XE_DEBUG_GUC, DRM_XE_DEBUG_VM, etc. And a
> > lot of the information under those Kconfigs are also critical for
> > different debugs.
> 
> Are those due to performance or resource usage implications if they are
> kept enabled?  If so, is this the same case here?
> 
> >
> > I'd really prefer to keep these under DRM_XE_DEBUG (or some other
> > Kconfig) if possible so we can maximize the ease of adding new
> > parameters as specific debugs come up.
> 
> But why would keeping them under a build flag make it easier to add new
> parameters as opposed to always keeping the knobs available for use?
> 
> --
> Gustavo Sousa
> 
> >
> > Thanks,
> > Stuart
> >
> >> 
> >> --
> >> Gustavo Sousa
> >> 
> >> > 
> >> > That's just one example, but there are a bunch of things that could
> >> > fit
> >> > this category and I expect we'll have even more use cases over
> >> > time. 
> >> > 
> >> > Right now we have to hold these types of changes in a side branch
> >> > not
> >> > exposed externally and I really want to converge our processes so
> >> > we
> >> > can more easily make these kinds of changes and let us debug
> >> > directly
> >> > out of drm-tip.
> >> > 
> >> > > 
> >> > > >  
> >> > > >  # graphics virtualization (SR-IOV) support
> >> > > >  xe-y += \
> >> > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> >> > > > b/drivers/gpu/drm/xe/xe_configfs.c
> >> > > > index 12b7fe65446d..85df8ce5cf2a 100644
> >> > > > --- a/drivers/gpu/drm/xe/xe_configfs.c
> >> > > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> >> > > > @@ -1006,6 +1006,10 @@ static struct config_group
> >> > > > *xe_config_make_device_group(struct config_group *gro
> >> > > >                 config_group_init_type_name(&dev->sriov,
> >> > > > "sriov",
> >> > > > &xe_config_sriov_type);
> >> > > >                 configfs_add_default_group(&dev->sriov, &dev-
> >> > > > > group);
> >> > > >         }
> >> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >> > > > +       config_group_init_type_name(&dev->debug, "debug",
> >> > > > &xe_configfs_debug_type);
> >> > > > +       configfs_add_default_group(&dev->debug, &dev->group);
> >> > > > +#endif
> >> > > 
> >> > > I guess there isn't much we can do about it today, but, based on
> >> > > what
> >> > > I
> >> > > read in configfs documentation a while ago, I suspect it wasn't
> >> > > really
> >> > > designed with arbitrary hierarchies of config items in mind.  It
> >> > > would
> >> > > be nice if there was an API for that though.
> >> > > 
> >> > > Basically, a config group is expected to be a directory to
> >> > > contain a
> >> > > set
> >> > > of config items of the same type, which is not the case on our
> >> > > current
> >> > > usage (i.e. the "sriov" and now the "debug" group).
> >> > > 
> >> > > I guess we are able to get our desired behavior (basically just a
> >> > > subdirectory behaving as a config item) by not implementing the
> >> > > "make_item" hook.  Not sure if that's an expected use of the API
> >> > > or
> >> > > if
> >> > > that's more of a hack on our side and could come back to bite us
> >> > > in
> >> > > the
> >> > > future.
> >> > 
> >> > Hm.. ok that's good feedback. I do like bucketing these in groups
> >> > and
> >> > subdirectories. It also makes it easy to show or not show based on
> >> > the
> >> > Kconfig. But let me go through and make sure there isn't something
> >> > more
> >> > suited here. Happy to hear any other feedback as well here.
> >> > 
> >> > Thanks,
> >> > Stuart
> >> > 
> >> > > 
> >> > > --
> >> > > Gustavo Sousa
> >> > > 
> >> > > >  
> >> > > >         mutex_init(&dev->lock);
> >> > > >  
> >> > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c
> >> > > > b/drivers/gpu/drm/xe/xe_configfs_debug.c
> >> > > > new file mode 100644
> >> > > > index 000000000000..45617282cec5
> >> > > > --- /dev/null
> >> > > > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
> >> > > > @@ -0,0 +1,14 @@
> >> > > > +// SPDX-License-Identifier: MIT
> >> > > > +/*
> >> > > > + * Copyright © 2026 Intel Corporation
> >> > > > + */
> >> > > > +
> >> > > > +#include <linux/configfs.h>
> >> > > > +#include <linux/module.h>
> >> > > > +
> >> > > > +#include "xe_configfs_debug.h"
> >> > > > +#include "xe_configfs_types.h"
> >> > > > +
> >> > > > +const struct config_item_type xe_configfs_debug_type = {
> >> > > > +       .ct_owner       = THIS_MODULE,
> >> > > > +};
> >> > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h
> >> > > > b/drivers/gpu/drm/xe/xe_configfs_debug.h
> >> > > > new file mode 100644
> >> > > > index 000000000000..01170dc2f97e
> >> > > > --- /dev/null
> >> > > > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
> >> > > > @@ -0,0 +1,8 @@
> >> > > > +/* SPDX-License-Identifier: MIT */
> >> > > > +/*
> >> > > > + * Copyright © 2026 Intel Corporation
> >> > > > + */
> >> > > > +#ifndef _XE_CONFIGFS_DEBUG_H_
> >> > > > +#define _XE_CONFIGFS_DEBUG_H_
> >> > > > +
> >> > > > +#endif /* _XE_CONFIGFS_DEBUG_H_ */
> >> > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h
> >> > > > b/drivers/gpu/drm/xe/xe_configfs_types.h
> >> > > > index 935097aafa96..c9d94a3c26a7 100644
> >> > > > --- a/drivers/gpu/drm/xe/xe_configfs_types.h
> >> > > > +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
> >> > > > @@ -24,6 +24,9 @@ struct wa_bb {
> >> > > >  struct xe_config_group_device {
> >> > > >         struct config_group group;
> >> > > >         struct config_group sriov;
> >> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >> > > > +       struct config_group debug;
> >> > > > +#endif
> >> > > >  
> >> > > >         struct xe_config_device {
> >> > > >                 struct wa_bb
> >> > > > ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> >> > > > @@ -56,4 +59,8 @@ static inline struct xe_config_device
> >> > > > *xe_configfs_to_device(struct config_item
> >> > > >         return &xe_configfs_to_group_device(item)->config;
> >> > > >  }
> >> > > >  
> >> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >> > > > +extern const struct config_item_type xe_configfs_debug_type;
> >> > > > +#endif
> >> > > > +
> >> > > >  #endif /* _XE_CONFIGFS_TYPES_H_ */
> >> > > > -- 
> >> > > > 2.43.0

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
