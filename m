Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A02FCF395D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 15:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FB110E0E6;
	Thu, 19 Sep 2024 15:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEQ/vzJO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EC610E0E6
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726761528; x=1758297528;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YGHYZkWm+Rl+NEWLfePVlQ0NLOYkFx4uBjOSfsiGCO8=;
 b=gEQ/vzJOcdcbHOwDSvClXbfD7gYZYIDm1qEXAqL8KRZK55sPYkH/8xQK
 redSfTnCc8gm9TuukF8X2ohW5L1JaF5ZnPD4eY22IG+tHXrjKQ+P+w+od
 uqPty2++6V0icf8j9OaD2qD4f/etCh1bZNeo0mH4NOD0dpvv1Q6+lu9Co
 qnP//MEgaB/Ll5eDqoUHueS0CDTDJ6gOEYJyJetMjKNlh8+Nyrki95std
 fbBWtu23Ejcx64MIQh+4bwU3/YtFmOCEhFQroyd8kjznvjxLs671cdXWV
 DwLmrqKD9dk9xeU3Oies86qhLqjq5tfPz6cle7CsxaZBjp0MyTInaMhg5 Q==;
X-CSE-ConnectionGUID: uF9bvXxcTRGhV/LlJ8fukg==
X-CSE-MsgGUID: VhZWw7VjQ/WFxnRAbZ0PNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25214574"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="25214574"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 08:58:48 -0700
X-CSE-ConnectionGUID: XB6+9d5PR4KPyjzncGzdmQ==
X-CSE-MsgGUID: xfZ6dNmxTWeehMQLCpNJNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="74333437"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 08:58:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 08:58:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 08:58:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 08:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeLuFvlNBeWCqcXwAdjbT5bFIp5Qq5Ap/4efuHPU3+yObb90b2DFlX0XKtHH5+5MbhICQcL2tTbpAQTXpL0kqYhq6HsDQEWGKFs6QE/2MKp9PV/TEjS4eO//tOUyIK6KqJGQ/tr2P29dBleD2C1O4TeLCJqNVOoNUAOxoy1OSYBnAlkYwdJOpQW8OETC95PZJ0pqSB18FzWV0CayVr47sWHWJ1WW3q8FB5yIskicf0zydLvz5E/w/03y7+8wAuTzZdFNWPvF7AfFRFJaxorIg2f9h580TVQo8bXtc5l3ZUov/4q/ldT7RiFX945NFErSxLz5UGRZ/c0DyMkR3DSHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwdhm88gTVAGFYbrlz40supxBYNGDTjkczcZVokbwzw=;
 b=Qr0Ne2SDmwk4LXQOYASxHVKjsI+wgl67E52bsNB69RLxyTRZm3ga3OoDaOVcRixzqmsT32Hu1vzpHhKbmv5mLbbINJfiOIAxRbpES9xE72isuQlQ9CY8ynW/GSzldMSydFZGAWVrJA/VudQlduP7hZoS/zCMOia/VTZh1Q85feKJt0VJCMkG68DdEWzAbxUvQ5ZvYWqUaVOu2cSR6nii+zb0zUN4rR+zOnE4g4/SLBESaxV49QBsu/BX4j5roeERpMa4gJZCHjpg2IuL8yksCkKp4d3K+cJigjPpKsF10oW4/oYdLwYwONfPOCnjbEjT/tX/nNgYnO/lDSiDPzv17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7647.namprd11.prod.outlook.com (2603:10b6:a03:4c3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 15:58:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 15:58:38 +0000
Date: Thu, 19 Sep 2024 15:56:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
Message-ID: <ZuxJyhzma21PF+Zw@DUT025-TGLU.fm.intel.com>
References: <20240918164740.3955915-1-oak.zeng@intel.com>
 <ZuseA6s2nip+PbTC@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB315944FFB3DE254952FE298592632@BYAPR11MB3159.namprd11.prod.outlook.com>
 <ZuxHslDgHJem4LJT@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZuxHslDgHJem4LJT@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa0a0d8-ed0b-4dc1-e808-08dcd8c3ecf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m1Pr/w6pLVsEVdzx7EQs0EyCcU4dD3FUjoL9U+nDqxfX8J4/xe7Q4dMAd3Vn?=
 =?us-ascii?Q?kOEZAPTSurYIpLVzyOf3ot0T3YC2okYK6yKL9Kot4de4J4bF7Bs+5D4V3xjj?=
 =?us-ascii?Q?i26mYsyIArFMneYrj2E6WwXZL5oO7mX6ni7Fy6If8fDbuelgtW2X9P5jVkMZ?=
 =?us-ascii?Q?EuEvuqylPt4k/WKGqToEl/rie6wzLNhJYi1reg8SR7Kb9lR3EtlTVnYpr+yX?=
 =?us-ascii?Q?VdqA8F5lUPtTNl6xBIeNR40w/OueV0jESNv+jePEuc/kL5zn7NsSY9TimSmD?=
 =?us-ascii?Q?mOzHBE9lJeElxOFkDEoHr2H6hsEiqQ7HOvspyJGVlt388X65lJF5Muh5x9ea?=
 =?us-ascii?Q?k5LE66q3Clw5GmkMASCPp7FbJbFpV0/BRBa7MP8NIBzjNsrq2erVyaeYGG9a?=
 =?us-ascii?Q?hW4dAEMNF4Pp4qFPm+P3Q6cijJLn1H1Dh/jmGdPUYdMGF9TiqM0bvVgl335x?=
 =?us-ascii?Q?qRjNb1qkcV0LP8re3U/4StcAvjRipdtkbn5AEd0weahlEUQk9kY15JbBOm3i?=
 =?us-ascii?Q?5guJKBy9PVhxDyERF6qUhfnJlAlbEuhxoVvigr8ukOeAJ9H4LO/UAbqhSD9V?=
 =?us-ascii?Q?hTNu+yFHpwI4cdj6wNJPRcrwWWasHTShrPL15pDXhOLjNC/x04rKChaEx++/?=
 =?us-ascii?Q?qu77HSxiU4B0HJO414F6BcM3G5fnU1VdtxuLxSFhRQrP3Kv6p03n+8J3GSPw?=
 =?us-ascii?Q?W9IY3l9fnCy5kbUFASaT8pXwYEJtg/Hxud6C7s6p/wQhhQ9WXFCHkcOffdM3?=
 =?us-ascii?Q?aoV1KARmiZYrTK5ScSucRf1LbiUPEPy86bj9v5xAuefmQhukHPx0VzQWKBh+?=
 =?us-ascii?Q?jsI5h8UsWJaQht4q3HIx42bDbV16lM87IZ3JBwHeCBwL7sAy0UnsmZiv93e/?=
 =?us-ascii?Q?5jsigYpguvvmh7xDRX5Ef6EceFiZNLe7eM/i7xfKaA4ZaXJ22+WO3ST80XOt?=
 =?us-ascii?Q?7EhvaZqGQuJhqE01Wl1N5SlLnkPwY38cbsyNg3aQt7o/YWhELtDtJuwYuY9p?=
 =?us-ascii?Q?9UaGCRDjVNJuZJafyKWIXlozCnuAGSYawn57sjLp+LxLMHaaaRp6Hx5zQAmP?=
 =?us-ascii?Q?H5s4LdWMOKPKQGLrUXyAcWArzai4FzJ0AL27Z09zLBKWq3SM9dtitm/5HukD?=
 =?us-ascii?Q?Q8jRslgbohoci3UX2tZJfZhhlSrVWKT3TAJnsSoexiXoWMlXjvqUN9jmCfAe?=
 =?us-ascii?Q?eOn3ZvuSojfLp6JpmMKrS6Rp+3v2GhzSK6vUED3/QaeQCiVH+TcHQs+SoFzt?=
 =?us-ascii?Q?Cp2M409W3fWGCnJEaQfu6oUqnXT66LzgDLv39E0Do+Yf+bdOpW0gCD/Ud3Dl?=
 =?us-ascii?Q?gbKtrHYnuxwhL1NXeMnm646/hnh1GdZ4ZqOL/bnh10rr7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z/oI7MCp0S0LjxH+a1PXcTJFZ88mAJdLT5LjHiC0keOE9jnAzDAmoXDSk805?=
 =?us-ascii?Q?zWab6sPA39rNKtG4zyNO3DvVf8CqANCWeiVh4VcoCUiie6+3hei+6BxzbJ+v?=
 =?us-ascii?Q?J0AumVBA6mt/rDZr/OLT5ak+C4pA27k/O9gOTvQZHsz9kh3ICjagNAQAfSh8?=
 =?us-ascii?Q?BCRA3gNWklYYbJZyS2NlomWzcnN3ZnNOutnn7CS4hFUQF6TgyHOjf5abyk2H?=
 =?us-ascii?Q?R5RRxqwlu1iLypz/VjmqorZTHqaadNGEV34CrobpKr4N614YUKqjH7dT6HZw?=
 =?us-ascii?Q?ekDxR4DLfVm0iVa4d914qUp50I5/MlE8b8fOCdinIMIWwUUKh3QUaPxWc8MW?=
 =?us-ascii?Q?dRuT5IwiGLGtGu5Sap4aZWwi3xTC74U7ih0bF3OLozHpykgsRSLot4zExB0K?=
 =?us-ascii?Q?sm7mlOpvpjqyNRB61U9YwiTyCl61gZup5TJ2bMq3dTCJr4iOvtsy6uzitP2o?=
 =?us-ascii?Q?XKOL8YB+Uld2MUpgU3sxQWMxNNeLTbCRTwz7u0NIHgFuw5HQustGNIHK9qMq?=
 =?us-ascii?Q?BWwUPpIiAoEIoeOa6YqPF+KHHhZqAWsNN7qBAP7GdlUfHOi+r24gGMHkKaSu?=
 =?us-ascii?Q?I7JmhzFDctkIE6z2FDUxfrIRUNYOL01lb4GKisHNrVhfNyTMpHDy/OnWPFHu?=
 =?us-ascii?Q?2AqJJLBBtZZ4g2kFqb+Gmj2P6MqnKtRRSc8NdupR7VsLUzmK5tTHHydYgN9M?=
 =?us-ascii?Q?MGtmSOYeGY1I6N6ylml1LmqE34evbjDBVMtb1u+14ocdmDtBr84Rt+rEJsNL?=
 =?us-ascii?Q?DAvp2zdj0slp78qUcbS630U4gxOCK7s/f46tPKuYnEpIWQDjxYL5qhqwhktO?=
 =?us-ascii?Q?ljG1+pTToL384KnFn5Vo1i2VfaQ9zKMXzGHcs7myDj1icxQwyc7Tht2Gz6xD?=
 =?us-ascii?Q?6THF+AV0wyBcxHJwjpAEZetbZbo5gWjRCKWNEekRdYU9p1RMdT7q4aAd5Urs?=
 =?us-ascii?Q?bk0Z+t1kkpBRnGjPvmWpus7NLYQNg2G3583ovqQuGHjuWR/wQK2lnFWf05I8?=
 =?us-ascii?Q?ocwzI+ODYlly+Vonn+ZEJHU7W7FfhlkNUIqIUeNIiazBvev6uAPN4JLbMcbS?=
 =?us-ascii?Q?gDlY7XUVRWe7RYyA7TIyZRbaCkvAnJOMF1IkYA6V1NuWcDighCa0m+sy7dX9?=
 =?us-ascii?Q?iP4M+erWsH1h44G9Im4PU0KpNrJAptvlA07i7Ym/sQKGy0CLOyY5z9AdkMfc?=
 =?us-ascii?Q?YTekThdWJBkzv0fCAyADqxx/M5OUCNgjy+Bh1lwsTGnOiGDJHPNezbIcHryj?=
 =?us-ascii?Q?qhmpUNRQ4qXOnPoyofzULGsAuj4aO8IN0jcrfrIiG88uQIlj2gK9YqHdO3O9?=
 =?us-ascii?Q?WLMA70cg4dfNHRbhYLenWdw7ZkYQZE8XUp6/yILDNQoUzrEOWbx13MomwvY3?=
 =?us-ascii?Q?udP/e82uXfc85Bmh/JYV2Xo4M3resjReMZApVqn+LADp2cpJ+RhaZFk4RMnf?=
 =?us-ascii?Q?SdLC/FqbfoWyFyoKXBYrzDceo0tu/UgUSjjVHhznvwIkDwTw0tBKnYXRp8YZ?=
 =?us-ascii?Q?4pHBfX22FNSleT/nCXo4G8T76p29dxydK3+7GdIIQRl+v7zOmwfd/f0QUKjS?=
 =?us-ascii?Q?zSWovykvkGnhAL+ReERygfp741zsczAONJAnoiigPXsXX7MaXkR7Atui0MwK?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa0a0d8-ed0b-4dc1-e808-08dcd8c3ecf2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 15:58:38.6936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msTMa5r1HDJsRJhe+R2NBWzb1H0DSNoCZfpO4cDMAwpAb+e6bZUgoZKKBM48BpCsdiS2SyoxKBGco6lLC0kv9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7647
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

On Thu, Sep 19, 2024 at 03:48:02PM +0000, Matthew Brost wrote:
> On Thu, Sep 19, 2024 at 09:09:57AM -0600, Zeng, Oak wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, September 18, 2024 2:38 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; dakr@redhat.com
> > > Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during
> > > a map operation
> > > 
> > > On Wed, Sep 18, 2024 at 12:47:40PM -0400, Oak Zeng wrote:
> > > 
> > > Please sent patches which touch common code to dri-devel.
> > > 
> > > > Considder this example. Before a map operation, the gpuva ranges
> > > > in a vm looks like below:
> > > >
> > > >  VAs | start              | range              | end                | object             |
> > > object offset
> > > > -----------------------------------------------------------------------------------
> > > --------------------------
> > > >      | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000
> > > | 0x0000000000000000 | 0x0000000000000000
> > > >      | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000
> > > | 0x0000000000000000 | 0x0000000000000000
> > > >
> > > > Now user want to map range [0x00007ffff5cd0000 -
> > > 0x00007ffff5cf0000).
> > > > With existing codes, the range walking in __drm_gpuvm_sm_map
> > > won't
> > > > find any range, so we end up a single map operation for range
> > > > [0x00007ffff5cd0000 - 0x00007ffff5cf0000). This result in:
> > > >
> > > >  VAs | start              | range              | end                | object             |
> > > object offset
> > > > -----------------------------------------------------------------------------------
> > > --------------------------
> > > >      | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000
> > > | 0x0000000000000000 | 0x0000000000000000
> > > >      | 0x00007ffff5cd0000 | 0x0000000000020000 | 0x00007ffff5cf0000
> > > | 0x0000000000000000 | 0x0000000000000000
> > > >      | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000
> > > | 0x0000000000000000 | 0x0000000000000000
> > > >
> > > > The correct behavior is to merge those 3 ranges. So
> > > __drm_gpuvm_sm_map
> > > 
> > > Danilo - correct me if I'm wrong, but I believe early in gpuvm you had
> > > similar code to this which could optionally be used. I was of the
> > > thinking Xe didn't want this behavior and eventually this behavior was
> > > ripped out prior to merging.
> > > 
> > > > is slightly modified to handle this corner case. The walker is changed
> > > > to find the range just before or after the mapping request, and
> > > merge
> > > > adjacent ranges using unmap and map operations. with this change,
> > > the
> > > 
> > > This would problematic in Xe for several reasons.
> > > 
> > > 1. This would create a window in which previously valid mappings are
> > > unmapped by our bind code implementation which could result in a
> > > fault.
> > > Remap operations can create a similar window but it is handled by
> > > either
> > > only unmapping the required range or using dma-resv slots to close
> > > this
> > > window ensuring nothing is running on the GPU while valid mappings
> > > are
> > > unmapped. A series of UNMAP, UNMAP, and MAP ops currently
> > > doesn't detect
> > > the problematic window. If we wanted to do something like this, we'd
> > > probably need to a new op like MERGE or something to help detect
> > > this
> > > window.
> > > 
> > > 2. Consider this case.
> > > 
> > > 0x0000000000000000-0x00007ffff5cd0000 VMA[A]
> > > 0x00007ffff5cf0000-0x00000000000c7000 VMA[B]
> > > 0x00007ffff5cd0000-0x0000000000020000 VMA[C]
> > > 
> > > What is VMA[A], VMA[B], and VMA[C] are all setup with different
> > > driver
> > > specific implmentation properties (e.g. pat_index). These VMAs
> > > cannot be
> > > merged. GPUVM has no visablity to this. If we wanted to do this I
> > > think
> > > we'd need a gpuvm vfunc that calls into the driver to determine if we
> > > can merge VMAs.
> > 
> > #1, #2 are all reasonable to me. Agree if we want this merge behavior, more work is needed.
> > 
> > > 
> > > 3. What is the ROI of this? Slightly reducing the VMA count? Perhaps
> > > allowing larger GPU is very specific corner cases? Give 1), 2) I'd say
> > > just leave GPUVM as is rather than add this complexity and then
> > > make all
> > > driver use GPUVM absorb this behavior change.
> > 
> > This patch is an old one in my back log. I roughly remember I ran into a situation where there were two duplicated VMAs covering
> > Same virtual address range are kept in gpuvm's RB-tree. One VMA was actually already destroyed. This further caused issues as
> > The destroyed VMA was found during a GPUVM RB-tree walk. This triggered me to look into the gpuvm merge split logic and end
> > Up with this patch. This patch did fix that issue.
> > 
> 
> If a destroyed VMA is in the RB tree that would be a big issue and
> definitely would need to be fixed. 
> 
> Adding a test case to show the issue you describe would be good. Also if
> we end doing something with merging adding a test case for the
> description in the commit message would also be good.
> 
> > But I don't remember the details now. I need to go back to it to find more details.
> >
> 
> That would be good.
> 
> > From design perspective, I think merging adjacent contiguous ranges is a cleaner design. Merging for some use cases (I am not sure
> > We do merge for some cases, just guess from the function name _sm_) but not merging for other use cases creates a design hole and
> > Eventually such behavior can potentially mess things up. Maybe xekmd today doesn't have such use cases, but people may run into
> > Situation where they want a merge behavior.
> > 
> 
> I don't think Xe has a current use case, but the situation you describe
> is very similar to a system allocator case where we would want merging.
> 
> Simple example below.
> 
> Initital State:
> VMA[A] 0x0000-0x0fff - System allocator VMA
> VMA[B] 0x1000-0x1fff - BO binding VMA
> VMA[C] 0x2000-0x2fff - System allocator VMA
> 
> User op:
> Bind 0x1000-0x1fff to sytem allocator
> 
> Ideally we really want this final state:
> VMA[D] 0x0000-0x2fff - System allocator VMA
> 
> The without merging like above as BO bindings are bound / unbound the
> system allocator space will get fragmented into lots of VMA which is not
> ideal.
> 
> So here 1) from my list is a non-issue as UNMAP system allocator VMAs
> don't interact with the hardware. 2) could still be an issue as VMA[A],
> VMA[C] could have different caching or migration policies.
> 
> > If we decide only merge for some case but not for other cases, we need a clear documentation of the behavior.
> >
> 
> If this was added merging it likely would a be optional user controled
> thing. I suggested a vfunc or something to test for merge condition, we
> could just use a user defined cookie attached to VMA that GPUVM could
> match on for merging (also could be used as enable merging if cookie is
> non-zero). That actually seems pretty clean.
> 

To be clear here s/user/driver

Cookie would encode driver VMA attributes (caching or migration
policies) into an opaque value which then gpuvm can test if this value
is equal on adjacent VMAs.

Matt

> Matt
> 
> > Oak
> > 
> > > 
> > > Matt
> > > 
> > > > end result of above example is as below:
> > > >
> > > >  VAs | start              | range              | end                | object             |
> > > object offset
> > > > -----------------------------------------------------------------------------------
> > > --------------------------
> > > >      | 0x0000000000000000 | 0x00007ffff5db7000 |
> > > 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> > > >
> > > > Even though this fixes a real problem, the codes looks a little ugly.
> > > > So I welcome any better fix or suggestion.
> > > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_gpuvm.c | 62
> > > +++++++++++++++++++++++++------------
> > > >  1 file changed, 43 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > > b/drivers/gpu/drm/drm_gpuvm.c
> > > > index 4b6fcaea635e..51825c794bdc 100644
> > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > @@ -2104,28 +2104,30 @@ __drm_gpuvm_sm_map(struct
> > > drm_gpuvm *gpuvm,
> > > >  {
> > > >  	struct drm_gpuva *va, *next;
> > > >  	u64 req_end = req_addr + req_range;
> > > > +	u64 merged_req_addr = req_addr;
> > > > +	u64 merged_req_end = req_end;
> > > >  	int ret;
> > > >
> > > >  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr,
> > > req_range)))
> > > >  		return -EINVAL;
> > > >
> > > > -	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
> > > req_addr, req_end) {
> > > > +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
> > > req_addr - 1, req_end + 1) {
> > > >  		struct drm_gem_object *obj = va->gem.obj;
> > > >  		u64 offset = va->gem.offset;
> > > >  		u64 addr = va->va.addr;
> > > >  		u64 range = va->va.range;
> > > >  		u64 end = addr + range;
> > > > -		bool merge = !!va->gem.obj;
> > > > +		bool merge;
> > > >
> > > >  		if (addr == req_addr) {
> > > > -			merge &= obj == req_obj &&
> > > > +			merge = obj == req_obj &&
> > > >  				 offset == req_offset;
> > > >
> > > >  			if (end == req_end) {
> > > >  				ret = op_unmap_cb(ops, priv, va,
> > > merge);
> > > >  				if (ret)
> > > >  					return ret;
> > > > -				break;
> > > > +				continue;
> > > >  			}
> > > >
> > > >  			if (end < req_end) {
> > > > @@ -2162,22 +2164,33 @@ __drm_gpuvm_sm_map(struct
> > > drm_gpuvm *gpuvm,
> > > >  			};
> > > >  			struct drm_gpuva_op_unmap u = { .va = va };
> > > >
> > > > -			merge &= obj == req_obj &&
> > > > -				 offset + ls_range == req_offset;
> > > > +			merge = (obj && obj == req_obj &&
> > > > +				 offset + ls_range == req_offset) ||
> > > > +				 (!obj && !req_obj);
> > > >  			u.keep = merge;
> > > >
> > > >  			if (end == req_end) {
> > > >  				ret = op_remap_cb(ops, priv, &p,
> > > NULL, &u);
> > > >  				if (ret)
> > > >  					return ret;
> > > > -				break;
> > > > +				continue;
> > > >  			}
> > > >
> > > >  			if (end < req_end) {
> > > > -				ret = op_remap_cb(ops, priv, &p,
> > > NULL, &u);
> > > > -				if (ret)
> > > > -					return ret;
> > > > -				continue;
> > > > +				if (end == req_addr) {
> > > > +					if (merge) {
> > > > +						ret =
> > > op_unmap_cb(ops, priv, va, merge);
> > > > +						if (ret)
> > > > +							return ret;
> > > > +						merged_req_addr =
> > > addr;
> > > > +						continue;
> > > > +					}
> > > > +				} else {
> > > > +					ret = op_remap_cb(ops, priv,
> > > &p, NULL, &u);
> > > > +					if (ret)
> > > > +						return ret;
> > > > +					continue;
> > > > +				}
> > > >  			}
> > > >
> > > >  			if (end > req_end) {
> > > > @@ -2195,15 +2208,16 @@ __drm_gpuvm_sm_map(struct
> > > drm_gpuvm *gpuvm,
> > > >  				break;
> > > >  			}
> > > >  		} else if (addr > req_addr) {
> > > > -			merge &= obj == req_obj &&
> > > > +			merge = (obj && obj == req_obj &&
> > > >  				 offset == req_offset +
> > > > -					   (addr - req_addr);
> > > > +					   (addr - req_addr)) ||
> > > > +				 (!obj && !req_obj);
> > > >
> > > >  			if (end == req_end) {
> > > >  				ret = op_unmap_cb(ops, priv, va,
> > > merge);
> > > >  				if (ret)
> > > >  					return ret;
> > > > -				break;
> > > > +				continue;
> > > >  			}
> > > >
> > > >  			if (end < req_end) {
> > > > @@ -2225,16 +2239,26 @@ __drm_gpuvm_sm_map(struct
> > > drm_gpuvm *gpuvm,
> > > >  					.keep = merge,
> > > >  				};
> > > >
> > > > -				ret = op_remap_cb(ops, priv, NULL,
> > > &n, &u);
> > > > -				if (ret)
> > > > -					return ret;
> > > > -				break;
> > > > +				if (addr == req_end) {
> > > > +					if (merge) {
> > > > +						ret =
> > > op_unmap_cb(ops, priv, va, merge);
> > > > +						if (ret)
> > > > +							return ret;
> > > > +						merged_req_end =
> > > end;
> > > > +						break;
> > > > +					}
> > > > +				} else {
> > > > +					ret = op_remap_cb(ops, priv,
> > > NULL, &n, &u);
> > > > +					if (ret)
> > > > +						return ret;
> > > > +					break;
> > > > +				}
> > > >  			}
> > > >  		}
> > > >  	}
> > > >
> > > >  	return op_map_cb(ops, priv,
> > > > -			 req_addr, req_range,
> > > > +			 merged_req_addr, merged_req_end -
> > > merged_req_addr,
> > > >  			 req_obj, req_offset);
> > > >  }
> > > >
> > > > --
> > > > 2.26.3
> > > >
