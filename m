Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68970CAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 05:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8F210E041;
	Wed, 17 Sep 2025 05:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRW+8dTT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2094D10E041
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 05:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758087830; x=1789623830;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dlyHFhTX7gpEDplA1qDYj6dXNRUJ6AZNZL5JUCZlUIQ=;
 b=NRW+8dTT9YxdqF7X5dkBhwTPYN4vu2kpNBS65eFwvxt3IL808nEkfemt
 +1EA44mzfImBheX+7p7HQR/g3K1FkhcvMscAnxFVi5DRAOt8ZX/IJ1ZAK
 0nbMKopT1EN5a8oeI6Vlp4HI9RsRXZJ4PEv9YKf5asCUTd7kpFhLH6XWQ
 j+QfwHqe9E2Eh9TBI8fS6QIclPj0uynrmDoGDB8rgl17/Z+0Jo2qgj/fO
 gu3aMu2dszxGsxDqP/3LW7Yag5TplNWbCVehSzLJjGzXWh4cXOqXkZxJl
 Qn9cyUlZFsH8ffzYoUfaOJdnuQ05WrkvZtSetAbey1tm+q6IB55yJsn9D A==;
X-CSE-ConnectionGUID: UkO9dHItQByns40pLlBIvw==
X-CSE-MsgGUID: FXLN/m2PTvWtgRLRV/b6ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60441812"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60441812"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 22:43:45 -0700
X-CSE-ConnectionGUID: uazy/Pd5TkiHoBapwFGKGA==
X-CSE-MsgGUID: 4zXWIDh7SHuSUs/K0Dn93g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="174712976"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 22:43:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 22:43:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 22:43:43 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 22:43:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+Tqga5uSN4cjrLAOKkhwbOXZiPwXHdSqtpEr7wzATzpoNYBAvy8aAxI2bxn3WhiCazqZ3kb2ZUaymRZ7mdRjkwpf9iCBgzknYRsTlRwh0/9f6PmUg246qZYd0h07vBICUZ7+nXmhpB9a1ir8yX+vGZeaUH3wWD5gPuzZJvpmIFJObWX/+Jxcviw+P5TQo6OWYiUEkLBzBQmf6Viz8nzulPTa4XTueDEUUe+tZJltJ+OzouxnhAXzBIMflxiq2MWwj2QNFVQcooaaswsqKuGh0+BLQVAi84zDB9QCaREggD/XKMjaL0aiTLNyydo/2O1hIirU7p3fej9aco8N4mLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTw5GOqu09/uzomPckCPhExwNulfhlNTEJkrJ2gvTMg=;
 b=YTa98KX2oYJDdfgVWystaFAta+WW/3//YxXWzt6XuXDNrzZZruTn6sYqjRwCGUXDPcUw4Vvt0j+id88sx4TzLEp+CAENn23YZB3LS8NNfz+GaXSRnlqvBJdQduzERhaIVRhia9xJML2g5EWce4P/CSSYZh0Ew04IoUjj9vDaVumsadyyzKXDkz6bsNMRm3boeYFD/avgctTXuQgjdaZbfU8Ke2W/p3gP3mmtLCxz/BHn9MbW17SvAZRtk6U2gpLcP5y35yF+UAJZAobsWCmYbXeU2aMBeR5cEbiiv+Gtu2xZQg2/JFUKNUDjDe85qi6EhLh0F7sCH26GoOStlekVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 05:43:39 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 05:43:39 +0000
Date: Tue, 16 Sep 2025 22:43:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [RFC PATCH] drm/xe/dma-buf: Allow pinning of p2p dma-buf
Message-ID: <aMpKiNn2I_zBhZ4N@nvishwa1-desk1>
References: <20250916115322.23293-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916115322.23293-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0001.prod.exchangelabs.com (2603:10b6:a02:80::14)
 To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MW4PR11MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d44e02-4c45-470e-8882-08ddf5ad2731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?X7L3RV5Flyg6zPFmtY/VXPcbjonjVjXhwJxjmarMG0pZ0oggde8QdL82eJ?=
 =?iso-8859-1?Q?5vf0I+yltpHRa4VeyskEOzrvUSckKpZnHmrPesdBUYYcLJVkxXTd0MEBQo?=
 =?iso-8859-1?Q?SoVnlB3LLzfAsGJCV1cdgmqLCDGXXg1NaMjFoVNMxB8zNMB8shi2zJ5MLn?=
 =?iso-8859-1?Q?Xhb6Il+M/uMR4nlk80Rqui3yKqcqV5F23KMjP8UuKjH+KX2nsK+BkT40CK?=
 =?iso-8859-1?Q?gzdEXtcNms2vDkFTMzSgptKmv0qbQ/tjCIo3ZKcm4HrMXGGTUgFGrGEMM4?=
 =?iso-8859-1?Q?ggdWFYjXviKHB2zF6uEB2gBho52zbJDJvMZvo/GjYULob3iK7KSC2ic8HG?=
 =?iso-8859-1?Q?XgkdtgNFcOLUiTgUgAFqffCt98SjQ17rpGOv1Vcm1O/JR08nsAUDF2WKmS?=
 =?iso-8859-1?Q?Bfbs/rIzPFakKakPPIDOUXtZzqXZSjffHHR9J0M9pmBhDhDmtCcUbpvgNZ?=
 =?iso-8859-1?Q?7g8m3r4HCKUUSMNJsu/nUQR52HcXJD/NI45+HYtjiXoqr6oDXTUKIvV/YP?=
 =?iso-8859-1?Q?ZCcJgUfP57Bz05WPJBM0CoqjQr00L2cWHGWX+/HrMf4kXB7NMUa35/InJK?=
 =?iso-8859-1?Q?v3aJTCfead6cxjoE/bhKMdrrtw30w+9ORUmfB87dyxDjH8r92vkvvS6qg3?=
 =?iso-8859-1?Q?oUZ2S8bWcaSTqpuJS8QAlmhAfFzfcvUIakqOCdvhhTQBIy66j3OVqum/3p?=
 =?iso-8859-1?Q?WRPFFF79CmqaKQk7oIhX8W/R8EiATsFNMSAowb9C1pxwJBmYw0q2IKmAQo?=
 =?iso-8859-1?Q?7GS3CXDPO6Xh/Cf9MJWq+0cr2UHJYYWABIxx9NcpOu+cTF+gM9ai6m9wS+?=
 =?iso-8859-1?Q?0RJicOsZXMoFAyKNuxP/YuuGHUMyjhducH1J3nTamC8+qD8JpzVsfjfYFV?=
 =?iso-8859-1?Q?/Mtzw7m423iPxXkCGBlrpIMOGPJmKAUAHV31n96Y7ZE1eRS7QzbFgnBVNh?=
 =?iso-8859-1?Q?l8aQPjVhdbyuc0CLliPpTfynGLY3uZ+VEmyaUQrRiv1E918rvBfkhyT5vs?=
 =?iso-8859-1?Q?DRfgl3nnXDAuu11cxHnDL9yBdfS/Myy6eQTP2Q+zth9IDMKwYpQM+lDP9B?=
 =?iso-8859-1?Q?hbuorngJmeNj5BmXLvIX3ifZdNzS+b7tC7AMrcplRiUqtn/8P0qIWegX74?=
 =?iso-8859-1?Q?tpThU2A3X6rswJwBj4IgwoareuTOZ0TAw6mcqKSCEeTShA3+aYdSWuCDrk?=
 =?iso-8859-1?Q?GoToecOQQyZ1SYClULk62N98D0JScn2hZMb97Isl5pr+Qu3n80ue+WyJ77?=
 =?iso-8859-1?Q?qfx+La1UH6zIYjs8rv0WLun9XsxrCzn2vbfrvnTHKF6orS0FS4UpQawYQl?=
 =?iso-8859-1?Q?tZpJAn7GcIlidzvHNj4CvPIxuoPr50qe9jaE7bT4XnKkVTyEfrUqVPCOnO?=
 =?iso-8859-1?Q?688HIO0HFMQL5VrnwM7HwhlDK35XZQSuE2ShFX9ifFst/xoyAMqssrArKi?=
 =?iso-8859-1?Q?t0w0pTsbpJFvIX+XYj/EEbkH1oU6X0xjpBxCmHhytz9Z3rBNYIeUHgPj7L?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HCHnmZMDY8ak7OjvJGxS4GBeM+hS9iEKZaOx+nI9BRuFmTUKE6s75E3pyl?=
 =?iso-8859-1?Q?HnIATJLxlnztKERs2mTOxvQxkpTT5QURCIjLsOq30a0Aiq2YDVCPzFWIRQ?=
 =?iso-8859-1?Q?/HA3KfgMec30FfVM9KN6aMD13nhM8CSamnJTirMnxMhQZWiYsQcVTkaqmM?=
 =?iso-8859-1?Q?VdGjV1ZnSVEokhhVR9n+CkAiUICq5RiCTeAkdRnQiEg74CAcIJkWWbOzqA?=
 =?iso-8859-1?Q?+xc1FHGkiISBdXdL7Mhvz783St7MNvmuj58qfDzFyAr7zgV/inNI71kxc2?=
 =?iso-8859-1?Q?0K+t1D7mpWeY7cbk/hWyKFGkCCwqdATpA5xdOtEJJ6je0WbPPexdOrC0tK?=
 =?iso-8859-1?Q?JmTUFAVLaojUqy6QO8UX85xotTRIWtZOP9ll8061y5PtCROsW1XiO6yR8I?=
 =?iso-8859-1?Q?plHszvr6oDJN1DmXpJglIzviz69RS9T87z/pxU6orxzunWSUiiRrXT1t3G?=
 =?iso-8859-1?Q?pCwVOWf5Uhuhq27IRNGmxXMMGpOLr4SZgVKkYQI548z71C3Q8LeGLgPGW1?=
 =?iso-8859-1?Q?HDAeSLKy+Cnu9eWJFFolswpOuPfElfQyG8K0hh8J1k3/HbvpA98mAGCt3L?=
 =?iso-8859-1?Q?F4sC0qABfsTR+MTFoydn/M6j7ysWt2462prz9pX6ogbB81WblTvVf4JHM6?=
 =?iso-8859-1?Q?Eg2BwmwjgRGCOiCMqDN6r8nf6ZXOfgAMJOIWaZB2N7geXNfwJZIwG0gFiW?=
 =?iso-8859-1?Q?X60cnkoaDttYdFxn50geJ43D704H+yYQQEa/NcxByzlHe0rNme5sngGsqJ?=
 =?iso-8859-1?Q?9Ha1G4yTDJKafViAAidor2ytnZXmb48Fu54/xXnQDzLHjIrg/mHXzFxZzF?=
 =?iso-8859-1?Q?+V1stmCMP8a65FkGxmJJpao1qlgZdMut7x3crOF4yCXkW/8CE+Q18bEajY?=
 =?iso-8859-1?Q?XGgLa2VUD+a0Im1P3/lCqtviVXzvfU7dhzH0R9xsCkFtjcKr8ouLcqDl8W?=
 =?iso-8859-1?Q?Kpt9wjqojlZO9XGqwUaHNG5FVTImLFOhhzqdgsqPQccG7EaYfLqhP25MJC?=
 =?iso-8859-1?Q?rzHJ80aLrFp8DQlJ2aAQKKA6uWeG0Nzgnl7CURfje41UYfPuFizgQTn/MF?=
 =?iso-8859-1?Q?q4+YFIgaF//2iF9fVbGV3fO339ZXUPcGxt8hl5j00pZQoQuiN9/1WBz5RE?=
 =?iso-8859-1?Q?7DHkFJRGuXHcxP3J1xsN3fwpc1nbtswnypIZAA/Zr0WpsuD8gy0JOT3Cw8?=
 =?iso-8859-1?Q?C/65gsD25HYcUlPBSUNKZdsVqRhRPnUoLuqXd7ep7mBj0f+K86JXoE8mTw?=
 =?iso-8859-1?Q?hIyV8qgIetwDHUSLAlTX7s0sWVW/oYhi7QHJytcdVXiFb7Xor670ecyiI3?=
 =?iso-8859-1?Q?yiMxPCpYnhnXidD+sMeA5ExNTI7LmWFwunxZ/0u9/Sy5/BsDG+64QcWj/J?=
 =?iso-8859-1?Q?BPmbR2layVQ3zLu7bUfrIz3nLeUvT2ZJaTCWHn6R85VstVmmFbjvLTa9Az?=
 =?iso-8859-1?Q?SR+wylylWi7eMLLc9Nl/nCheArkGAI06gd12ozPzNsJzbOPAMnc2NupG/j?=
 =?iso-8859-1?Q?IgtEigwJ8hKNpEaDhEQfuw6A+dyD1K0Kc8rjlP1UEGeU8ERd9tSyeDWow/?=
 =?iso-8859-1?Q?YV1IHUvLFXnh9qUnaMjlXbBFN12c9k0EqDmWI6ydZTFbPklI05u5Lx5dd9?=
 =?iso-8859-1?Q?SO54i7B7FmOMf1WGnj19vDnZBNbKPgovQKONxQy7gIidlmNVRUUiUQFfR8?=
 =?iso-8859-1?Q?X7j/wmU+r/KbKYoI+7o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d44e02-4c45-470e-8882-08ddf5ad2731
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:43:39.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhmI69tGZ9Ch25fZ+uK3pGIG1OVIeTGclJLqOsdgJ1wCaqRgWJ5irX3I6juhOPXNwvcIuHYTH7VTPu/6q1v3ITzMBZNMgLgvc7D/uqybhzD4Nov/PgsgDxjUuEKro53l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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

On Tue, Sep 16, 2025 at 01:53:22PM +0200, Thomas Hellström wrote:
>RDMA NICs typically requires the VRAM dma-bufs to be pinned in
>VRAM for pcie-p2p communication, since they don't fully support
>the move_notify() scheme. We would like to support that.
>
>However allowing unaccounted pinning of VRAM creates a DOS vector
>so up until now we haven't allowed it.
>
>However with cgroups support in TTM, the amount of VRAM allocated
>to a cgroup can be limited, and since also the pinned memory is
>accounted as allocated VRAM we should be safe.
>
>An analogy with system memory can be made if we observe the
>similarity with kernel system memory that is allocated as the
>result of user-space action and that is accounted using __GFP_ACCOUNT.
>
>Ideally, to be more flexible, we would add a "pinned_memory",
>or possibly "kernel_memory" limit to the dmem cgroups controller,
>that would additionally limit the memory that is pinned in this way.
>If we let that limit default to the dmem::max limit we can
>introduce that without needing to care about regressions.
>
>Considering that we already pin VRAM in this way for at least
>page-table memory and LRC memory, and the above path to greater
>flexibility, allow this also for dma-bufs.
>
>Cc: Dave Airlie <airlied@gmail.com>
>Cc: Simona Vetter <simona.vetter@ffwll.ch>
>Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_dma_buf.c | 13 +++++++++
> drivers/gpu/drm/xe/xe_dma_buf.c       | 41 +++++++++++++++++----------
> 2 files changed, 39 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>index a7e548a2bdfb..1f88ca71820c 100644
>--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>@@ -31,6 +31,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
> 			    struct drm_exec *exec)
> {
> 	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
>+	struct dma_buf_attachment *attach;
> 	u32 mem_type;
> 	int ret;
>
>@@ -88,6 +89,18 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>
> 	KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
>
>+	/* Check that we can pin without migrating. */
>+	attach = list_first_entry_or_null(&dmabuf->attachments, typeof(*attach), node);
>+	if (attach) {
>+		int err = dma_buf_pin(attach);
>+
>+		if (!err) {
>+			KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
>+			dma_buf_unpin(attach);
>+		}
>+		KUNIT_EXPECT_EQ(test, err, 0);
>+	}

LGTM...one minor comment though...
I see below comment line in this test file,

/* Pinning in VRAM is not allowed. */

Looks like that is for the case where dynamic import is not supported.
Not sure if it makes sense to word it properly now that pinning is
allowed in VRAM?

Niranjana

>+
> 	if (params->force_different_devices)
> 		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(imported, XE_PL_TT));
> 	else
>diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>index a7d67725c3ee..54e42960daad 100644
>--- a/drivers/gpu/drm/xe/xe_dma_buf.c
>+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>@@ -48,32 +48,43 @@ static void xe_dma_buf_detach(struct dma_buf *dmabuf,
>
> static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
> {
>-	struct drm_gem_object *obj = attach->dmabuf->priv;
>+	struct dma_buf *dmabuf = attach->dmabuf;
>+	struct drm_gem_object *obj = dmabuf->priv;
> 	struct xe_bo *bo = gem_to_xe_bo(obj);
> 	struct xe_device *xe = xe_bo_device(bo);
> 	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
>+	bool allow_vram = true;
> 	int ret;
>
>-	/*
>-	 * For now only support pinning in TT memory, for two reasons:
>-	 * 1) Avoid pinning in a placement not accessible to some importers.
>-	 * 2) Pinning in VRAM requires PIN accounting which is a to-do.
>-	 */
>-	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT)) {
>+	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
>+		allow_vram = false;
>+	} else {
>+		list_for_each_entry(attach, &dmabuf->attachments, node) {
>+			if (!attach->peer2peer) {
>+				allow_vram = false;
>+				break;
>+			}
>+		}
>+	}
>+
>+	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT) &&
>+	    !(xe_bo_is_vram(bo) && allow_vram)) {
> 		drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
> 		return -EINVAL;
> 	}
>
>-	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
>-	if (ret) {
>-		if (ret != -EINTR && ret != -ERESTARTSYS)
>-			drm_dbg(&xe->drm,
>-				"Failed migrating dma-buf to TT memory: %pe\n",
>-				ERR_PTR(ret));
>-		return ret;
>+	if (!allow_vram) {
>+		ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
>+		if (ret) {
>+			if (ret != -EINTR && ret != -ERESTARTSYS)
>+				drm_dbg(&xe->drm,
>+					"Failed migrating dma-buf to TT memory: %pe\n",
>+					ERR_PTR(ret));
>+			return ret;
>+		}
> 	}
>
>-	ret = xe_bo_pin_external(bo, true, exec);
>+	ret = xe_bo_pin_external(bo, !allow_vram, exec);
> 	xe_assert(xe, !ret);
>
> 	return 0;
>-- 
>2.51.0
>
