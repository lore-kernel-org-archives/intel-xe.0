Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A897FCEF17A
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 13:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F97810E54E;
	Tue,  8 Oct 2024 13:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1z4w/ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDBA10E54E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728395917; x=1759931917;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=G7RQVuLTfOP2kWec8ZmFOs/Hfunyr//T83T9/mgeD4Q=;
 b=V1z4w/tihMF3vn29xndfLzZmOTQjUxlnJ/3lOXMcRVnkGK6qZFby0SLB
 ztP+bUJt4mga5QlErC9GXG3dUNeaxRG6vvgPZoXSNcX/IVIHaPcQhAh7W
 PXaMATfbT/w9SHyUy7JyxfA8Gehuy9sZPPY4cuUP7WLBRk+ITE0BG8NZb
 P+GGxNhSbcHpIW0QYxvI+LxLOsd6KIO22mzY2k59dU7mIyMxWCMgcN/Y/
 n6AapZKMGm6La5j9gnbBdOWXWBSJGEXUFeD0Bdqkd/DMrFfGLpLkmC12F
 IheOZStvtv1Us48k71UwmTXCpSVS+3fJbIB01hSkCTj3UylVPR/YXHLXC Q==;
X-CSE-ConnectionGUID: oIl5FExZRAGNpaK+BDovag==
X-CSE-MsgGUID: OZ1JeLdkQuO/aXKA00i6jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31377978"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="31377978"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 06:58:37 -0700
X-CSE-ConnectionGUID: p+Lt9GMZRP2qFTx+l6J6Cw==
X-CSE-MsgGUID: 07TUVQvMRfiNU6Cw5/b2qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76220486"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 06:58:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 06:58:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 06:58:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 06:58:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYkW4i3dC565NKgZ/F1Crp7IlDJBcYhdpEkvGwS3yF+3PLF9Rz9gS6ijl2W5gjGB6lEUELIGoDckQSZ2vMgU0QCmsrIPYZ7PqlSyqzAaDT3JqBVOkEwWFY/CUxB1Q0XeelonQlDts4/C+YhuXAS36Nh2EfgQEfs0ztvY90zeqdQEpSU5GX3Pfr+qJzxWZbGqYyXluXEVRRq6O0N5q8JZlsG4eNyVtMr4sv5TKzl/ga79Z3bmDALqgurRj7vWEWvS8jbhJrWPIpAmjoNCefUndanBImMZwz4S8K7dH9c7DaK1S+9pXayRRG4HHup/UV8SAWckzhl2YHxWdw1OQLRudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUMIHG70uYXCZXzccc1hzyI0L9vNM2uC1sWJ2NkB55I=;
 b=GcXcm2addv1TyQfQDvSgGKv0ebGWffMAWjzcRQWPzgutAIfVtuwFOGA4Kjpskjc+qSf7a0lZYCjFzSBIjjQUxQFyebFR5qfxnBnU5KYtdtx/JR2Na+rLZF/O932tIMxT6X639zE17QC/Sb02P5R54gHeV1YKd1UgWY3PS8KjupDgtf/LKutnHT4nNn8mtoJNRosPatKWpunXmxDJyxqbWRv2FSB5ExBzhkEXLMi6Okcaur9z1UI2eIAV/covE3xCDe3Cb8fuQeL5YKGX9t5421LzXySponNu2WbGgTvx6l3IYPmflsnCR7jtVw6IvjFH7HPbce2HFfmXHpRpl961Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6704.namprd11.prod.outlook.com (2603:10b6:806:267::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 13:58:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 13:58:28 +0000
Date: Tue, 8 Oct 2024 06:58:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cmUg?=
 =?utf-8?Q?for_drm=2Fxe=2Fptl?= =?utf-8?Q?=3A?= L3bank mask is not available
 on the media GT (rev2)
Message-ID: <20241008135825.GE4891@mdroper-desk1.amr.corp.intel.com>
References: <20241007154143.2021124-2-matthew.d.roper@intel.com>
 <172837659306.1202678.6578221947242897624@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172837659306.1202678.6578221947242897624@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: e6610fe5-661d-4171-9051-08dce7a14920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ft2UOn8PUvX4/6tuODwDUFGSW3BUktRl7JObpHOMHEJ7o0xxfooyYCi3mIXB?=
 =?us-ascii?Q?lwPlF+HThDV/4IcI2/TXxk6LTS+v+V/QMKjojzPKH9oWrN9ShE4qsuWLdDQy?=
 =?us-ascii?Q?3vEXecVx1mOby1zNoQgtwomBFazbyIif1eXGQNVNxnpJDiX76r9XpRsTqWdN?=
 =?us-ascii?Q?xwoY/DX0Xs4MWW1AwTDbzhgJOk+01LK6InjZtSRzhNfTHWY5RtqRgA38+67f?=
 =?us-ascii?Q?FcqUi37Pm260oWjPqhITEaGQyF9f7OX1OSNxKoMo8nXq9J9ghBBYD4Kg6Hdx?=
 =?us-ascii?Q?zZxsnOX4UFBC805lY9hGtTT1ee0RfyDjvbJVuDoa7eOQ+uWjK7jcB711xdqg?=
 =?us-ascii?Q?pY6ztcULTaIfi/DiAr1juGVqH0vgffVL9RLf4UpOBTAPXVAjB7he4CZwikg9?=
 =?us-ascii?Q?DHIh9ucg4z8Deb1qMdf2bxpPLXE2tTWLOy17khg+b3HwTy3kodeGLivT/x9h?=
 =?us-ascii?Q?g9r7F8mNwVj8stkSMvTczdX3KS/9dd3VETBxXEm/lXDkS2Twj5aoZ0grGAa0?=
 =?us-ascii?Q?AQr/d/wVv8fysh9O4rx5oIFEq4OCYF50ZY3+MX6SnCHPRqpW7slX4kMFiAFu?=
 =?us-ascii?Q?Tq5sLq0TruAmRPwlTqHEs53mgqsugOGyy7/1mr6wusLb2VBegpBYmPCW9k0c?=
 =?us-ascii?Q?DatmUjQAnOJrPUlyMczITmlMbRGr2tt0Tihvsw/GWr/FD4Dp5JHvAiNfVnsX?=
 =?us-ascii?Q?AccTo4s/8eD5ZJxRw/Ecd3Qqv27rDLwzsLIN59YoOw5MvON3dbYqY94eFodP?=
 =?us-ascii?Q?LqzhIgdSZ3PjVeRAPNKhXn8jqh+aHxM733qXax12X9yLaumb6Us1RgBbmaUo?=
 =?us-ascii?Q?kRnKZxXzThkSYidIAp3NbgVTde2ilwpRsirMsWEPf5dVuR7VAK7CcxHXbLlp?=
 =?us-ascii?Q?oNL3JHqo+co9L9MVmFyj1FoYKcGtAUnoO5lcF9tvEPb6NdBZpYY8Rl+gajj3?=
 =?us-ascii?Q?KiNZmg2VtfEsbwzSdnGbUGavsV5nKvGDf3ABATLSVg1eGru/9SXWbUeqYsvq?=
 =?us-ascii?Q?qVUPTwGzDyFDolvE/FamNYo6ZXP05LUSKA5RyiEQg2eVyvqbyYeU9s0agk+H?=
 =?us-ascii?Q?aeg6A1vgjmfKXwW7KNwAubXpF/eq04a7kD6vf0ShkkFlzMFBR6G1vjt9iDZq?=
 =?us-ascii?Q?pNvpW28Uewi2yNqW8lYWJfgaNFYmfcRK2yZ775NJi+VTjJ3Uh70YeLxy0Tnb?=
 =?us-ascii?Q?0M4ID4a5Ra0zrMvDiti3p2w3/1pnOW0FE41A+7E00aKwN1Hx1su4MXjTgxA?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xv2uKOCr4NzJBBTEm+blvPXKwBpoE8Zm1CA2YTRvu49F3WwjxFfe886YeZpy?=
 =?us-ascii?Q?HBPKyEIBHrg6Azl99rmRG8B7g74EhRMuVcMmbN/Dm8weEeeFtMn7EQ/VUySn?=
 =?us-ascii?Q?whb+49+BVdZS2TuFNK1IB9iUl/nUNltsGwiFozR9IQoxYXyPqP5k9tguB9Hr?=
 =?us-ascii?Q?CXjiscOUKZxSvlEluZ1SCCPrN2SnTh+i9FR4qUcdyvPetV/uIQJpie0YAeED?=
 =?us-ascii?Q?2Bg3gT8BvoK+0tZrLRmKvhCKAPGH3iPRpXMfZ1dgCsDCMqirXvkATvHwyjOZ?=
 =?us-ascii?Q?F1yz1378jmoeUfVYiAP4zXsAFAeBoMTOljPiaFHS+Pw7p3lqemYSODZ2FVSN?=
 =?us-ascii?Q?oqewEnmIPIhBqfgOrtULWyuPJ1NBSyyAg2iXRf35BReC2LxZ3XvnlbAB+o3b?=
 =?us-ascii?Q?GUAoQYdb9gEWEW4EeNYpR79SSoh6SJMXEJBmVL8vQioM9tKSwBm46bT8BVMF?=
 =?us-ascii?Q?bhZ0eZ4Zo0VoW3fqcyFZeBwDAxZ40D17ZCDodGXVVpc6/N9eDGjsPDD+ugS7?=
 =?us-ascii?Q?ttKYgs7ZGDpEWJ3HDqyZgurKwNuk/1HHDVKhUvE1Shkgnr5w7ftZwVJL9Hbg?=
 =?us-ascii?Q?KzYS4/NvAb9+B2mv/GPaOqDuDP7usA5bchKfIoTQwTABdaw6RjYWzn/9o0rg?=
 =?us-ascii?Q?863soZqY6f0QCuiVAImqfApn0YFxO0sbM6F/rkxRC9itI852Ku+IDquxewqs?=
 =?us-ascii?Q?fxAVNemhpDUUiV+XhxH/iNzgg5JeqUbF9+ctE+BFx5HC/JLiLO60zz1MoFG+?=
 =?us-ascii?Q?R8c9ajUxJVes/Uss0VQROtPsGIwg/bftOk46D0zEcDCWx2PjtNvxhi4E1duo?=
 =?us-ascii?Q?b6z8e247cCMyQQr9zIPYXA/lHsLaNq5BHLKKYKB4UK6e0qMGnDUBuJqtAJIn?=
 =?us-ascii?Q?eAPAtrfW8dQgmLrljP7Ro91tEtUKOEf9U2kUiHMqeJDzMBHSyOSPCWDlYIFg?=
 =?us-ascii?Q?8x/mXGFF1H8Fz1s4kGYNNDIaCODOuJgnsl3bfunz9FqtRKsO90ckJnYWrgOP?=
 =?us-ascii?Q?aF5tp/p+fiPbQmErfcNs0/Ganiy2a0u2IPxvqIjNswAqoB0h9ZmFTJr4KiX4?=
 =?us-ascii?Q?2Ifr4owKXnYjjwFAo4gkHYIQqIqkaRaiI0llhSgwq2e5CUboccNFw18cz3TH?=
 =?us-ascii?Q?ewSirG4k6fhfiFzu9ysKaeHesmp8d9jGEt7oZz3eb3nHrWtv7SiIR59awprk?=
 =?us-ascii?Q?6KK4UmR+yBweb8z1/GSbQlRE9BSZFfAnp6iSvadacHNirFSyeb0Q3YNOc98T?=
 =?us-ascii?Q?pbyKQEWOLxSb6SAuzOOylP3h5VosCwLNnCJxOcS7PcbfmkUpeVKdZmiLIuCp?=
 =?us-ascii?Q?Ecak7CVu71lPfYgy7y1HvTe0+L2SMAxBQHMhnIIBSBY8iMpaKW6AK9VU0NF7?=
 =?us-ascii?Q?W1TxVUf4912i0C7/hahxqPQluuOq958MiJzNZoen32p3+BT4uwrytOJ8WD/K?=
 =?us-ascii?Q?I5J9s1D+AzKZYhRXfkH65wwRRiS9Lkn41kTAIZvW5qbkte9Vznc4e1yRltR2?=
 =?us-ascii?Q?fy4TPqyKA93DhZEqGGwfi7EaLvJyVzAMWL9hKLxzrRxXqztXKWrN7OuuVEHo?=
 =?us-ascii?Q?EDLSO+V9rwvit/cUrmHncHGuyXVkTe4ZtGvkyd91p9iQUW4I4JdsQP31hTM3?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6610fe5-661d-4171-9051-08dce7a14920
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 13:58:28.7175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDsRYRr4yAuuiTDhFcOvjccmDE2b43NDKFp/N8maJUdwqybHMhIpeJ4cgRcH8gNX3P2zHOf2kzsMcuOI4DNUYyguS8tlV1665iPA65KhvJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6704
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

On Tue, Oct 08, 2024 at 08:36:33AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/ptl: L3bank mask is not available on the media GT (rev2)
> URL   : https://patchwork.freedesktop.org/series/139586/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634_full -> xe-pw-139586v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-139586v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-139586v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-139586v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
>     - shard-adlp:         [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-4/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-2/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
> 
>   * igt@kms_vblank@accuracy-idle@pipe-a-edp-1:
>     - shard-lnl:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_vblank@accuracy-idle@pipe-a-edp-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-6/igt@kms_vblank@accuracy-idle@pipe-a-edp-1.html

None of these display test failures relate to the L3bank changes in this
patch.

Applied to drm-xe-next.  Thanks for the reviews.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_vblank@accuracy-idle:
>     - shard-lnl:          [FAIL][7] ([Intel XE#1523]) -> [DMESG-WARN][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_vblank@accuracy-idle.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-6/igt@kms_vblank@accuracy-idle.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>     - shard-dg2-set2:     [INCOMPLETE][9] ([Intel XE#1195]) -> [TIMEOUT][10] +1 other test timeout
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-139586v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#660])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#873])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-0:
>     - shard-dg2-set2:     [PASS][13] -> [DMESG-WARN][14] ([Intel XE#877])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1407]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +4 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#367])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#367])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +6 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#314])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#373]) +4 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#373])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#307]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x32:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1424]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#309]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#1475])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1508] / [Intel XE#599])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#599])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         NOTRUN -> [ABORT][30] ([Intel XE#2915])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-3/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1421])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [FAIL][32] ([Intel XE#886]) +2 other tests fail
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
>     - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#886]) +2 other tests fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-lnl:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#2049]) +1 other test incomplete
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1401]) +3 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-adlp:         [PASS][40] -> [FAIL][41] ([Intel XE#1874]) +1 other test fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#352])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#651]) +4 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#656]) +18 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#651]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#653]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][47] -> [SKIP][48] ([Intel XE#455])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
>     - shard-lnl:          [PASS][49] -> [DMESG-FAIL][50] ([Intel XE#324]) +2 other tests dmesg-fail
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
>     - shard-lnl:          [PASS][51] -> [DMESG-WARN][52] ([Intel XE#324]) +2 other tests dmesg-warn
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#616]) +1 other test fail
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2763]) +3 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#1430])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@legacy-planes:
>     - shard-lnl:          [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1620] / [Intel XE#2864])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-8/igt@kms_pm_rpm@legacy-planes.html
> 
>   * igt@kms_pm_rpm@legacy-planes@plane-59:
>     - shard-lnl:          [PASS][60] -> [DMESG-FAIL][61] ([Intel XE#1620]) +1 other test dmesg-fail
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-59.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-8/igt@kms_pm_rpm@legacy-planes@plane-59.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1439])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2893])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1406]) +2 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2850] / [Intel XE#929])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-466/igt@kms_psr@fbc-psr2-no-drrs.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1127])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#362])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@max-min@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][68] ([Intel XE#2443]) +1 other test fail
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_vrr@max-min@pipe-a-edp-1.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#756])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@xe_eudebug@attach-debug-metadata:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2905]) +5 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@xe_eudebug@attach-debug-metadata.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#688]) +3 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-beng-small:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#261] / [Intel XE#688])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-4/igt@xe_evict@evict-beng-small.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1392]) +2 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html
> 
>   * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          [PASS][74] -> [FAIL][75] ([Intel XE#2754])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-8/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#512])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [PASS][78] -> [ABORT][79] ([Intel XE#1794])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-5/igt@xe_pm@s4-mocs.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-2/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][80] -> [ABORT][81] ([Intel XE#1794])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#958])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#944])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-5/igt@xe_query@multigpu-query-oa-units.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs:
>     - {shard-bmg}:        [DMESG-WARN][85] ([Intel XE#1033]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking:
>     - {shard-bmg}:        [DMESG-WARN][87] ([Intel XE#877]) -> [PASS][88] +1 other test pass
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-bmg-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
>     - shard-lnl:          [FAIL][89] ([Intel XE#1701]) -> [PASS][90] +1 other test pass
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [FAIL][91] ([Intel XE#1659]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - shard-lnl:          [INCOMPLETE][93] ([Intel XE#1616]) -> [PASS][94] +1 other test pass
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
>     - {shard-bmg}:        [FAIL][95] ([Intel XE#301]) -> [PASS][96] +1 other test pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][97] ([Intel XE#301]) -> [PASS][98] +3 other tests pass
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-edp1:
>     - shard-lnl:          [FAIL][99] ([Intel XE#886]) -> [PASS][100] +7 other tests pass
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - {shard-bmg}:        [SKIP][101] ([Intel XE#1503]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-a-plane-4:
>     - shard-lnl:          [DMESG-FAIL][103] ([Intel XE#324]) -> [PASS][104] +2 other tests pass
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>     - shard-lnl:          [DMESG-WARN][105] ([Intel XE#324]) -> [PASS][106] +6 other tests pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
>     - shard-lnl:          [FAIL][107] ([Intel XE#2948]) -> [PASS][108] +3 other tests pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][109] ([Intel XE#899]) -> [PASS][110] +1 other test pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@kms_vblank@accuracy-idle@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][111] ([Intel XE#1523]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_vblank@accuracy-idle@pipe-c-edp-1.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-6/igt@kms_vblank@accuracy-idle@pipe-c-edp-1.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][113] ([Intel XE#2159]) -> [PASS][114] +1 other test pass
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][115] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [FAIL][117] ([Intel XE#1000]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - {shard-bmg}:        [DMESG-FAIL][119] ([Intel XE#482]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>     - shard-lnl:          [FAIL][121] ([Intel XE#1630]) -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-lnl-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [ABORT][123] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [ABORT][125] ([Intel XE#1794]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [FAIL][127] ([Intel XE#958]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-adlp:         [DMESG-FAIL][129] ([Intel XE#1033] / [Intel XE#1727]) -> [DMESG-FAIL][130] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324]) +1 other test dmesg-fail
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][131] ([Intel XE#324]) -> [FAIL][132] ([Intel XE#1231])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][133] ([Intel XE#324]) -> [DMESG-WARN][134] ([Intel XE#324])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
>   [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915
>   [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634 -> xe-pw-139586v2
> 
>   IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634: 39a016b276ce8adac629cc6c31892d0b7d2af634
>   xe-pw-139586v2: 139586v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139586v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
