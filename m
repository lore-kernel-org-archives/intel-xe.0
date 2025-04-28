Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6F7C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 20:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629B410E9F2;
	Mon, 28 Apr 2025 20:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGxvCG1/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF6E10E9F2
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 20:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745870956; x=1777406956;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g26Yuj/IiWVhC0f+U2VKbOqdR1tX8M46jUOKLQ0c6Eo=;
 b=SGxvCG1/MtXddd07eXYu7VFb1Ns0tXexj9dADyY3jnuH2nYPoEtmQrFM
 cagwz1pxppexwbpA2m0y8d2m6sKilar2gzNAS+I76Qfan9quHrsU8zmjf
 XJFMrBHArzzBzBFZckFCt9Sxx7wldKZqqltepFwJ0XGOrdV/3TwTbuZEF
 mHlQKO7Ef9dR6Q7kkus9oFGcQLWuqGDILkPh3EaYU8pFSCUIE7OikajNr
 J1pAvJU4SWJfUJA7+MKMQ0fujv77ETkwP2TW2j7n60zNLdjgaK25RYsAD
 BQnc/IGgjH7Y9k66hPgNasRZ7fnArtlDl10nGsPwBndJ8fABn+uxEcci4 g==;
X-CSE-ConnectionGUID: AGckdVxpSXm0d5fiF4NufQ==
X-CSE-MsgGUID: vQ5anjbiSMOC7ovAffPpZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47491656"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="47491656"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 13:09:16 -0700
X-CSE-ConnectionGUID: AfwiBx1RQ8uuhDxLbeKhsg==
X-CSE-MsgGUID: lenFGc/cQBG0ZcHXCtDKYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="134574052"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 13:09:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 13:09:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 13:09:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 13:09:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUUdFbNa0dqtuGELzuubq3ohLkAovG0rthZ/CetcZK7PEtUvBJnAfrW4FXW6ljhEtiRb3ngomi8wpo2aYJLzMyHVi8nEMhO5VJ3gz+tU0af+xKPn2awcpL+oBm586cSeHgTGzK3b5zg52SD5E4rJe1U9Yg/VLZfu/zLwgh/KTT0bdP0D5GouYI3bBU4AQ75yW+mUMUBrbhK54PC5JT88WS3wWVDLl7M/AIOcunGss4YHZd82+qZ2PcgubMbA70WcSW4xlLnxQ1Ajtf9CNmo1kIUAV7icwBvmjGybgb0DGw2HETdSXsWLJbSNMQbvxq+dXCK/A0ZehBwE74+Cy7xAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcbLOltDCzckNHPDpIVFzGUeFBaHvynFjOCnIPDn+eM=;
 b=jki4IYmyvposqYAMhNzujTGYGfYYqp46+kF374yi07wTULBwRRCeX7V5l7hvE70i/z5+6/x16f/uknJ3e4Qky9eyy/yX5yZ0T9jE3SxvLsHKS1oGAzT9dKNm6DrV5cXF6RENrgpeXXlm2u4DlSLBexnLs9eRRYpnJ+av5JWHl2+bwIsoyVEC+zcKufv5292Ars+K8RbJ+sXKTyJBkaVkq+7hGxijDd1j7w316IBEkOWnE9WHZdjyRJTfvkj77+BkRGGVwyPOHKOC5Y75R88k9zTU3+/wgCPkGRbE55lfOWZIBLEveREYtvKQxFuinSRhT60pRcEVcKYELUsg/nu+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ2PR11MB8402.namprd11.prod.outlook.com (2603:10b6:a03:545::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 20:09:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 20:09:09 +0000
Date: Mon, 28 Apr 2025 16:09:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v4 0/3] BMG PCIe Gen5 downgrade attributes and usage
Message-ID: <aA_gYVCQe1JEY_xB@intel.com>
References: <20250425140626.3082588-1-raag.jadav@intel.com>
 <aA9UlvQfo5-6-CtB@black.fi.intel.com> <aA_ebBh6mxsEJi1w@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aA_ebBh6mxsEJi1w@intel.com>
X-ClientProxiedBy: MW4PR04CA0166.namprd04.prod.outlook.com
 (2603:10b6:303:85::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ2PR11MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c1317c-d6d5-435e-525b-08dd86908902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sGiJ5n1eEyLlO249TiiBbJpX36pBm4t+KZw6nW20f35YfGa9OUDgIjRW+FIC?=
 =?us-ascii?Q?j1+5Iv0g6e793ibW7yjjggSn1lEYN9yTn3RATT59bOs1SPTnamssiisslTTb?=
 =?us-ascii?Q?VF1K3yH7Hqso/2+6i9QwfDFnPiqHHBODQbpUp3R/lma9oBzMUuZ+JRcMuvFL?=
 =?us-ascii?Q?M46xzgUShJfe3rnBtj/dAJv5uJc5AWXerwO/t9KersfW6RC9dEcwTv/xDxuj?=
 =?us-ascii?Q?mPmzLOMUuz9lR24YTxMpJRpT96yYdr7/LaKFpSOwibFjJ9mP0hehvIOqiQkU?=
 =?us-ascii?Q?RWN081eYWaQX0D3oD6IvbB2omSHZufuh4gmLwo6YqTLCruJT4s/K8FhqMX+J?=
 =?us-ascii?Q?ySblKYlMrSAQ51jIL7VCMLEHw81/biZduTznPmQ88srAeOcTY3XJu487xuKA?=
 =?us-ascii?Q?wrYayAnc1ZZsDF/An1IcTgUFAcHd8f+oc2Z7TX2CZgHJQYGfPHmh+mF1AB/Y?=
 =?us-ascii?Q?1pxvrsWw4mBFEX+AtgFAPWhlqP3HCfHwnqeAxZIXIIiddQgkemDsC80MYISL?=
 =?us-ascii?Q?CCP1IKRiLZHOdjA9U0szLiCgf+QT8bTrsFCJwbUn6bJogsHLS7ofs8CjyLEV?=
 =?us-ascii?Q?EQctD/+s5etP9RjM6xAjTnCGWUa/VUrxGIyw62Yxa1u5lpNbwhErVhO4GG09?=
 =?us-ascii?Q?u5AGVYPTV/dR3wV6EsKeRadsOMRvNZQdhf8d4BppRUQdCp5lBT1PBXskECj1?=
 =?us-ascii?Q?aPb9ALBQX7do8Zv6gychL7RXGB2gFYWL3HF5G4+5+0PgnHNNxQoEv+5eTa6G?=
 =?us-ascii?Q?E0TUUhUglJIecWYjFD0AJZji+KneArmm0lgzv78WdGkPATx0FNB9021zgGH9?=
 =?us-ascii?Q?zmN38XqgR4rR+FahZxLZPQOAy+xsLctwVSAJsfawPMB1zGt11Ade/Hb6ze+/?=
 =?us-ascii?Q?lbGY8yC6kZV74a7n5UvAC8FPEOEnAw+hkvZ8qrbHELqgzpYHySQ/okOIbnmO?=
 =?us-ascii?Q?tVs2SiMfefwVXBetB3NsKJbZTh68PvKN3wZf1xtebpZdKz+fyGiZ8GOFGsBX?=
 =?us-ascii?Q?8qnE2NVoN+YUKsJF5pTfhipj2Yz7MJpf/vqGR4Lkq2k9UETf8aMjXGCyUYFA?=
 =?us-ascii?Q?CWugI9S2aNEzj/9HFYEOdfoa1VLQegom7fM7T7qS19F0cM4cBovZb8bIvIg/?=
 =?us-ascii?Q?ILcPsWGe3n3PuTalGd7GFNA2evTiyZbJFHYvXWwjuRmNxi+N7oJcR55FPSbJ?=
 =?us-ascii?Q?m9lWHTPEs5lZuvRbmYAzyY5sNUmQdTirA+oOSJ2UBs1eeEL4fbwnH7bMwU7V?=
 =?us-ascii?Q?7bfUR59y5895HSNPU3MsxgFb0RXYqtwT7IF5g3VJF8a6w6bjVc4bJg9Bfkl+?=
 =?us-ascii?Q?Jj3Q+CaeEhTb8fjF+5vF27yBOuCAAnwKaHr5OlbEdW8O4GIKqACrd4n7JAuP?=
 =?us-ascii?Q?VmuZ4Mg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FaBnc4LI1NEfFykdrE5e7aklhZVjW2/s88YzX7ud/0YQ9gCzggL86Elk2aSm?=
 =?us-ascii?Q?mfeDxzhEWAXo4aEo7XX6fgbLR+B1onR1STsU/+VNr4jp6dGRNisDBZkOsEOa?=
 =?us-ascii?Q?S7jYXRrRF4VqU6JPyti769rN0/N6brSXoVIxm8AL1nhBuiImdBOWm9YXfh4D?=
 =?us-ascii?Q?TtefIX1kuNlpFH6uvDOr6hsgEYy9FyRs0IV9T4rjUGVjyI5LopdLSE9PlVGe?=
 =?us-ascii?Q?ACkCDVG1GP+aYUCrUjy8bYG9QksN6uRbGeSlKZRRcz3QXLcGhnOe5EAd887v?=
 =?us-ascii?Q?J0N/dPTDZGDeVnSLIFJxwF8SMtPso5glRNg/CbUWxRKFfJ+r9XAvRTnhSzhS?=
 =?us-ascii?Q?AFNCXmZVJeIyCcgEhugkX/hUpsxnPHBYHnTV1ltZwqCYUwyvZv8fAzrDo/sA?=
 =?us-ascii?Q?Hah6t83Xu+VVUnD6aXuB02IyQ3E7ZvHV+4jOXh7R6uBvETziMcqbOmQm/now?=
 =?us-ascii?Q?biUD9nofLrKPvVxSruFS/XILAkqoIm74GswMaf9nCvHO1ggpANBc8V/kQlfg?=
 =?us-ascii?Q?+vRNSJqKAhh1up2368H+8JDf23En2EY+sU3BpalHmuy0zBNiPGrXFYPVNG3G?=
 =?us-ascii?Q?Wi5RhcRO2tSaIV3UUIVkTsHChbFl9LaEo0V+ZdJ6NYIFEfxJ1WSD568Fh+Zj?=
 =?us-ascii?Q?UsWGTp5d3WgvaQY2OZb2QRPteD/9MVJlylkJ+EPWvnFR+yeREys0F447gQif?=
 =?us-ascii?Q?0VUX6Ienxm3elG7X/tC+QHIgJ4FohQnSCUUt3/O3AGS/HXkTEixWhR3Y1P5i?=
 =?us-ascii?Q?TRlYkXaB1d4ElimtJh36K/u5tZizd5q0BvjbqjDBHuf9UU0pYjElWXUx2u71?=
 =?us-ascii?Q?jvrhKzhMLtOusEWdnQ7/D0A9HkiSj84X5Pwbw5w0TVdvfGldOz1Uv+p43BrP?=
 =?us-ascii?Q?BNmMk29cfw48cYrKF8gOObQuZmo1m/kZm/lfUPHmdAr8RD9xwaZv4AUfaJCL?=
 =?us-ascii?Q?VQKbaNaN1HQSJ2Tg/X8GUBzbUOdcA0eM1wS30gTqzutDfXgLW9QOPf2QbwLe?=
 =?us-ascii?Q?PzS65QjcPNOmC4vYhC9u9PwFprWttOHoWqYC8Uv7mv8CxFXd7EYAP2K9uXtu?=
 =?us-ascii?Q?WVbFA6rS5oMbm38EV5b0Swj6JSxumNKBPQgvyJH++m2JVNxHr6kxI52PUt4y?=
 =?us-ascii?Q?0Y7uD+UD06GSwcniCvmumfA84l4oS8NQfD9FxhOOEh9OYc5mCW9DbOr+j9XF?=
 =?us-ascii?Q?TSdrNv3FRxYkQssCkcs5KF+qM4Gg8+PpP3XAsOHqA2P7fq8PtvJuXrxhty7V?=
 =?us-ascii?Q?tVeZw/D99uHHMP1PSv5xnDfIYF4N85ZWBPo97/dYN6tKAk+uA4dIjP2BHscT?=
 =?us-ascii?Q?7tqh7bbf7wYrvcOHODdM+DxDrfKQC9/c1y42z63lIPNLt/OwCpMR/xLyF/Wp?=
 =?us-ascii?Q?H/g8Fstg7F8OM8VhDoQQa/7d/2pnuEiGtbUdwsnEArSGsAncx3dAddq5ORH1?=
 =?us-ascii?Q?bTM1Km9BK7DgNJ7INZzOH7YBCyUBwK5u4ora1zhb904+aK4jWJyj8K744F44?=
 =?us-ascii?Q?yl7DI49h28rQft5la63OWSjBtWUYVlcsEAItiNHzo+1g6lokujmbYSwtqdtg?=
 =?us-ascii?Q?LKy0BpzdW6tRtBHzp0ZT316E3y9fjjK0Z/R3I8GTOg2uS0CAlBsTqQXnoczo?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c1317c-d6d5-435e-525b-08dd86908902
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:09:09.0509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LZchuAeqxallEEuod+wAp9ZlmRZIyowInwtERxv1rsZRorzU4a8HdaaG7giZZi9+ZsqaG5x6gkwuOCKRyy4uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8402
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

On Mon, Apr 28, 2025 at 04:00:44PM -0400, Rodrigo Vivi wrote:
> On Mon, Apr 28, 2025 at 01:12:38PM +0300, Raag Jadav wrote:
> > On Fri, Apr 25, 2025 at 07:36:23PM +0530, Raag Jadav wrote:
> > > This series exposes sysfs attributes for BMG PCIe Gen5 downgrade and
> > > documents their usage.
> > 
> > Anything I can do to move this forward?
> 
> I almost push it here, but then I noticed that it is gen5_downgrade.
> Hadn't we agreed to follow what spec says so?
> 
> "to then automatically persist the Gen4 downgrade flag in Flash"
> "Write Gen4 Downgrade bit to MRC Flash File"
> 
> == Applying  PCIe Gen4 Downgrade ==
> 
> Although I see that there are some mentions calling "Gen5 downgrade", "Gen4 downgrade" seems to be the most used term in the specs, specially when calling bits and
> sections names...

Because of the inconsistencies and our back and forth here and to get prepared
for future cases where we might need to downgrade from gen6 to gen5, the current
Architecture recommendation is to simply go with

so /sys/bus/pci/devices/<bdf>/pcie_gen_downgrade_{status,capable}

The specs are going to be updated to reflect that.

Thanks,
Rodrigo.

> 
> 
> > 
> > Raag
> > 
> > > v1: https://patchwork.freedesktop.org/series/147023/
> > > 
> > > v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
> > >     Rework macros and their naming (Rodrigo)
> > > 
> > > v3: Move xe_device_sysfs_init() to xe_device_probe() (Riana)
> > >     Use sysfs_create_files() (Riana)
> > >     Fix checkpatch warning (Riana)
> > > 
> > > v4: s/gen4_downspeed/gen5_downgrade (Lucas, Rodrigo, Riana)
> > > 
> > > Raag Jadav (3):
> > >   drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
> > >   drm/xe: Expose PCIe Gen5 downgrade attributes
> > >   drm/xe/doc: Wire up PCIe Gen5 limitations
> > > 
> > >  Documentation/gpu/xe/xe_firmware.rst |   6 ++
> > >  drivers/gpu/drm/xe/xe_device.c       |   5 ++
> > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 107 ++++++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
> > >  drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
> > >  drivers/gpu/drm/xe/xe_pm.c           |   2 +-
> > >  6 files changed, 123 insertions(+), 3 deletions(-)
> > > 
> > > -- 
> > > 2.34.1
> > > 
