Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD0FCCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 18:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471E510E33D;
	Thu, 16 Oct 2025 18:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkANrD+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DFB10E33D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 18:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760640417; x=1792176417;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DZ9ydAoOwRd34tAAGwBSboRO2zYWPRAFZ2gSaiUhxm0=;
 b=WkANrD+ZYZeRe2Qw781NdnhpLM/3vjbuHHe8gz76cZMA2P/EmwNRlX3E
 UnWv0BKEilOJUJuF1YHzw4ci8X9eS7sZbfWtnXkvS7LLZro1PRYYnYy1L
 Wb8Pt0cxZEP9LgLAQpQ0JPvTNPRjqdi5LiQJQk9sNmaUz94vrBWcCKndk
 l8cEL8amH86Y3uBEx6zCLXE1yc9vOR6v5NTEz66jNBaaRUXgxgwf4cwYs
 jIFMsUlEYzsDix832WB1vgP4ngj6F94O56naf0l9mjTK8/nrEinfDl8sq
 IlNP9m6DQfTYdMLeDQojRFHsLH7yhHU+9M0tiDp6JpFWd1bJIHjlQlqTF w==;
X-CSE-ConnectionGUID: yi3UwArPSqiUv6CCz03v2w==
X-CSE-MsgGUID: BIIEaukuQlSHpzOMyK/Shg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="50412966"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="50412966"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:46:50 -0700
X-CSE-ConnectionGUID: xzjgWuF1SOyuRc1oo3rF8g==
X-CSE-MsgGUID: uvPJezV2QqeKVULrwQz60Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187806405"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:46:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:46:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:46:49 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:46:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDkstVWUENbyoSQ8t61aNeBouRuJ8OD72MkApa5mnT6JT5iEKjfXqq8LW/67A/+GwILkikEaVACS6KmjWk/yEu3gppn1004mfV3ATRvGwgglkbRuOXF2TNXv6iFWswYJm3PR9DVY5xEk7ctOIm6mI46HxSqH5HPVMGDeQ19Dg9HY0r1HUr/yZiDWll/tEU6+WV0zjSgoPWjl43cPL1kTxBI5frC7GBWifgo2vzUU4uLI2PJldz4L2ByNMKTjmOAJVoGwSzp6AdobY4y/3LicTKzhI/sSnm5kqk58AHnD8XhcYicu7PE9SnDyqatHSdeLpmb1P5xfQ9P03WSERIKG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IUvly7PUDaM2fbERai/bncOY8uYfAvhIjoJswqVmpo=;
 b=pYIBCTDam36vTp8A/AWHWftx+ZkumEJioylgmS2y1uVp3adGNJ+a5EKCNzgXY724XC4omNC3PbW6HnXLMepzpuW8W/s7PRpwWGRGOWWIwyKTTz8lGJjYPnpQ0kdwHkU/8CilOmEf5uJRbdIVwSQrnBGljDst9kYCqCNP6OkL7cMrMPGqzrIt4oyrK4zgTbIZI4hI3ZSRoowByzEmjKcZp6+6YfysoR0fJ2OMgxwf2MZnK4A8SSKtdGhSzDyezXrdhX7k6COtHJUKf0Ws2nx2xncGsSBuHHiMjpv1bwYgCWve/8L9yQTrtc+scxTpT++9vkqibcGRw8cBNVT2SqgPvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8590.namprd11.prod.outlook.com (2603:10b6:610:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 18:46:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 18:46:39 +0000
Date: Thu, 16 Oct 2025 11:46:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe/migrate: support MEM_COPY instruction
Message-ID: <aPE9jWAlrUfmb4ve@lstrano-desk.jf.intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
 <20251015141929.123637-13-matthew.auld@intel.com>
 <aPBDTh2RA33TPaM8@lstrano-desk.jf.intel.com>
 <3950cf17-a681-4541-98af-c03ce8d64ce5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3950cf17-a681-4541-98af-c03ce8d64ce5@intel.com>
X-ClientProxiedBy: MW4PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:303:b8::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: dd834730-d9db-4914-54a1-08de0ce45788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zEiDZYrStkfYpdUwKez2Xbf2Fit806jZ92arcYgoDT8Z5ipYiosqsGcNAuVA?=
 =?us-ascii?Q?UjxATusU/rquGvp+DRYHCJXxV+RAkEfJB9Irp0SgGH3UtdBifr/6JKy3EoiN?=
 =?us-ascii?Q?PYOgGqS75Mt17w3dYgw6fgWhZtKEk4iWQqJvM3Vfj0IJkrVrZTSDK1BKu15d?=
 =?us-ascii?Q?io/N7FPTa6lMZ+9o3R0ja5gNtIii/U4oUlaTdXFjXNNQsYFC2yNJLIhr1bxf?=
 =?us-ascii?Q?INAS9K7eS8Ak213UbhUNhNDfTlsKQOzwaEvwoRqZe7NUkJHwU80asJhT2lMX?=
 =?us-ascii?Q?xVZ8nn5kAXQa82K934emz9Zuq/QG7AmEUkwqqEdyGpo2pHkslnFsNP04FArJ?=
 =?us-ascii?Q?CETGUPhnWKfdIra9nInM4KyPvUIBQtqx2tdle0d+0s18IB1Rt+tY7/WV95z7?=
 =?us-ascii?Q?fjJIcfqHvz0sfgkXBd0g7dTgIm3C6VjXK8dyhePsK2LqgVBw7OJZAjIJuMih?=
 =?us-ascii?Q?K3bFQQrsXNZ9vWoBBdvxvJCyIXIIWSltr1KpRRwe2bNhaw+ycaTjh32HA+bK?=
 =?us-ascii?Q?VpCXEmzSNZoqCNi1loRBW1ANLV8g7p3wePrO9rxfefzEzPCLV4yEwgB8cRct?=
 =?us-ascii?Q?NgbJsHHD2/YQxHvfzaAA5QH5Cas5DW8WB8/D7R0atFLtsYNJkNx18Iw4XEQ9?=
 =?us-ascii?Q?Gj0msbRj1WdqpRHFbnFSjWo9myKTMJjlyAamwO1RmxyOtAkhQp29utqxVVah?=
 =?us-ascii?Q?vT6Fy5GymFXulIZPKekV8XNEjzprgV9yUL6j7yv7T8V1+BfCvG0IXesB4dym?=
 =?us-ascii?Q?UNlN30A2Kb3L17bQzJCmUtSBPDsclEVqi7XGnM6eqsQm53NbJF1J+VG2mtbf?=
 =?us-ascii?Q?fo+/7Mt3Hgyf+jzUmrojGzmRIzDbUGMQ8oZO/FkhWbJ8l+AI7Z5B20o2zVTc?=
 =?us-ascii?Q?5293l9wdAVi+VxfNTiaxZBLH1gcEQ0WiGhhFlU+U0NYrbAhruKtEXHRz6hS0?=
 =?us-ascii?Q?D6zq4saiVO+vUlnDXifDFTQb3QRarwqTfGfRJ7CBeyhCcKpNyhJrbdKkFM/0?=
 =?us-ascii?Q?r3kHT90pOuJtVRwPWYJUlHBLEXfzB6qyVPQ/efWN0yoETvqxTc0k+MncbJPy?=
 =?us-ascii?Q?Y8PEJAKTy3oyKHLPXBxp46AFED5X3Hzdw9Kp7hs9LkA0f8upOAQJfV3L05wP?=
 =?us-ascii?Q?3DPs+rE9micnYgBbu9HmpB2zTpWdomcIDcxJbzMQFp3Mkg2WUGVzYyeIbo38?=
 =?us-ascii?Q?yQib0Sb2dHv7SMLLAVzMl9zHVoVY960kN8N80Z6ik8yHPcsTRcgsL9HKUQcA?=
 =?us-ascii?Q?4Mt6K9dKAQIJFCbkkR4ASEXbw+80Hygscf7786hMZmA97zBeZ3tn2Plc27QE?=
 =?us-ascii?Q?93dhS8h+EqZxE2T9jrMmOsHWx7ob4dfysHdm5vE3Sx7slfmsyMNEAwYUxZfI?=
 =?us-ascii?Q?CwOAbbmIOLbSe9pjESdMFBbJWm4/sYxH4QbdpDRm+nUHyRCBJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u1VERf+fOA6Dk8cNvXF2oH9PfsFYGdi2ppA2TqIXWw8DxomBm+lQsqRQWMHd?=
 =?us-ascii?Q?FVwHZMvlVf6Sgd8o6oagjZCRsOtV/N21eD/5N+M/OVAbKQutzAH9I1Irss+t?=
 =?us-ascii?Q?nyh8bvC1uk0s79Fdzt/QJlJzlnz+B6SyFWrNVIYsHYsLb+7wI8jvTc3bidfs?=
 =?us-ascii?Q?OBuAtR7y5hVitb5hjzmb4r7BBxdH21icmIXVyhwoBA3e7RdPdf8/JXufB4FQ?=
 =?us-ascii?Q?L5HLCcdIDb360Fb1bRUdl8RfYTUui3ieg1hzoXJAnZGa3MHlvLkQsd6XRghY?=
 =?us-ascii?Q?R4k1jogszf7unlcSt063OxoVcoibK+xT73HkrlvT0Wf5oblmH/8RhG68yU3O?=
 =?us-ascii?Q?TURvGSXjA1QFeOCA7A8Ol3nViKx1A+iRJeYlADRfvPD0WCN6kVX5WuwBNwgL?=
 =?us-ascii?Q?HmEc5gokR6T3usS/L7KRl68+QyI5zhPOJE/bYkMUw+sMmKHygeMN9/2Pen7N?=
 =?us-ascii?Q?7QUP2u+roTNJbtWGcejXjTtc5h2lf55i68zw94PK1lXKgoTeLiLcA2JKvt21?=
 =?us-ascii?Q?LI+tNWs3AEcRNBaYmjuy5rPDlLoHz0vmA+tnxnEIjYWphlMEmo5motJCOH4S?=
 =?us-ascii?Q?Ai3cCz9W7suqU0bLDXl/ijbP+bYBfwDJd2DOYsZdWuiSoonfhr8oqcFbKSTS?=
 =?us-ascii?Q?NP2at3O3eF3e3geDGNtc5PyDkXwDEvWVH2sIzsFfv6+RBzhcUCaP/BZ0xrj1?=
 =?us-ascii?Q?7mB80HGSEEmHuSxYHTj86zyXLGuf1K18/nxg2NQt8MKrq4CRSzrdVwJyOGAd?=
 =?us-ascii?Q?ZmDzsVBsH8QmlzuW1PZo7hPQQHRniRrblql4ef3258rPt7clx1ZxVjYh78ti?=
 =?us-ascii?Q?g6fomndocJIIhyPKahDvm1NjI1Q5DKtW3aNUFzP8gnKY1CprcnURCRXg1C2X?=
 =?us-ascii?Q?W/xpwZ0dUkHFuNrVHcagHaMKaK28siR1DO/bxZNvyyJi+EQpPZig9kHdD5Je?=
 =?us-ascii?Q?IYp6LbMxziy65SIC/FCU3ZlEzNfHDXrNO0XrWVVvUE1s7S4aSXpWVH/57RPb?=
 =?us-ascii?Q?9OYCSz7LHOkNh2WLGMituccaL+c9PP8I13x1M6W4vKQgnCnzPn71ncleVD2Z?=
 =?us-ascii?Q?pW02Jx0qS0vN0mQyE9xyYUYsqXXItVGDo0gw55e0lwEdL+uvL7LY6Uq6PSO2?=
 =?us-ascii?Q?3oyHyLEdylKuWnqcM5LtecjGpdhXFY4SfuyLtC/5enRT17HhHMo+b0GRy6dz?=
 =?us-ascii?Q?oKPQT5JQ2bbFKxyNGpHDnkCS8NPVGiHEfd1C7xf8x5JmR+nsN3eqG3Uf3qA8?=
 =?us-ascii?Q?BJNjgFIeBWTYCG8W8o8w/vNNLV51BNlOm/+TLRzjNcjkbtdqOiIEqKR6wXAn?=
 =?us-ascii?Q?HIa3h6FmPk0Fm84FzrL2Jjt8fHIOmShoZkBBnfxrOIEj8ufjQR6CGzRdcl6X?=
 =?us-ascii?Q?VSFfiRW8MOqwCD9U6Gahnr3Rpk1jS3IXwWODBXIdYxgPJ47ZOdMSmp9pl7o4?=
 =?us-ascii?Q?trWx9MWhNXBNT5IHnZnvHL1MuHkcNLtM7SdMlqbORW2cvMoXyE2qpudx6zND?=
 =?us-ascii?Q?kykPSoaU5EeJcNugbwkCdESyiRJywcJ8qv5Z6eojHi54n6NKrD6v2M7tZV98?=
 =?us-ascii?Q?V9R+quAuOUSEMjeOIQdPGIGuoN0ziAi+vab2Ivj45Fcz1BiEzc2noZWOzDse?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd834730-d9db-4914-54a1-08de0ce45788
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:46:39.7876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPVeVuUN/9H5roZR52Nlb87h4Y/Yigtbw9dawsjFFdPvdmP/5gOb3MunCKa1lWrlV/C5kiuEkg385vx2NSWEfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8590
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

On Thu, Oct 16, 2025 at 10:41:33AM +0100, Matthew Auld wrote:
> On 16/10/2025 01:58, Matthew Brost wrote:
> > On Wed, Oct 15, 2025 at 03:19:35PM +0100, Matthew Auld wrote:
> > > Make this the default on xe2+ when doing a copy. This has a few
> > > advantages over the exiting copy instruction:
> > > 
> > > 1) It has a special PAGE_COPY mode that claims to be optimised for
> > >     page-in/page-out, which is the vast majority of current users.
> > > 
> > > 2) It also has a simple BYTE_COPY mode that supports byte granularity
> > >     copying without any restrictions.
> > > 
> > > With 2) we can now easily skip the bounce buffer flow when copying
> > > buffers with strange sizing/alignment, like for memory_access. But that
> > > is left for the next patch.
> > > 
> > 
> > How you tested if this series has an affect on bandwidth of copies?
> 
> I only tested it from functionaly pov. Main interest for this series was
> with 2) atm.
> 
> > 
> > We have some SVM tests which can measure this bandwidth rather
> > effectively. I can give these tests a try a but it may take a few days.
> > 
> > With that, feel free to breakout the first 4 patches into an individual
> > series while we explore the affects on bandwidth for th last two
> > patches.
> 
> Sounds good. Can you point me to those SVM tests? I see some fault and
> pre-fetch benchmarks in IGT, is it those? I can try them.
> 

Yes, the prefetch benchmark test is a good one but it is software
limited atm so might not give the best view.

Running 'xe_exec_system_allocator --r many-large-malloc' and then
looking at the GT stats the copy bandwidth can be derived. I have
scripts that do this, I believe Francios uploaded these somewhere
internally but here is a public link to a script which parses these [1].

I can try to find time to see the bandwidth before / after this series
today and report back.

Matt

[1] https://pastebin.com/rZZN5sgh

> > 
> > Matt
> > 
> > > BSpec: 57561
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   .../gpu/drm/xe/instructions/xe_gpu_commands.h |  6 ++
> > >   drivers/gpu/drm/xe/xe_migrate.c               | 64 ++++++++++++++++---
> > >   2 files changed, 61 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > > index 8cfcd3360896..5d41ca297447 100644
> > > --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > > +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > > @@ -31,6 +31,12 @@
> > >   #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
> > >   #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
> > > +#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
> > > +#define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
> > > +#define   MEM_COPY_MATRIX_COPY REG_BIT(17)
> > > +#define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
> > > +#define   MEM_COPY_DST_MOCS_INDEX_MASK	GENMASK(6, 3)
> > > +
> > >   #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
> > >   #define   PVC_MEM_SET_CMD_LEN_DW	7
> > >   #define   PVC_MEM_SET_MATRIX		REG_BIT(17)
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 3801152b7f8f..da1fefb96070 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -699,37 +699,83 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > >   }
> > >   #define EMIT_COPY_DW 10
> > > -static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> > > -		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> > > -		      unsigned int pitch)
> > > +static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > > +			      u64 dst_ofs, unsigned int size,
> > > +			      unsigned int pitch)
> > >   {
> > >   	struct xe_device *xe = gt_to_xe(gt);
> > > -	u32 mocs = 0;
> > >   	u32 tile_y = 0;
> > > +	xe_gt_assert(gt, GRAPHICS_VER(xe) < 20);
> > >   	xe_gt_assert(gt, !(pitch & 3));
> > >   	xe_gt_assert(gt, size / pitch <= S16_MAX);
> > >   	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
> > >   	xe_gt_assert(gt, pitch <= U16_MAX);
> > > -	if (GRAPHICS_VER(xe) >= 20)
> > > -		mocs = FIELD_PREP(XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK, gt->mocs.uc_index);
> > > -
> > >   	if (GRAPHICS_VERx100(xe) >= 1250)
> > >   		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
> > >   	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
> > > -	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
> > > +	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y;
> > >   	bb->cs[bb->len++] = 0;
> > >   	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
> > >   	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
> > >   	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
> > >   	bb->cs[bb->len++] = 0;
> > > -	bb->cs[bb->len++] = pitch | mocs;
> > > +	bb->cs[bb->len++] = pitch;
> > >   	bb->cs[bb->len++] = lower_32_bits(src_ofs);
> > >   	bb->cs[bb->len++] = upper_32_bits(src_ofs);
> > >   }
> > > +static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > > +			  u64 dst_ofs, unsigned int size, unsigned int pitch)
> > > +{
> > > +	u32 mode, copy_type, width;
> > > +
> > > +	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
> > > +	xe_gt_assert(gt, pitch <= U16_MAX);
> > > +	xe_gt_assert(gt, size);
> > > +
> > > +	if (IS_ALIGNED(size, 256) &&
> > > +	    IS_ALIGNED(lower_32_bits(src_ofs), 256) &&
> > > +	    IS_ALIGNED(lower_32_bits(dst_ofs), 256)) {
> > > +		mode = MEM_COPY_PAGE_COPY_MODE;
> > > +		copy_type = 0; /* linear copy */
> > > +		width = size / 256;
> > > +	} else {
> > > +		xe_gt_assert(gt, size / pitch <= U16_MAX);
> > > +		mode = 0; /* BYTE_COPY */
> > > +		copy_type = MEM_COPY_MATRIX_COPY;
> > > +		width = pitch;
> > > +	}
> > > +
> > > +	xe_gt_assert(gt, width <= U16_MAX);
> > > +
> > > +	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
> > > +	bb->cs[bb->len++] = width - 1;
> > > +	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page copy above */
> > > +	bb->cs[bb->len++] = pitch - 1;
> > > +	bb->cs[bb->len++] = pitch - 1;
> > > +	bb->cs[bb->len++] = lower_32_bits(src_ofs);
> > > +	bb->cs[bb->len++] = upper_32_bits(src_ofs);
> > > +	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
> > > +	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
> > > +	bb->cs[bb->len++] = FIELD_PREP(MEM_COPY_SRC_MOCS_INDEX_MASK, gt->mocs.uc_index) |
> > > +			    FIELD_PREP(MEM_COPY_DST_MOCS_INDEX_MASK, gt->mocs.uc_index);
> > > +}
> > > +
> > > +static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> > > +		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> > > +		      unsigned int pitch)
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +
> > > +	if (GRAPHICS_VER(xe) >= 20)
> > > +		emit_mem_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
> > > +	else
> > > +		emit_xy_fast_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
> > > +}
> > > +
> > >   static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
> > >   {
> > >   	return usm ? m->usm_batch_base_ofs : m->batch_base_ofs;
> > > -- 
> > > 2.51.0
> > > 
> 
