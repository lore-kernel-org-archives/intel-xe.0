Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC83DEED600
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 01:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B34E10E0F3;
	Fri, 13 Sep 2024 01:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I36Z7II/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694F710E0F3
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 01:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726192442; x=1757728442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=npweTGE7CCeXhwMq86oobgIYCSdhWE94FBN4VB1wvOA=;
 b=I36Z7II/vrH6NcHhzOnKs90rcV4x160EYWAGP+W4ELpfzPqHOgdStahM
 cAWkT49izEfjUoqc+r5eSWZxrE13GoX6jDL5lASjLmWBSEzy2vIrWtvRc
 +RcOrAdjrWMkKkapcOX4qMsTGF1OCikifHUZ0hRf1WQmyrd28WJPyIwSo
 eFxb2iNfJHOPLVyjJ3nJELsdiCffmdvOjBHsn57RE22RTgIsGIaYa+M+r
 M7ISP5Htu/mM1OuTj6Jnm4Pn4RIMyc4QvUUwEHNvswJ7bsNLygpS1Audy
 8GZ/QI9w5oab0IhBpABZ8tTzoz0GIpmwLX86WnkBPqCDIcfGGCXx/FBMw Q==;
X-CSE-ConnectionGUID: OQjOo5OOSuaQPmmfOq3bxQ==
X-CSE-MsgGUID: pN4x8YIRR0mXc1UgpTrXnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25274536"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="25274536"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 18:54:01 -0700
X-CSE-ConnectionGUID: smNqoEyUQOmJkqXYrLsi3w==
X-CSE-MsgGUID: p5RdJUGVTAG22PnM+YWG2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67865696"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 18:54:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 18:53:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 18:53:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 18:53:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTr/1Ccc0fqHTWicMEU9ORm9o/6OI9/sdsVOLBt2BX6xUJceV2ipPBOS696nEwsT7izMGhLV+8N/FdflhVc45Kubdo/CPUVfMnbZslH2Dv29tBJk4v1HhSZJaXVyEQjrdkYtgUQNLgN8hbJ0LuzLrpwOVD7GaSEFg0sJNMIFp9CNFKci67BcllnneQXeHRIlVbl+qXi26Z/lHhwvhtro5O3QhE4N0GuJqjJJPgLhOagA67/rhryz9Qyz4aL3u/sMpaHRLr54Nst/3oG4xLJPO74VZYfzEst+x/KGhBLHKYmku46oWLOqXlY+v0hYaECr1CHrqgtbFnQJ4bE3n5Ke5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlVJ5tYSURNiDInEAFoIFQZAxTuoIzSWC1wVhxY4amY=;
 b=aA8cAdDdsYf38m9NSnQysKvM5XaJVzzAY4JZiv3zYzcQj8DNsqwAuDQGq1i99bBoQm/qQetiuwECS2zvp6RkCbnrrGwnBUe8f+aX8Hs9tqunjijeLm6I71647YzGNrTlJeRHJS5+x+jIQlPrz5PBK5gaoqBcJr64iNPvZMFhPyvsFR55VzoVxpdOvCRAmaS7P6W2305nNb55otNknIcjBAgUQAS7sn8DOeWtxZep6m4D6ghg/lAulcV7phjPzQAAqqSKHlZtXsLww0fmw+CyLuWISnKwmZchgHIXatjapJcauNP8iVGzD81EG20KqbRiTN8b4795xyzj9MLnB1OGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Fri, 13 Sep
 2024 01:53:51 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%5]) with mapi id 15.20.7939.017; Fri, 13 Sep 2024
 01:53:50 +0000
Date: Thu, 12 Sep 2024 18:53:47 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <jose.souza@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/eustall: Add support for EU stall sampling
Message-ID: <ZuObKzhNGK3O5P1Q@intel.com>
References: <cover.1725866097.git.harish.chegondi@intel.com>
 <5f7adcc0dffec68bf88b282a5d2f92a9f05834ca.1725866097.git.harish.chegondi@intel.com>
 <20240910000914.GD5774@mdroper-desk1.amr.corp.intel.com>
 <87ldzx3hg7.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87ldzx3hg7.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0250.namprd04.prod.outlook.com
 (2603:10b6:303:88::15) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 975632e1-fe46-4d57-9dee-08dcd396ea12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTU0UVNZbGg4NXk2Qk9Ja1NEaVFrMXg0VzF4bHBwTGVienpZUHNlNk9FbGFG?=
 =?utf-8?B?ZmdFOFBTeWU0ZFoxYUJmWFhTQ0JrWVBoWStlY0tlSHZrMytmdktqKzVMd3Jp?=
 =?utf-8?B?TERmbkFsRTBCeU1RMng0Vk9CdVluRXRaUUNzbVlGS2U3K0NyelVSbkF1WmZk?=
 =?utf-8?B?V0ZNVUREcTNIaWxDMUJET3pIM2NYengybzJKZjNXKzd6TGp5RThOSDdha2Mx?=
 =?utf-8?B?aHUyelpDdFVWS0dXeWF0dzZwU1FOcFhwb21sd09rRHVqeDIxaUMrSVV3OFRN?=
 =?utf-8?B?ZEJvVXNKenR2Ly9TaEpEc2lTOGJWKytXVWJNeFBoQzJ3b2tMMTc5LzhIN1BJ?=
 =?utf-8?B?NGJFNndhRHdMeS9pWFowTEJVWE9SQ0tWWm5DcU1TQVloT2VSeEVlaHBTa21C?=
 =?utf-8?B?a05DcnhVM2l6VkRoK2FtbCs1WWxEOVpnNVlucnVWSFNqNEdzbUVqVUNGeVhS?=
 =?utf-8?B?YTVZQmZRaWZFYlAyVW1qejlOOENHdTJrK1ExN0dldk9HV2dNaDRGUmROdGRs?=
 =?utf-8?B?T21pOXBTZm1MNTdpaGlKRVFCeDNMUENqbDJVNlhZQVFzUEtGYXl4NkVEZnNT?=
 =?utf-8?B?NDN1aExhSldrblI3ZDVIUWtqbTB3QXdpeDJKRVFqdXhJNjNzWWg3QURuV0tx?=
 =?utf-8?B?TnhwdS9WMjhibkVuK2MrdDhtalYwanlDamtkOWtKSlNoRDZzSGRPMjhSVDFu?=
 =?utf-8?B?aUFJbWhRVzdLNk54WDRMV3hqT2VZbXZPWlg2ZHI2d2hxSHFGd3g3cElCRU1x?=
 =?utf-8?B?SWp5dUpZZ3JQRXZYSWF6SmZlcmRZcys3YUJxY1BnV0JvdE1WK3pDYkxsVXdC?=
 =?utf-8?B?YjhZZEMvZTd6RENIM0c1TForV3NHZlhkeE44clcrbzFsS2VkTzc5VUlJVDBr?=
 =?utf-8?B?OTI3eTNKSFVnYURrNzUvMXFuUmtYekdJRWlha1Z6c2tzeEQ1Q2NrM1l1dXBW?=
 =?utf-8?B?dUs4UWZXaWZybEhxbWlrdnQ2aFpOWW5QSTNsSy9ORDRQZSt4eS9pNWJFQjE1?=
 =?utf-8?B?U3B4RTZUSDMwZU9sV2xqUHFPQ0FDZCtjbWlpTXFkVzJuTlQydVFIZ2ZMTm5q?=
 =?utf-8?B?cEc3SlBLU0gxblcxeGJhN1R6YnFuL3U5d3B6aWJ0OFRWNnl2QlZwbFdqbVZP?=
 =?utf-8?B?UTdKQi9kaVBtNkpMV1pGS1Z5QTF5ZzdCMnRBZ01mL2FsMkdCcm9JQkNsejhK?=
 =?utf-8?B?NzVsUkM5VjZ2R1YrWHkyaHROeHVZbWY1SUpXc1RqUEphbzJHbHY0cmx6QTRp?=
 =?utf-8?B?Sy92ZFg2RlZ0blFVNEd4OHpjWUROQzc5OXBtYjF6V2kwL2kvdzVjd1VJeEs3?=
 =?utf-8?B?djA4WmIxSzF1N2taNkt6UnlNTHBzOUNqVHVBYlh4WU5Ec3dGaGdQeUhZOERX?=
 =?utf-8?B?RzJ0OU81WGMxM0Z5YTZwVGtCam1JZzRnQmtYeW4xekRKNHNyMHgrWFc4dmdn?=
 =?utf-8?B?RStyZGxzcVVRNHBYcStRbnlWTjBraXNZZlJnVVZNWUNucElsb0R5OExnNjU0?=
 =?utf-8?B?Z2lTNlVrWU90NG1NQXFUTXRLYmlVaFdlRU5xcHl5d1BKMnRPaUlDVGxYRFg5?=
 =?utf-8?B?SlJTL2J2N2dtZ251enJIUjNLUy9PbG44VjZ4RDN1T0tEdXc1OHBuaGxodWM1?=
 =?utf-8?B?Y1RKY3J1dDViWGNORTlFSzJTVlJha0NDd2VtQWFNQkIwNld1UzMxQmljZU5h?=
 =?utf-8?B?b1pzVXBvZ2c2VGl6MVRBMHVHNFc5di9RNTFmakdpNkhDYS85ckRsalVFK3Nv?=
 =?utf-8?B?SlpQTkM4T0cxREx0TWszeTZMT2pOMWVpNkhQelJpV25hNlg0MWQ5ZDNKaFZY?=
 =?utf-8?B?WEFXQ01jYUNHdHNSUXFwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXpWWXpyL3ZiUS9VZzRQd2Rmc01hVG1nRWhYY1U5ZGkrUCtVNHZwZFRuNEc2?=
 =?utf-8?B?NzdodFIvY0NXenREYXhIOUlBSVVsZkVmYTI2VlVsMHFTNjBmdWpYbkg0c3Y4?=
 =?utf-8?B?VkZUaHZnNmxFRy93dzdVeFBTMDZjRU9hTzFHclU2bTJRNkx4UmFRRmgwMFFC?=
 =?utf-8?B?bXh4czRHaXVVSmgzWUVVeE1PZHNXeTlJb0ZsQUM1ZzZ0WCs4cW80YmFnaGFN?=
 =?utf-8?B?clFsOFMyVWhRN1B2UDc1dzBWYjRmcm1JUURLQkNRTzlKUXBtZWcvVitSbHE4?=
 =?utf-8?B?Zkx0RnUvK0FaTUNqcjg1emxwZmZqcEVoMHdudklEdG5ZNmMyUWhid2xnWEZF?=
 =?utf-8?B?VURtblB2TkR0R3BOaUR1S1JzclRaNVJqOFlwbi9tOC9iMG1Kd2lPMU9OYVBk?=
 =?utf-8?B?ZE5zOGRRVW8wa0d1dEZtcTUwN04yeVZwQ2gvS0VpZ0hSVzRIdWFwQVEwOTF2?=
 =?utf-8?B?TDI5aW1vYkIzTFpqK3QzVytlRW8wSit0cXpKbFdXZmIveVpYT1pRU3E5VFAv?=
 =?utf-8?B?UHdCWFF3VUczZDZJSEJvWGx2TVFRb1k3YkNQS29ETS93Y0ROQ053NEV4bW5J?=
 =?utf-8?B?WFZwa0FpakNkUUNNMjlXTkZ4SGxBcXQ5T0dvendTMTE0dHp6QitvYkdrUjJj?=
 =?utf-8?B?QXlIS1loV1lFN3FLVlBLR2E1TXJMQlZrYTNacEt2WGZBbzBFRjQ0dXBnaGZ4?=
 =?utf-8?B?eEczeWtvNVhWTDJ3MklYcDE0aTdESTk5bXRqMGtWMU1vMXhFOHdXTkpvNjlk?=
 =?utf-8?B?MldsRVJXUEZTWWt6dUZsVlgrSFlyQWFic3FUYUZ3anNnZE1LTUxyU2FkamxU?=
 =?utf-8?B?ei9kd3BXdm4xWVNiQ2JTbU93ZjZEQzR3RWlaT3dCNTJzSmNtRTJ3SDg1YjdN?=
 =?utf-8?B?VEgwRTIzeVVSN1ZKWGFDVVFsOGlYVzIvZUNRcEtTWDlUVzhzWXdqTzgySTlE?=
 =?utf-8?B?WDdwZ1dQQXk0cExrT1lENmZ0MDhIcUVkcmdyeDM2RWtNQ2RlSVBadms2R3Rx?=
 =?utf-8?B?cFliNFlyclMrN0NmZGtaZE9qVzFLZkM5c05pMUFjSHNzbUhPcHNBdi9BWjZ4?=
 =?utf-8?B?WUp0cHNXOUpwUStTeG4wUGFsMFlPbFhMRVVwZHpmeEtISkJpOG02M2hLUi9J?=
 =?utf-8?B?ak1kajlIWkIwOXpFUk9uTm1lMWY5dFFoaFd2clJsMDM2eXlVR3FJU0NDeUhz?=
 =?utf-8?B?Ulh2MDdkUkNqNmhXMXhrU0tkRUtJdm50MlRudkR0T2xDUWJPb1JycXcxazNR?=
 =?utf-8?B?bzRDQzBrVmxBMWo3TmlRY3E1RXFhYU5ocFljbk15czZUREd0SDBaR2hHM3pE?=
 =?utf-8?B?dGRiRld4eS93MHVLNkVlbUw3N0dXL2wyN1hJNVBYSVk4YTVwZzJiSDZmTWUy?=
 =?utf-8?B?enAwL2RIaU8wTkdPV1FrN3ZFN205a1Q2YWxVWjY0WmpPakE2aHRDYjliVURW?=
 =?utf-8?B?SFNwMHNVZm9teG53UEMrZDNSMXRsb2NaT1RUcklxcEZQdHVzV1ZqQjlJMVlR?=
 =?utf-8?B?UzczT05VNTJxdmJyT2NyS04xVEhhMzAxanpLcjFtU1BBU01ESU0rNDh4eCt5?=
 =?utf-8?B?UlFkTUdGV3ZSZDBwTzdBaFEzbHJVeU5pb1k5MjlPYVo3V1VjZkxHbXFxbC9M?=
 =?utf-8?B?bnBFRkpWU3RXais1Y0tzSWJMdTZnWmZUbzBpckRLaVRMY0FLQnV5NmFZL0Ni?=
 =?utf-8?B?WCtOTGRDakpjZEp5Z2FQVEo0SHptZmptU05ySXU2RlRZeTNOYzZDZ0dPT2dz?=
 =?utf-8?B?VlBLaFdGenpRUU8zSlRCemgvMEpKVmN5c2xxZmNNdXZBRXZrSER6WmVubk5p?=
 =?utf-8?B?cmc0dS8xcWd3cUdnTE9KYU1maDM2amRuMml2QXFTOUlrMm9RMnhVblR2RmNE?=
 =?utf-8?B?S1lVMFlUb3pQclNPdXFTbU1vK0Y3SEhSY1lRNVJ2Z3NkVmpOT3ZRdGJYNVZ5?=
 =?utf-8?B?N2pOZFNDVENpb1Y5TFlUcCsvRVUzVGd5R0ExZkU3cytDRUtSaGcvR3FoT0JI?=
 =?utf-8?B?QmhINEhVTENjK0dGU1dNWERMVThuWDFUL3JVTXI4US84Z1NiVlFiUHNBNUVk?=
 =?utf-8?B?UVRGalFnZGFVS2oxUnBoNDM0Njl0Q29MU1h5QTR0YWtZQkVsNlFDVlJoakpn?=
 =?utf-8?B?VTJzeWF1ZnE1ODBnQTVkM0VIZFdnSkpwbVV4YjFMcnNBVTRxTjJaKzc4dU91?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 975632e1-fe46-4d57-9dee-08dcd396ea12
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 01:53:50.6508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUWnKWJuyJgKMLLx9mqO5JofOfnKcgK7OKVBsavyjlIGWOyFnkFnkNgn1tLhWEwH6KhF6Zhl8Lz7ii31uADFipwcPI4qwTbsPszP70bW/94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
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

On Wed, Sep 11, 2024 at 04:21:12PM -0700, Dixit, Ashutosh wrote:
> On Mon, 09 Sep 2024 17:09:14 -0700, Matt Roper wrote:
> >
> 
> Hi Matt,
> 
> Some comments about the uapi below.
> 
> > > @@ -1694,6 +1696,138 @@ struct drm_xe_oa_stream_info {
> > >	__u64 reserved[3];
> > >  };
> > >
> > > +/**
> > > + * enum drm_xe_eu_stall_property_id - EU stall data stream property ids.
> > > + *
> > > + * These properties are passed to the driver as a chain of
> > > + * @drm_xe_ext_set_property structures with @property set to these
> > > + * properties' enums and @value set to the corresponding values of these
> > > + * properties. @drm_xe_user_extension base.name should be set to
> > > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > > + */
> > > +enum drm_xe_eu_stall_property_id {
> > > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > > +	/**
> > > +	 * @DRM_XE_EU_STALL_PROP_BUF_SZ: Per DSS Memory Buffer Size.
> > > +	 * Valid values are 128 KB, 256 KB, and 512 KB.
> > > +	 */
> > > +	DRM_XE_EU_STALL_PROP_BUF_SZ = 1,
> >
> > Does userspace really care about this being configurable?  Even if we
> > have a platform with XE_MAX_DSS_FUSE_BITS total XeCores, the difference
> > between the largest and smallest sizes here only saves 48MB of memory.
> > The hardware makes this configurable, but is there actually an ask to
> > expose this through the uapi?  If not, I'd say we should just always
> > pick 512KB internally and keep things simple.
> 
> Agreed.
> 
> >
> > > +
> > > +	/**
> > > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > > +	 * in multiples of 251 cycles. Valid values are 1 to 7.
> > > +	 * If the value is 1, sampling interval is 251 cycles.
> > > +	 * If the value is 7, sampling interval is 7 x 251 cycles.
> > > +	 */
> > > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> > > +
> > > +	/**
> > > +	 * @DRM_XE_EU_STALL_PROP_POLL_PERIOD: EU stall data
> > > +	 * poll period in nanoseconds. should be at least 100000 ns.
> > > +	 */
> > > +	DRM_XE_EU_STALL_PROP_POLL_PERIOD,
> > > +
> > > +	/**
> > > +	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
> > > +	 * EU stall data rows to be present in the kernel buffer for
> > > +	 * poll() to set POLLIN (data present).
> > > +	 */
> > > +	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> > > +
> > > +	/**
> > > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
> > > +	 * EU stall data will be captured.
> > > +	 */
> > > +	DRM_XE_EU_STALL_PROP_GT_ID,
> >
> > I mentioned above, but it feels like this should be an intrinsic part of
> > the API, not something coming in through an optional extension...
> 
> Not sure what "intrinsic part of the API" should be. EU Stall, OA etc. are
> now types of "observation streams" and there is no other opportunity in the
> observation stream interface for this kind of information. Also, gt_id is
> EU stall specific (e.g. OA uses oa_unit_id not gt_id) so it should come in
> as an EU Stall property.
> 
> Though question for Harish: do we really need this? What if we return data
> from all tiles/gt's in a single read() call? Since we have already
> determined subslice number is not interesting to UMD's for EU Stall data,
> maybe gt_id is similarly not interesting?
User space folks said that they are interested in the EU stall data at
the GT level. So if we decide to return stall data from all the GTs, we
may have to append the GT ID to the data. I will seek feedback from the
user space folks regarding this.

Thanks
Harish.
> 
> >
> > > +
> > > +	/**
> > > +	 * @DRM_XE_EU_STALL_PROP_OPEN_DISABLED: A value of 1 will open
> > > +	 * the EU stall data stream without enabling EU stall sampling.
> > > +	 */
> > > +	DRM_XE_EU_STALL_PROP_OPEN_DISABLED,
> >
> > Is there a reason not to make this one the default behavior?  Is there
> > really a benefit to auto-enabling on open that makes it worth the extra
> > API complexity to make this configurable?
> 
> I agree, this would be a good idea. But unfortunately this got in for OA
> (if I were doing OA now I would have taken Matt's suggestion). So we either
> (a) keep it the same as OA for uniformity, or (b) document that EU stall
> streams have to be explicity enabled before read()'ing data.
> 
> >
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_eu_stall_stream_info - EU stall stream info returned from
> > > + * @DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
> > > + */
> > > +struct drm_xe_eu_stall_stream_info {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @record_size: size of each EU stall data record */
> > > +	__u64 record_size;
> > > +
> > > +	/** @reserved: reserved for future use */
> > > +	__u64 reserved[3];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_eu_stall_data_pvc - EU stall data format for PVC
> >
> > I thought there was an ask from one of the userspace teams that we make
> > the layout discoverable?  I.e., a runtime-queryable format description
> > that lists the counter type, size, and offset in the record of each
> > counter that has usable data in the records?  Did we change directions
> > on that?
> 
> My suggestion is to eliminate these struct's from the KMD uapi header. See
> my earlier response to Harish's patch.
> 
> Thanks.
> --
> Ashutosh
> 
> 
> >
> > > + *
> > > + * Bits		Field
> > > + * 0  to 28	IP (addr)
> > > + * 29 to 36	active count
> > > + * 37 to 44	other count
> > > + * 45 to 52	control count
> > > + * 53 to 60	pipestall count
> > > + * 61 to 68	send count
> > > + * 69 to 76	dist_acc count
> > > + * 77 to 84	sbid count
> > > + * 85 to 92	sync count
> > > + * 93 to 100	inst_fetch count
> > > + */
> > > +struct drm_xe_eu_stall_data_pvc {
> > > +	__u64 ip_addr:29;
> > > +	__u64 active_count:8;
> > > +	__u64 other_count:8;
> > > +	__u64 control_count:8;
> > > +	__u64 pipestall_count:8;
> > > +	__u64 send_count:8;
> > > +	__u64 dist_acc_count:8;
> > > +	__u64 sbid_count:8;
> > > +	__u64 sync_count:8;
> > > +	__u64 inst_fetch_count:8;
> > > +	__u64 unused_bits:27;
> > > +	__u64 unused[6];
> > > +} __attribute__((packed));
> > > +
> > > +/**
> > > + * struct drm_xe_eu_stall_data_xe2 - EU stall data format for LNL, BMG
> > > + *
> > > + * Bits		Field
> > > + * 0  to 28	IP (addr)
> > > + * 29 to 36	Tdr count
> > > + * 37 to 44	other count
> > > + * 45 to 52	control count
> > > + * 53 to 60	pipestall count
> > > + * 61 to 68	send count
> > > + * 69 to 76	dist_acc count
> > > + * 77 to 84	sbid count
> > > + * 85 to 92	sync count
> > > + * 93 to 100	inst_fetch count
> > > + * 101 to 108	Active count
> > > + * 109 to 111	Exid
> > > + * 112		EndFlag (is always 1)
> > > + */
> > > +struct drm_xe_eu_stall_data_xe2 {
> > > +	__u64 ip_addr:29;
> > > +	__u64 tdr_count:8;
> > > +	__u64 other_count:8;
> > > +	__u64 control_count:8;
> > > +	__u64 pipestall_count:8;
> > > +	__u64 send_count:8;
> > > +	__u64 dist_acc_count:8;
> > > +	__u64 sbid_count:8;
> > > +	__u64 sync_count:8;
> > > +	__u64 inst_fetch_count:8;
> > > +	__u64 active_count:8;
> > > +	__u64 ex_id:3;
> > > +	__u64 end_flag:1;
> > > +	__u64 unused_bits:15;
> > > +	__u64 unused[6];
> > > +} __attribute__((packed));
> > > +
> > >  #if defined(__cplusplus)
> > >  }
> > >  #endif
> > > --
> > > 2.45.1
> > >
> >
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
