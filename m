Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F6EC87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 20:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACAF10E065;
	Fri,  1 Aug 2025 20:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cy3gkm3r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CBB10E065
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 20:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754081501; x=1785617501;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2wrjyRj+dbAZTAWXzDG4mCNeyNvIZhRkUxSWxJd3wn8=;
 b=Cy3gkm3rXzMLlv/+ynPgE9Bkr2bkHtrXc86p04PgwIvAesaal3hKlNm7
 wP6rmpCTZb+26ayjiIKXXo4mIyP0kFEnrSavVNW9IOYJbINKww+riXxMM
 WlGELtw8OqMvmDt16XJuq2vhDs1yPpw7j+sFshAWrSeMILDaf3ZdnHyA2
 Bxc6MI6p9lbKsC76/JvytTgEUouRGhtWme34YdUHU6L7ewDaoUS7vVCda
 oA06o8U7oOp1EWSBuaBjzw8QUXoc7HqOucxBlgeQkOQHYY3gnW1v2wRIJ
 8IcsTf8c0HohfkGVF/fxZmWec/RqiXZgaRZWl/TD0xP5eOgFcHFNbYt0/ g==;
X-CSE-ConnectionGUID: YX86BBbVTRa4TKGiGUhTZQ==
X-CSE-MsgGUID: 2G1kVnsLTOqKbUCQo0bOCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55496648"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55496648"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:51:41 -0700
X-CSE-ConnectionGUID: VbZ4DXbtSsymd3lgqpApuA==
X-CSE-MsgGUID: mgjH/MvTTFuZIAaCOD9zag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194486853"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:51:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:51:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 13:51:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.67)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 1 Aug 2025 13:51:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3znTcPbC3DR8/jNsg1yejNpI8QURz9n4bmnRp07ZpHDnrrZ3NqWhNEamAFOpRzkMzYA+B6pf9gUNhuH6D2+pX/BZvI3ucaXsAGzyFrHjlW1ygyDUf4ZDRRLZYlOUZLDgYZF/+QobhWvZaMgIY37MGO4leoTYBwjBLrH80dWUE1ugHCHNvTpA/KS9V0LI4mRjGc314zH7aETDPsU/ahJCAWCbQySOcGRkMI3rXSZ1X8FLJQvTxjBhX3sF0viIxZSGD9ykLJLnQFxCOCKE/rw0Pc67+vtgsBh7FV+KqC6FuQ2K9gxQKCsElRZjV1QQRydkMwqFgwDa3DATAfBynXI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gla2XyKzV1p0a53XuQUECgmM4otaf4OCydF8Ru+0PXU=;
 b=NWFgjRdh2zz4O0EnDGGXYYjwuC/4fa1tj68h1jEVPaq+uNWXQ8e8VsFuTa/pZrdaocONTtFJMdS9cWf4cY9yA9KaeoVs1i2mJ654lVzpS+FygCR1c70Xx3y6fQ7WASW2DnTTX9tAdvJ2MifAtr4Z/Uq1Quqg6qBS+J9qGZagbYshTqsNq6jttuUODI81cPJ6yW+rpJ7fKX3a6PCDNSHMguJWNDBS63jHHOlXu/sZVR60LkQpky6LIw8dBwIk5GxuhobuWvBFQV6jBRd+pdz0ugP69eemtZoBE3xP9PlccTbJjYVkj8oeKKC7OSv8987rL8ll8O222rzW177AgGKf6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.14; Fri, 1 Aug 2025 20:51:36 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 20:51:36 +0000
Date: Fri, 1 Aug 2025 16:51:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/pf: Make sure PF is ready to configure VFs
Message-ID: <aI0o1eUOIrlz6CI6@intel.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-3-michal.wajdeczko@intel.com>
 <CH0PR11MB5444CEA80C83A713DEE5CAC1E524A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <84436334-ffb0-4a38-ad50-1f9ce36727c6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <84436334-ffb0-4a38-ad50-1f9ce36727c6@intel.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 550583d1-57b8-424c-7349-08ddd13d3496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UIRhtyWteKD8xJzpe73KYvhpEbXKQOzlAPOfNDUt9vew9GV3Zm9q/JKBzcnF?=
 =?us-ascii?Q?L4LtihlWWVvfbZ5Jm238/3DTlhqxUYpPn+ctWXTQaOVBzdJVbzYrQggKWnMj?=
 =?us-ascii?Q?oiNfVara6NJiT4K/rDMoYP2BN24G16/Wd6bKtrMU3paCQAVixAvpj18POtLv?=
 =?us-ascii?Q?WzAQ2OwFbqas+chmDT2tLv/iFfWS6zYng2VImcbLEiE92ubl8+y/N7CUkGQW?=
 =?us-ascii?Q?ptJsakcvB00ib++ESNh8I8ZLNb42BI7zKDFxheC1oggTjxnWEWGAVx/vtWQe?=
 =?us-ascii?Q?zrYIxhNvDdxyaHkqe4dvSR4pp3rm2tybohPciTLNHFyCdC6cEgMAwy8oE5+I?=
 =?us-ascii?Q?qt9hTMUDUip/ox2LzlTf1Cq2qXSG/t6x+eEgbI/Mx8QNgi2kjUW3doQV56p6?=
 =?us-ascii?Q?K7uRpIDU/HfF8A2dYeE99rOLvcmPHBnqKMsvTExjybqUAl9vCJ4HWvc508yj?=
 =?us-ascii?Q?SwBNf9xy5lOPPTTzd8lObl3FSwJ8Ptmhp9iOnlxz0GfV8hlsAbU4H0WVyhaI?=
 =?us-ascii?Q?JfM6OYbhY3g48Lr82/IiP4L4Eq27v5y04+vk91peIRCIS/oLMH/XQWuEeT2/?=
 =?us-ascii?Q?4CzHV21SCzYUF8trnM6h4D+AdZ7uqGpZBt3VUqiCXfM7w8KVqSJxFe1pxKYh?=
 =?us-ascii?Q?aeUxo3pd4EYVe9zPFzBmDvXYnR4vYC6np7/9BtbHaGC/ir2orzFboIl/bAu8?=
 =?us-ascii?Q?hu2Aj52xezLErMOG/DywskYG5OxnWD23H2qyjFY7SU2O8ZF2/7dKf6jvZNV0?=
 =?us-ascii?Q?oDjUOnl81MfEPAQEIJkB6TkkWK66+6qURyAfZMyjxj6JkrqOmrNi5+jd8Fjl?=
 =?us-ascii?Q?L+lhOnvwcq6+l/61cfgD2fq8eyNfuOwO9xKX0kXxpdHbp8Yqe/LxZD1O4gm0?=
 =?us-ascii?Q?ckS1Sd0C+Unzvn05oBz25UkP9ylNu9T8pA8TqSrUPnc7YIGeYQIRiqPboy42?=
 =?us-ascii?Q?BlOPr9dxK04wXBLgg4TjRNLRJV6wn/WPDOh4Ls6HlNTluuB2aeW32il9eGFt?=
 =?us-ascii?Q?mP5WB8CJ2lXEts1dvtGKTCOTfs7AjzRjmJSYD2MkEI5EJZCAglIE5rQgxkKK?=
 =?us-ascii?Q?3dtQ9K03+/GDbCJE/qGxfk55BD+QlX04O+U42q56LX+CAbGS94bVW7elyGGt?=
 =?us-ascii?Q?zgFGeQpjJ3DFoj1MSISH6cvfpLFI22lylhOcpXD89FxSqFd9XS1pUq9Mhmc+?=
 =?us-ascii?Q?FgyFztweIT12ufpV+M3AtlI3aKINoK2q7d4zi7rdgjiVaqzYR/ZIi51yrKnk?=
 =?us-ascii?Q?V8Mn8sJOOzhfo0oNKv+pC+KkxTulUQWDD/OFSAnhscJVt99gkpl5TtSVjlNw?=
 =?us-ascii?Q?VUv7LIiXxKVfr08l9t+uBHoYBThGsw+5kjGCXKrbMCI5XjtG9sDSYUH4C/gh?=
 =?us-ascii?Q?zYfIOy82CWL64ZiIbQpb4Ynk9gNl2TdW1yn+uKzpz4LfyhuIuTLVTVJwb+D+?=
 =?us-ascii?Q?KT93xFMbQsg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ELhW47TTOgAhd31uA/vk/MX/JpuN7UA9MGOA9NYDqqnIrJ69OKYqYjGGePAP?=
 =?us-ascii?Q?nLZODFEX61i4imnOJwq8TRzryxholm2HJ2MEp94Ur2ezJRr9Az34+0R6bivs?=
 =?us-ascii?Q?+AV2nZ/Wx6A8Xpkhxqgqd9p+8o2K4r7d0ehAPLhpLrf9VvH4MmI1NGzcTIaL?=
 =?us-ascii?Q?A0IDjg5FD/IzauHlrWJxPAMy59G8kwBqDe1rnlydGiooOujWid96J372xph3?=
 =?us-ascii?Q?femP0NO3g7Lp/Eq1Dpqx48SXvFchNr62mJX8/5J9rGfzsDjSw4entsgRZmNw?=
 =?us-ascii?Q?UC7QS36XYmWHDPXKMs1KwnYYG1H96umR5JHC/H43feJiloAkvJQlG2azsJT0?=
 =?us-ascii?Q?UXcs4ko35pj3RYcVbDAlY4Hkk3Wo3iBcRFMjsGEwQAXCQ15ivutA5l+b0irM?=
 =?us-ascii?Q?yaCAhwyEuoEnq7FdBsiPZ1Gm/MwQ+LnYqDwPGJixpz3ubOYUp3GJz+x9Ts9F?=
 =?us-ascii?Q?ZuRbEqm+SP6fKgtX3njDfzJfQYeja9kMZqKNyec9M6gPWOoa3zaZyQdcMsPK?=
 =?us-ascii?Q?fXa10z8dCrnSdaBaGc1ltza47Yc2aadngDyNucFnrm7ZZML6pqsUBqBEg3GJ?=
 =?us-ascii?Q?9CQM7AYLBq5yBoh21WUMHfoPx4QbN2GgqS7N3StRn1StGoWoNHSbR47i5wWP?=
 =?us-ascii?Q?mgTXihuNVQWdkM4ZOVEqt54jNAa2X14n9uzupMx6dBPHuYDJ+h1VD/yuecVP?=
 =?us-ascii?Q?lfLLeGGodtKmhjxAFsKtMAmDuZdaHqJY/t1kWz1PUpNoMUZtNO4I4t6uB9P/?=
 =?us-ascii?Q?zst3hbaWRf8pK9yUf6jDsP1Q2wvZy2qnRk4hWog91HoUq3UlFngQOOfG0CZl?=
 =?us-ascii?Q?0Qh0akkeKrTZ336EO+5BIi7O/9tZ1N3D497VCF0P75/xjtIYjFHpBzb+oTRL?=
 =?us-ascii?Q?1xBab2hVsSrs3ldwD/RaCpQnjKXvkgwc3cxH/PFmlq3dhTmlVW4Qbcv/oD8P?=
 =?us-ascii?Q?KoM9HStz0ijMbxyZhW5vZXcmIiHDDDi+sbUg6RovVhvN+1jrAKf1vnvHpt6+?=
 =?us-ascii?Q?fTmhWAfdgJL08pO5XFdpcgT3kc+1rKI56tRjboLRA7av/pJjvGsWvYIrzL4u?=
 =?us-ascii?Q?EQAVEcyKS8r7W+p2LKWDLOx6nBW/00jFoz2gNH+ynPLofP5IkAb9NAtlSBSN?=
 =?us-ascii?Q?ZkxlOKNb2Cm7qryJiNVZB+Gj2iXo+I2AaQkiALjChgwIxEZ/NY8OE3Sim8aM?=
 =?us-ascii?Q?3xc2myr0JXBtbPTVUKLI7DfJe62+P2hZmH3b3DSwU9mtHL4iLF0VNMnDFDgF?=
 =?us-ascii?Q?AYcj9Smi9wVLgcR8yhv2q4ucA0S81/qC7Qav9Qy1TKGxl7BTH65GQ8RhmHkT?=
 =?us-ascii?Q?ulJKfL2D7ZWZJa+UQwxxKU610hzKro408rzywWCaTNWMG61A4N1ZbSExTJx/?=
 =?us-ascii?Q?EuRXdyg4ZnaDUfiTIiQO3SDcMkRKWknEodMaNUQ+e1x7zvShJ+qm7wTE+nZL?=
 =?us-ascii?Q?af35m1452Rq0935LdsZ+S3nPDKGg4zs7kKy1cArLyZjeXGAqCwkX0A5fIL30?=
 =?us-ascii?Q?rka7f2mHQN9G7ckZO5mV0uTLG/nykyp1Dub0IG0E/Uq68CryUNIAQAhEgt9O?=
 =?us-ascii?Q?3aTJF7tycWhKg8xDeTDK454HT4e0thr7JjPfMTTOUpSGEYdjwaapLe/pXQ/q?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 550583d1-57b8-424c-7349-08ddd13d3496
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:51:36.3901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CklfGsSpYgmBY5SBtrb0yFlx3Cf7PD/9yBrJkXpc6ar1AKbEVBgxuPAqlf5vrHNQRzZbeqYctM2gfZJ/PbKxLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
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

On Wed, Jul 30, 2025 at 11:44:34PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 7/30/2025 11:09 PM, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> > Sent: Wednesday, July 30, 2025 10:49 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> > Subject: [PATCH 2/3] drm/xe/pf: Make sure PF is ready to configure VFs
> >>
> >> The PF driver might be resumed just to configure VFs, but since
> >> it is doing some asynchronous GuC reconfigurations after fresh
> >> reset, we should wait until all pending works are completed.
> >>
> >> This is especially important in case of LMEM provisioning, since
> >> we also need to update the LMTT and send invalidation requests
> >> to all GuCs, which are expected to be already in the VGT mode.
> >>
> >> Fixes: 68ae022278a1 ("drm/xe/pf: Force GuC virtualization mode")
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 28 +++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  1 +
> >>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  4 ++-
> >>  drivers/gpu/drm/xe/xe_pci_sriov.c           |  7 +++++-
> >>  drivers/gpu/drm/xe/xe_sriov_pf.c            | 27 ++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_sriov_pf.h            |  1 +
> >>  6 files changed, 66 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> >> index 2761319fdc26..8bc7d7f9f47a 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> >> @@ -16,6 +16,7 @@
> >>  #include "xe_gt_sriov_pf_migration.h"
> >>  #include "xe_gt_sriov_pf_service.h"
> >>  #include "xe_gt_sriov_printk.h"
> >> +#include "xe_guc_submit.h"
> >>  #include "xe_mmio.h"
> >>  #include "xe_pm.h"
> >>  
> >> @@ -258,3 +259,30 @@ void xe_gt_sriov_pf_restart(struct xe_gt *gt)
> >>  {
> >>  	pf_queue_restart(gt);
> >>  }
> >> +
> >> +static bool pf_flush_restart(struct xe_gt *gt)
> >> +{
> >> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt))); 
> > 
> > Asserting here seems unnecessary.  If we're certain that the pf functions
> > will never be called in a non-pf context, then we probably don't need to
> > assert the system is in sriov-pf mode here.  And if we aren't certain of this,
> > it probably makes more sense to put the assertion in
> > xe_gt_sriov_pf_wait_ready instead, or to have a separate return path instead
> > of breaking instantly.
> 
> the purpose of using our xe_assert() is exactly to be certain that we never call
> functions in an unexpected way, without having to analyze crash logs when someone
> actually make a mistake 
> 
> and while I'm certain that today I'm not calling that wrong, I don't know what
> others will do next day
> 
> and here in this function we are accessing a PF-only member of the union, so
> like in the rest of the SRIOV code, we have explicit assert to tag function
> 
> and all xe_asserts() are compiled away on production builds, so no worry
> 
> > 
> > Unless the system can exit sriov-pf mode in the middle of execution?  I don't
> > think that's a possibility, though.
> > 
> > The assertion by itself isn't harmful if we're assuming the system would never
> > hit the assertion in a non-sriov-pf context, though, so I won't block on it's
> > removal.  Though a justification would do well here, if only for my sake.
> 
> the goal of asserts is that we don't expect they will be hit

Although in general I also don't like the code full of asserts, I'm fine with
the answer given here. Specially because this PF/VF path is new and complicated.

> 
> > 
> > Everything else is
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

But again, next time, please wait for the response, so perhaps other folks
might jump in the discussion and state other different views. Stating the rv-b
too early will push back other folks to jump in the discussion.

Thanks,
Rodrigo.


> > -Jonathan Cavitt
> > 
> >> +
> >> +	return flush_work(&gt->sriov.pf.workers.restart);
> >> +}
> >> +
> >> +/**
> >> + * xe_gt_sriov_pf_wait_ready() - Wait until per-GT PF SR-IOV support is ready.
> >> + * @gt: the &xe_gt
> >> + *
> >> + * This function can only be called on PF.
> >> + *
> >> + * Return: 0 on success or a negative error code on failure.
> >> + */
> >> +int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt)
> >> +{
> >> +	/* don't wait if there is another ongoing reset */
> >> +	if (xe_guc_read_stopped(&gt->uc.guc))
> >> +		return -EBUSY;
> >> +
> >> +	if (pf_flush_restart(gt))
> >> +		xe_gt_sriov_dbg_verbose(gt, "ready after restart\n");
> >> +
> >> +	return 0;
> >> +}
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> >> index e2b2ff8132dc..e7fde3f9937a 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> >> @@ -11,6 +11,7 @@ struct xe_gt;
> >>  #ifdef CONFIG_PCI_IOV
> >>  int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
> >>  int xe_gt_sriov_pf_init(struct xe_gt *gt);
> >> +int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt);
> >>  void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
> >>  void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
> >>  void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> index bf679b21f485..3ed245e04d0c 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> >> @@ -22,6 +22,7 @@
> >>  #include "xe_gt_sriov_pf_policy.h"
> >>  #include "xe_gt_sriov_pf_service.h"
> >>  #include "xe_pm.h"
> >> +#include "xe_sriov_pf.h"
> >>  
> >>  /*
> >>   *      /sys/kernel/debug/dri/0/
> >> @@ -205,7 +206,8 @@ static int CONFIG##_set(void *data, u64 val)					\
> >>  		return -EOVERFLOW;						\
> >>  										\
> >>  	xe_pm_runtime_get(xe);							\
> >> -	err = xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
> >> +	err = xe_sriov_pf_wait_ready(xe) ?:					\
> >> +	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
> >>  	xe_pm_runtime_put(xe);							\
> >>  										\
> >>  	return err;								\
> >> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> >> index 27b148eab49c..af05db07162e 100644
> >> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> >> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> >> @@ -16,6 +16,7 @@
> >>  #include "xe_pci_sriov.h"
> >>  #include "xe_pm.h"
> >>  #include "xe_sriov.h"
> >> +#include "xe_sriov_pf.h"
> >>  #include "xe_sriov_pf_helpers.h"
> >>  #include "xe_sriov_printk.h"
> >>  
> >> @@ -154,6 +155,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> >>  	xe_assert(xe, num_vfs <= total_vfs);
> >>  	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> >>  
> >> +	err = xe_sriov_pf_wait_ready(xe);
> >> +	if (err)
> >> +		goto out;
> >> +
> >>  	/*
> >>  	 * We must hold additional reference to the runtime PM to keep PF in D0
> >>  	 * during VFs lifetime, as our VFs do not implement the PM capability.
> >> @@ -191,7 +196,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> >>  failed:
> >>  	pf_unprovision_vfs(xe, num_vfs);
> >>  	xe_pm_runtime_put(xe);
> >> -
> >> +out:
> >>  	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
> >>  			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> >>  	return err;
> >> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> >> index afbdd894bd6e..7e8f3d3ac656 100644
> >> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> >> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> >> @@ -9,6 +9,7 @@
> >>  
> >>  #include "xe_assert.h"
> >>  #include "xe_device.h"
> >> +#include "xe_gt_sriov_pf.h"
> >>  #include "xe_module.h"
> >>  #include "xe_sriov.h"
> >>  #include "xe_sriov_pf.h"
> >> @@ -102,6 +103,32 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
> >>  	return 0;
> >>  }
> >>  
> >> +/**
> >> + * xe_sriov_pf_wait_ready() - Wait until PF is ready to operate.
> >> + * @xe: the &xe_device to test
> >> + *
> >> + * This function can only be called on PF.
> >> + *
> >> + * Return: 0 on success or a negative error code on failure.
> >> + */
> >> +int xe_sriov_pf_wait_ready(struct xe_device *xe)
> >> +{
> >> +	struct xe_gt *gt;
> >> +	unsigned int id;
> >> +	int err = 0;
> >> +
> >> +	if (xe_device_wedged(xe))
> >> +		return -ECANCELED;
> >> +
> >> +	for_each_gt(gt, xe, id) {
> >> +		err = xe_gt_sriov_pf_wait_ready(gt);
> >> +		if (err)
> >> +			break;
> >> +	}
> >> +
> >> +	return err;
> >> +}
> >> +
> >>  /**
> >>   * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
> >>   * @xe: the &xe_device to print info from
> >> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
> >> index c392c3fcf085..e3b34f8f5e04 100644
> >> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
> >> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> >> @@ -15,6 +15,7 @@ struct xe_device;
> >>  #ifdef CONFIG_PCI_IOV
> >>  bool xe_sriov_pf_readiness(struct xe_device *xe);
> >>  int xe_sriov_pf_init_early(struct xe_device *xe);
> >> +int xe_sriov_pf_wait_ready(struct xe_device *xe);
> >>  void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root);
> >>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
> >>  #else
> >> -- 
> >> 2.47.1
> >>
> >>
> 
