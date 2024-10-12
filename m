Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C3BCF2589
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 23:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1FE10E009;
	Sat, 12 Oct 2024 23:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lC4mt+nT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BD210E009
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 23:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728776765; x=1760312765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3SeBImfg+uFx2Fvi/jHPWy6vwyGGfhefsxZhb4TWB70=;
 b=lC4mt+nTUzTu+Ne8JSc5fT/wvBY94UW+qpw9LgBhjy1x960PplonN/mh
 I1Ut50KurxSKnGkiAmbD4PW1jGYXaRflLQ/udvpEEtKNqObjMhiKuEzz3
 6i548Ds/FCsKN0A+IrXmAB3Il8Ke4K9CdkAdsqOQUpNbtOlcnpf7L4h96
 Xd0TrhgeS1fTt6T/igeUqv4Jy2OVwQFJLYBl4fkexBYddcIma9kNm1nsA
 10Le1eU4umgCY7fo1nY8r2YKIokFvSmj7+XiFxLKUc+7u2kGZnJjX9f6d
 dYNHQhYW4y134UAq0XVqEjB5f4RMXsk6FmNVAfNuUhEgAJkrYuRrO31jG A==;
X-CSE-ConnectionGUID: siEf9Ny0RQiGQ+40EhOrVw==
X-CSE-MsgGUID: VgPjw/StTlKHeCTn2xzc3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45657176"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="45657176"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2024 16:46:04 -0700
X-CSE-ConnectionGUID: wd0+DKf6QPO0U10B2LV4mg==
X-CSE-MsgGUID: nAW3i94jTt2GCeezoOQPsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="76863818"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2024 16:46:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 12 Oct 2024 16:46:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 12 Oct 2024 16:46:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 12 Oct 2024 16:46:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxE8EnF+pPk8O+EaIryi9Aa88iSbG61HKawdhIzXDzAgjPLECFVMIVmASYYBRmKAIEDHHh6gtO5IfCHpbQEp+V0prb4b+Lo5tcDlhJxBsHfHhN92sjqxt8zg/FwKZQ3cWXAISGbaUQ6OWNmApw7nd57DuycG3RgeApDcVVhYDwjyPfi5qb89qa3Oxerpw67KH6KaYpFlYgW3oPRevCiwqsVzItxnUyHSzUurfiNJp/9LawvdRubgnyWItjyHEJOm2QvvVAJrW+2xqdP/Rlc6orXBOduX+/3HpOi7AP7+cb8mpo13I1Vm6Sm1x2hJcxPq8Bx4NtWE/XyelCD31stKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsICSCM3WkMDrQGV1gBymHuFG0xL14+mK0JiVDRQL0U=;
 b=vaIFBDUMMpMYPd7M16fjbh200YqE2Sixx792qjkjbg2mERdsQFSzIWDIsSmpbxmIker5k8eUOgrcTeoGkD/8kEg/wJbuDXAJE17XvHePexMJpLdDUYZ5xXalrLZNljf5bYr+FYZouGJ11nF/+eJMXLWJCC127mQmpEIfKEtbTLjO3igXgomfpF0xcPoC2GQOPyeZ3bnT31hV/hWxdI+9ocsZqpCM+dZwXCshgLQ7L5tTvYUxMgaJiNiEP4mJ4aXoHFrQI/qRwOxYeaoCOl8jOH2UxHXXN5mbEOxC+1wS6QiUIGaingMD/e93xjq82m9kOdNBUlv0iqa+YSjmO5xC3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Sat, 12 Oct
 2024 23:46:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 23:46:00 +0000
Date: Sat, 12 Oct 2024 18:45:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <7k7rfpbdy5ky3w3fzgg4vicrgooqdtnvhmh3fgpmgublqkhgsh@ek3j3leh2tt2>
References: <20241008073628.377433-3-balasubramani.vivekanandan@intel.com>
 <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
 <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
 <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
 <l2a4np3y6htwcp7emufsrajyrozpmguwm4ucosbu2ne444jpwa@2ohs4dowlmr6>
 <ZwVq0JIEz64OhROM@DUT025-TGLU.fm.intel.com>
 <ZwVzOahncbCljo1f@DUT025-TGLU.fm.intel.com>
 <Zwe0bJJkKs3p-9Q8@bvivekan-mobl1>
 <qkxumw627jw4ukxsdywxhlzziub2324ydn43isdrp7yn5cfwta@vpipjndue5is>
 <Zwn+ZGwd4o9wNx8e@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zwn+ZGwd4o9wNx8e@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW2PR16CA0048.namprd16.prod.outlook.com
 (2603:10b6:907:1::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 837fa6c0-b45b-4638-b0a7-08dceb1806a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m04u1orIwnFO0VDFhFrOAV3Z55f+fm8M8rPva1qgHG+2mGEjuk5sgcIUFrpZ?=
 =?us-ascii?Q?33RP0fKfow9cfAU+1YSBT8SLqeungsXZFrunqDaKJP8xX7CI/77odZx18hs6?=
 =?us-ascii?Q?vs/AeIjA2KWBGZQBBbdiaWt1S8hqw7+8ni+N/KbTF324sqve49TZI4WjuB5Y?=
 =?us-ascii?Q?6tpx3g9O/fQq7ymmke7PfmkVTVb/bVKtIId8xHwnbp3qw0pn5fvP3FVR6Q6C?=
 =?us-ascii?Q?1KUxokLv4Bw7gl3fX1WPhT0H7s5GgWWXJ6Cwop7R7Go+oDmlXrOkZW2o5NyO?=
 =?us-ascii?Q?TKCphB1TZa4ZT7u25t1xV8UjYpGW5g9ECA/RSbEKim0p4oxAQu9bX5CLYdsm?=
 =?us-ascii?Q?pbfjaN2m9kQYiiaO38JGg7tqxp2rPN9ZKob3jhbvi36CsKgGehogBlVpDrNY?=
 =?us-ascii?Q?fAAyweoYcCASbm9WyEEYhwU6n2Y20DMTCe/NuM5mhyOxVbIZmL4/FTzIMTDf?=
 =?us-ascii?Q?Gk3m7FvIennvuyfOyZ9I4eoA00d689n3Yw5wzEordeakqnjPuyUxV8u9v0rM?=
 =?us-ascii?Q?YUZ98Hrf/Vhf7/gRibPUL2eImQ/+2afc0v4EU5mITqF6riNRVSjHItTQ7TWC?=
 =?us-ascii?Q?UENym3haR1iPjWnHJMNm8ae8a430xHvCn4DyAMDruL+FuU//fpLuGbLLyrFd?=
 =?us-ascii?Q?22pdZIz1UeST636ajpsdPR0+r8g2UndGu87Rlrhch7y/pluTZVU+yg8HrsFe?=
 =?us-ascii?Q?GFZrIT6uqWGaKeJSKzIiMWnqCdYvV+YuQNfN+IXcFxRN+OrXTyY5cI3buVsU?=
 =?us-ascii?Q?YIV7M0aslf4fPNizA/pgEsWmgL7SdebuZv5KR0GAr+SGFNmEooM9qAsMkgQO?=
 =?us-ascii?Q?3zuuVlOsDaiGkerVFQ/kuXofyW50SNDTHx1mMSgkETMUrEvNV7fFP9INL4kQ?=
 =?us-ascii?Q?gFS/y6IEqi7kx7P+PZxxj7EACK+gLHFDlL7JAfKanjxNSZ+Ud+kA7DAsY3iE?=
 =?us-ascii?Q?QtJqha6CGrqkaO4hPdvKG9QIcVdNac4QIpvlaJ/IQtpwMnQD5svfp+Ult8Qz?=
 =?us-ascii?Q?2xD+qeA94loCGJu/wnHT+/Br8ub2cNSsKDGt19sr03G63j4i3Ck0GhNCXzw1?=
 =?us-ascii?Q?nbkYVDkD8K/TeqG6wJSfhbEzvtcx2t+Mhvziw+XQZGC/tJTq5XT4MkwhpcxG?=
 =?us-ascii?Q?Uz2GICp/PGdcrETWb+tHXYEBxsN1yYN5/4gJq2DF6Ut+pWxvbWdTH2T4hvuf?=
 =?us-ascii?Q?3dVWyzvIBufkdq4pDDhmqhRszhFquxWH6AogBwz1j9nG1dvAr73TOfh18Ol9?=
 =?us-ascii?Q?eTe+1rcsXl5JKElOGey0WNlttPQzn+wO47nf57HXgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NHBhq//O0+573EGvOYpUEJIOXsiUVQ++03Te0vJQe/H6ujsdl+3JdvSm4nqI?=
 =?us-ascii?Q?mITW3lMH7xe0o5c+HWA7VwUq06pVKMMoHH2JmU0YlBzVkPgLlN7iYj0zl+iF?=
 =?us-ascii?Q?CelsfWq2w20ARqOCN5bR3qOsjalCP067tO9RvCVYojieP3d5KTR0PxKNO+Ps?=
 =?us-ascii?Q?0fKfWM/ienU2Mlempe/VafrEEiTxSCgRAOyn9tT21tbqjM7hQ+btHyLtRG2+?=
 =?us-ascii?Q?wANFh/zMEcUH0qQYmZ+i6Xyn0mrhfUzlZOQwQX4vNpXI+fRak9Nt61ew3zJc?=
 =?us-ascii?Q?Gm6gBz3nRH0FvpZhWX4LHJzrKpyyWgZNJ5j4j8B5tcV6WosDOVRAqAXKXpfj?=
 =?us-ascii?Q?mqNu4qQDsZWl90QVYyk63V0COZo3KTtsHfvwBgbKWwBOhVCLthjpfxO1x0Gw?=
 =?us-ascii?Q?XDX902iQqHZWzSshLJdf3w/xAenDw2e0Jyq4FI3b1woXKbgzSTQtE8HgCBlR?=
 =?us-ascii?Q?uy0m/7gYTIRt357NOq7eo9N4MMSAH6q0gaNmG43fRItfn2u4J7XclGZGlF70?=
 =?us-ascii?Q?LL6Wu7JwFS9z0ThSqYwjT0PLXPiWt/UnaEx3oOqLc+FxJKq83K0YichctiJ4?=
 =?us-ascii?Q?wuBIVd34Su3rdfeq/shZB+w4DkmByoRcsp4K9ct/kQnz5B1LeCcaqKxGHr1W?=
 =?us-ascii?Q?l8BBpVEUKsZHqhF7WqEaqDBUmy8mAcxbTFlLZYZKyBZObOkvruPJ6XNfAqK6?=
 =?us-ascii?Q?CPUH7aOewYBt3KRZuwnGjtTFHLuV7UmZJUeAtm7CP9zkvUDKvp2yOYBYj0uH?=
 =?us-ascii?Q?c8lW4tn73jBvLifLDEfA4/Gcf+MmwMiZm1FYoc1eGA7r6akJw/8ZgW8JJdhO?=
 =?us-ascii?Q?WX5sc05sH2CcgWFX1BQSVlo63nqjkMrBGdK71W4e0aQJi1ewZ8BAEjCp4tnU?=
 =?us-ascii?Q?RDrPgZzaOlJ8EcwD7ggDWjHK+7pQORZUVL8/ZVX+O34FpAkm//WlxMTais4j?=
 =?us-ascii?Q?jNI5H2y3IGTDBlcDZzDBaf64uftG16kJbA/1t3BC7opooACrzQXE8tO/KKVG?=
 =?us-ascii?Q?DEXgSmQZaP/GpUTjZHBgC2aqBHeefAjp00SQZlRjdKDRFahSYBXTW1GKyGOn?=
 =?us-ascii?Q?HJwgkaf1MsmxWBvhFkBX0HxnlooSFRwHY7dK/wvZiLZ1h3oQkq9wWW94Y3zU?=
 =?us-ascii?Q?u70vpOZ/N5/YtbIX8CuJaL6z9+ec1+7NHzaRM93Kh33sc3QyKraNXtHr25FS?=
 =?us-ascii?Q?SiStUqioF49MOP2+f0T5fzbCmGQO5lLp8YPzEl+DZpBYTvRlNVEPzpogXhtQ?=
 =?us-ascii?Q?EzAavqJlCdfBDkdouMybQb5el/OcVDeWHFUBnhD8Do6qD+5sInlrvyWCYGWb?=
 =?us-ascii?Q?JnQ0xfjOkh9LklLZq6AU6OJUapaCOTj7aw3B7bjSqoHjJ0myqCbLUAgxlLjL?=
 =?us-ascii?Q?LN1bQyNZ9P/FxHdKeSrrg3/flri2Cf4pkTfWhkby/DvrrfGo7+j2KHjO8u1H?=
 =?us-ascii?Q?CZiEPQYFTXlqBQYvWZWbfEoNgJn07qogmTM7d7OrsbwG/eHhGg8YpPU8gOen?=
 =?us-ascii?Q?iB85wi0/s9A+eXj1hc+ispnrQXc85LQ4w11fl3f4s0hK+ogNo7wjDMDgJvJ/?=
 =?us-ascii?Q?CUXWrwVqNVItbnvhXjyMPuYnbTKuTJVSxlf/k0NCLm+5u9XYeulpY0hTrVwe?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 837fa6c0-b45b-4638-b0a7-08dceb1806a6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 23:46:00.5022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7Qr2LMv60JVjbYG/9hD78b8Q5Z5h7UiylibAkGyRM1PKD2SzZYB1lISjYBnqApLscge+8U6QQAnQ4sIiVvJ4NiR/exOsmvEDBBueOpMkGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
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

It looks like I forgot to Cc, so let's try again.

Lucas De Marchi

On Sat, Oct 12, 2024 at 04:43:16AM +0000, Matthew Brost wrote:
>On Thu, Oct 10, 2024 at 11:02:56AM -0500, Lucas De Marchi wrote:
>> On Thu, Oct 10, 2024 at 04:33:08PM +0530, Vivekanandan, Balasubramani wrote:
>> > On 08.10.2024 18:00, Matthew Brost wrote:
>> > > On Tue, Oct 08, 2024 at 05:24:32PM +0000, Matthew Brost wrote:
>> > > > On Tue, Oct 08, 2024 at 11:55:03AM -0500, Lucas De Marchi wrote:
>> > > > > On Tue, Oct 08, 2024 at 03:42:09PM +0000, Matthew Brost wrote:
>> > > > > > On Tue, Oct 08, 2024 at 10:20:15AM -0500, Lucas De Marchi wrote:
>> > > > > > > On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
>> > > > > > > > On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
>> > > > > > > > > Drop the exclusive client count tracking and use the filelist from the
>> > > > > > > > > drm to track the active clients. This also ensures the clients created
>> > > > > > > > > internally by the driver won't block changing the ccs mode.
>> > > > > > > > >
>> > > > > > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
>> > > > > > > >
>> > > > > > > > Is this really fixing anything. As far as I can tell nothing upstream
>> > > > > > > > opens a file internally (i.e. xe_file_open) is never called directly.
>> > > > > > >
>> > > > > > > should fix this case:
>> > > > > > >
>> > > > > > > 	open()
>> > > > > > > 	close()
>> > > > > > > 			<---- race here
>> > > > > > > 	change_ccs_mode()
>> > > > > > >
>> > > > > > > because the close is not completely sync - the cleanup where the
>> > > > > > > previous number of clients is decremented is executed too late and
>> > > > > > > subject to a race fixed here.
>> > > > > > >
>> > > > > >
>> > > > > > Ah, ok. But then IMO just move the clients.count decrement to
>> > > > > > xe_file_close. I try to preach solid locking / layering and this seems
>> > > > > > to go against this idea.
>> > > > >
>> > > > > why do you want to track the exact same thing in 2 ways, one in drm and
>> > > > > the other in xe? "Are there clients connected?" is something drm_file
>> > > > > answer and doesn't need to be duplicated in the individual drivers.
>> > > > >
>> > > >
>> > > > Well layering, making assumptions about the file list means, and not
>> > > > randomly deciding what we can and can't do with locks we don't own.
>> > > >
>> > >
>> > > I looked at this a bit more, if we want to do it this way then I think
>> > > at a minimum we need a drm helper for this.
>> > >
>> > > e.g.,
>> > >
>> > > bool drm_device_user_clients_open(struct drm_device *dev)
>> > > {
>> > > 	lockdep_assert(&dev->filelist_mutex);
>> > >
>> > > 	return !!list_empty(&dev->filelist);
>> > > }
>> >
>> > Still the driver would be required to use the filelist_mutex outside the
>> > drm layer. So will not solve the layering problem completely.
>> > Otherwise we can define two helper functions in drm, the first one would
>> > check there are no open files and returns true holding the mutex.
>> > The second function can be used to release the mutex.
>> > Does it sound too invasive?
>
>I'd say helper to acquire / release the file lock indicating it is ok
>for other layers to use the lock. Then add helpers with annotaions (like
>my example) for internal access to that layer. Maybe a bit much, I find
>myself writing code in this style these days.
>
>>
>> yes, and I'd rather prefer not adding these helpers.  If someone wants
>> to add helpers later and convert the current use cases, that's a
>> cleanup/refactor that can be done on top. For me, these helpers are not
>> really helping.
>>
>> Rodrigo / Thomas, any thought?
>
>Another opinion would be good. I know this seems a bit pedantic but
>locking is about the most important thing a driver and certainly the
>most difficult to unwind is we do it incorrectly.
>
>Matt
>
>>
>> Lucas De Marchi
>>
>> >
>> > Regards,
>> > Bala
>> >
>> > >
>> > > Matt
>> > >
>> > > > > At least it's also used for similar reasons in amdgpu and vmwgfx:
>> > > > >
>> > > > > $ git grep -l -e "->filelist" -- drivers/gpu/drm/
>> > > > > drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> > > > > drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> > > > > drivers/gpu/drm/drm_client.c
>> > > > > drivers/gpu/drm/drm_debugfs.c
>> > > > > drivers/gpu/drm/drm_drv.c
>> > > > > drivers/gpu/drm/drm_file.c
>> > > > > drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>> > > > >
>> > > >
>> > > > The AMD / VMWGFX usage certainly looks wrong to me. If the file list was
>> > > > meant to be traversed by drivers there should be an exported iterator
>> > > > IMO.
>> > > >
>> > > > Matt
>> > > >
>> > > > >
>> > > > > Lucas De Marchi
