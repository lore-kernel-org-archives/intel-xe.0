Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCACEE57C7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 16:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3110E09F;
	Wed, 11 Sep 2024 16:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkIlohfn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A4B10E09F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726073216; x=1757609216;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=UFEVZG9dkGRX1LLvHS1fdaeC6YDslNEyaaPTh6RMsH4=;
 b=bkIlohfnN1CzWr3MZB16P2Ns+9S1hQpBgdC4EV8J/bd2BKF9i31+44Wb
 DYXF2Jf3kDiNPEsPmFn6yYkUYBSQsEf8/pi98AZxCXr13qk1yk2D49q9j
 Wkg3ETcucYXoLom98sq/ypXuDj9gBaFZMbnCp/056SGFsVa5utrnRvGLC
 Z+6q4Nltst6HBtq9fW8VFwudW/WeHBexUQH6yFzolz7Y49J7AkvWolWbx
 w7heXHZCJlxCpoVOS3MAMB4yYLrQrZTFExfebVFW87/r7vL6ZyMHEdiAg
 PB03DTKIKSwyfnlYhnnQf6qAB7hNECevs57P+OzG10oRElOe07HC9lUOa Q==;
X-CSE-ConnectionGUID: Qg4Sugo7TlaXee8Q6fTPpg==
X-CSE-MsgGUID: ZRBGWIfpRYC7xY7magjH/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24381717"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24381717"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 09:46:56 -0700
X-CSE-ConnectionGUID: QRPat3zKQpKD28HygOnchQ==
X-CSE-MsgGUID: rGPXu9wKSwC+x5KjTKwEiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67484058"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 09:46:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 09:46:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 09:46:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 09:46:54 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 09:46:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrsxVv7SDydqiK4YMafqH0MsFdXBW6ZVXsj6iwlkdnGc3fvnZvvB0K9NRHhcm/JPt2Xntowf9NwofGd0Lk63auqm5EYlYgPbj2w9n6Rtk9cw9LqgK4hxS60Lynl+dGIuPLtoVDi33dIrr4P2jxGgxjKyKmanmsHNcIG9YsS2p9diO8TPOiCoEqNzWxLMBTLdbp1/xtLryw3a81y/f4I8CdSv58ntrk49AlsX9MOyRakWslwV+hkFUkO6LA9IvAxZXQYOD6hoMbmbvzUHwUgAyg4pHFwZQEa1jmUeucTfE/KT8vQVE4nFy7QMDaBzbGLYZ6y5F0e26NgMp0NaEDUjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud6lRXDBW0ymWeva0jqAoCPHdpXyXBcYa8KwebmiBY4=;
 b=EOshI0m86jO16EiHE9JeesEEqbErw1L2YIQArQJKAOmQaU+Bz2cayb6vPw9b4KqslZ1WSEYwXUr4i8+TwGzj6QLV2/gXR9HoWVomCOVw/pymhDxjo610qaMzhvFnn9XHEaLl1pr1n1v5d4ty5EEZEhWOqPhZaC4UutnUxuw3voZPa7Dql6neyPlx36xp9yRZ07i7Dn7whciCVA+4QFbBN2XT4/AiHOuSRHRkyblk0waCoL9Aico/umJ9iL+RuCw3LqnGGSHAqKICuVq4nU3eqwfdxth7JQg3mhb8mw1tgnVI2IqlsXcIdabJuxsoquuUPeULpLsjm9lWpIxv//Ow+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 16:46:51 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 16:46:51 +0000
Date: Wed, 11 Sep 2024 16:45:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVyZSBm?= =?utf-8?Q?or?= drm/xe:
 Use bookkeep slots for external BO's in exec IOCTL
Message-ID: <ZuHJMtqJzJSBeD9j@DUT025-TGLU.fm.intel.com>
References: <20240911152622.903058-1-matthew.brost@intel.com>
 <172607068761.985671.17600878645191570990@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172607068761.985671.17600878645191570990@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ecc9fa-6e13-438c-c4de-08dcd28155b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZxqrY9U3dT8rRxXj6llZgyC5ciqFtLvP8oI7YOBkcu96IaYi6f765MzQUIeF?=
 =?us-ascii?Q?O3Me9PrONMcI1Yr/+vaVB4JTKhnF9zqi4BnNaR9xov0U2Qu7aE3/7nT2V/Ox?=
 =?us-ascii?Q?H+ZpyrGqqROcknCubkpPYwaIlygR2oWeDV58pzp+JwHWhUvf8D4Gmq7lukDh?=
 =?us-ascii?Q?2AVS26PmK2Ch+qfiCWZXXH54BAnBZhadZY/9hShF6z8ifKppUroJFlEvjHSi?=
 =?us-ascii?Q?7Ux9kTHY4HrsA8cADBiZ2nCqw3UzqioZGFJwzEyshIxh/DWgxVemcUIiPaKm?=
 =?us-ascii?Q?I7KwNWOb6B4qN9ztscxb0DVoDa3AASg/zsUfjpyPu/IZPMVD4cp1/hdhlnlA?=
 =?us-ascii?Q?kqavgs/KirhNqXTxw2FlF4dm/HvPIkp3ZlEd+VzKsdtLkCFP249Zy3nB22da?=
 =?us-ascii?Q?NP2zmwzZm2zb2A4dq1hoiZ3hdjWGr2Tr+N6BTcETjYMSAe6l3urCuVzReqyM?=
 =?us-ascii?Q?TVI8/t/MMiWbU9kEfzMOVGN93DlEg4p9QAF9DQMiZU7aLmth98SyWqzR9sVp?=
 =?us-ascii?Q?4W4jY3+IVV3i2LWCJY/U23fdXSGagvIW95oEs2tyKTtpjo5+IqIa/R/eQp9i?=
 =?us-ascii?Q?HlKKDRGZYrMqnQ9MvLtVVa6eDxQIS1vJrWMYwgnsvo1AZXqBT6zeMLnR7Mta?=
 =?us-ascii?Q?OhLQbog96uWuDhwWHfssRg0lMjCOwva7bsRp3qMC3xcwayFUXtcJr0NNTi88?=
 =?us-ascii?Q?Av8hBQZaL6jVSJ3viAHdwXYbAN/AoQYK0l1PTdAuyptayNcU67EHNFUx8w/7?=
 =?us-ascii?Q?amO1TLjX/+cJWlYWYlo6uYUej5doFFAIZkESxztqWWzmUbgrVngewSHLPeex?=
 =?us-ascii?Q?paE4O8St7sx2ODYh7+b5THyjYbqAtzwZ+Yp2Fkn4V9VWv4nV82pNkYsjqf45?=
 =?us-ascii?Q?ZFWbFf0s894MoTtobWsMMjidx0XXSrZbBh2SSFgGaGKcyJSkQY4rA3UFxyLO?=
 =?us-ascii?Q?njmOiEnnbOoJgED97LGIbfYvEKgNc+OQ73kMSTI6fcn3yLay5Ws2kh8Vr6Yn?=
 =?us-ascii?Q?zVc0aT8iG2ALAtbR2qokGdqKEjJKOQwl15ppqE/5oE6F0dPa5StY7M6fZrv1?=
 =?us-ascii?Q?ks90P3kvsELxNj5n5KW8tbEZLHwj94zYER1cf/giYoH2RFqULH5VmmwrROY1?=
 =?us-ascii?Q?KdK5Osr++ScN4Wq3+WnoAk7d2T1W8GUuaBNJgaj0JxOy6iAeXcgMq5eQl6OK?=
 =?us-ascii?Q?Tb34wOgmgY1M8gNHiyD//RMLgOk5zhAQSA/btQdJoc8MyGvt35y+s25ZVPX/?=
 =?us-ascii?Q?XgNeQ0Y9sqWSiEeikNJ2cqtt4J7iYS0HAOrIgCmfm1d9d3SSPpZqWSsmanOZ?=
 =?us-ascii?Q?uOE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TZIsljZR6Idv7Oq2Rkxu+AoZTBLSZhMKu3Id/Qr/Jh+2PdBUpr7K2hQhyukx?=
 =?us-ascii?Q?99ymrfZg3x7P/DbhJUg3aMZAnLZJX0XyYotptJ8wKGDlGoGTt5TVs/6T3cSK?=
 =?us-ascii?Q?Jvngg6j0QEqjGI4HBx0y8wwyCBS7VUBdcnbfWFYTNe2lZZ2USIiBsofaVAkP?=
 =?us-ascii?Q?ykov7dCZQCtOSw3JSDNdpBR6Qg5o+JR5lszK77chP7nWdWm00/LZbe3TKQ7s?=
 =?us-ascii?Q?Fqic9nSdpl7y5YfyXIb0kjKklk5Z3/rGyjP3seakDY4bin1YNl93eCv2ejl1?=
 =?us-ascii?Q?0GwDVJwT+38zi91VAvw2cURe2DhsJqUZg6z4Kw58QhnE7NmUitDf9J7qux+6?=
 =?us-ascii?Q?Pz0ne8qItGf6XbUSSMKOKseEQgq9SusqyIFuICkEdRPVeomIwOL/Rxj4er8l?=
 =?us-ascii?Q?/JkvzCXf3njHzXX7Fq9UmgUNTeaU8Xhj4s4Cbs24PuQwLzTxv/8jy56NXFdx?=
 =?us-ascii?Q?4Ze7k81M+5Sv0mPHJHfYI19fhbGLGIPCnRvgpHITB07d9YFNw3NKy5A1HbHR?=
 =?us-ascii?Q?iBqtwTFZKSgDj+xDjxx681YRxamm0FLLSvvwNOjy/tIlUGeWFENqJUCrk56L?=
 =?us-ascii?Q?Qzdnzw/4suI1HAhfKrPuCijMeE5uvBpH19CYdqzmSsQdhkPrS2a4X/DED2fF?=
 =?us-ascii?Q?songV1Ci0XMDDdk05Kf8ialpVYqC+5dWcV9U4tyWEZdVnrNWoAR4tzhVYCW1?=
 =?us-ascii?Q?aBLQLef/GXYm9W1HtIhXI6SLf6EyzcxWLJtpP8d0eavUs2pyJYtt4NrmW2oZ?=
 =?us-ascii?Q?hvBUMU2yz7tHWO2FoSEnjRaWjr8YIbJFHAfbOnEk6lTegQCLqb1iSBZh8bUa?=
 =?us-ascii?Q?Z9+pl380tLUCZ1wE+Uzq3yYxUeG6wHxpu8PgDMuBLZ6KdwKgTEEFXjjaI/yK?=
 =?us-ascii?Q?MgZz6Mzs6Om8I4adey+7Zwd8VdtG0TTW4sEm6kCSIP/BNVuo3dTbelt02jxH?=
 =?us-ascii?Q?iEsTRVCqeJv/JtqHFtEqvVtLHJPOI5uJGbbGtI2/+6zz3/DC/mMVvTxLIrYV?=
 =?us-ascii?Q?cSCs+z8EsZuqrwcGa4n9AUbErSpNKqJB/fQe9AkPVYosba2WBncleGVuMdx6?=
 =?us-ascii?Q?vsLvsQLYOZuPo35uMLr4udXvHErNWe/7Q+RJGFFQK7VV8ykIBfqVYpVJpgeY?=
 =?us-ascii?Q?KikkuAO4AHogmfeX1+0iMFxo1Tn7i/WJh+t0m4gC1+kyfLnTsAKaVNCNSlLz?=
 =?us-ascii?Q?q4lzZnIXcgFDficRHtRKD34OtaYqjOyOs03EkcQan8cF/GDTfdiyvFyWaF6M?=
 =?us-ascii?Q?JbJp3Jh2MzDasm40v8oex4nNPLmkJQKc76LWZ4iJpJAywPEkrMTCtQvpYcVd?=
 =?us-ascii?Q?JC1mS1g80jW/EJufPUe509fTfqLmA7/yri5HMuazc2PXbIFh8xZ/TYD+TMRQ?=
 =?us-ascii?Q?qTt9kkLAsHG3jLkDxK/6SbLMsuVAm/mFA29wAmkkbwTwIU0764Gvbeoutml3?=
 =?us-ascii?Q?pyWgjjoNBtgIsvu0cTxsK4PNsxSSID65Nk7byEjRetGVSnCUdeAZIoz2aJXx?=
 =?us-ascii?Q?8yTB4AQtMih4B7ftT9NCc1VaYrLJ2c3HAdONHcNqJJIkLJSMdKOf2TvvnuU7?=
 =?us-ascii?Q?5bAEjNe9/8XhExx4bsUDWrZOdYBubypRwdNMFTqk1KE52wSRZ6rZagt5ASaZ?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ecc9fa-6e13-438c-c4de-08dcd28155b5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 16:46:51.1217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSqOygc9lYy65mANHtfOBj5xmPFUgELse3UFJYrInXMPa+ESJElnQUlJN8JP/4hc0OCV7zZOXJ5sMuL+ODHmIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
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

On Wed, Sep 11, 2024 at 04:04:47PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  drm/xe: Use bookkeep slots for external BO's in exec IOCTL
>    URL:     [1]https://patchwork.freedesktop.org/series/138531/
>    State:   failure
>    Details:
>    [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/index.html
> 
>  CI Bug Log - changes from xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3_BAT
>                              -> xe-pw-138531v1_BAT
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with xe-pw-138531v1_BAT absolutely need
>    to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in xe-pw-138531v1_BAT, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (8 -> 8)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    xe-pw-138531v1_BAT:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_dma_buf_sync@export-dma-buf-once:
>           + bat-bmg-1: [3]PASS -> [4]FAIL +1 other test fail
>           + bat-adlp-7: [5]PASS -> [6]FAIL +1 other test fail
>           + bat-lnl-2: [7]PASS -> [8]FAIL +1 other test fail
>           + bat-dg2-oem2: [9]PASS -> [10]FAIL +1 other test fail
>           + bat-atsm-2: [11]PASS -> [12]FAIL +1 other test fail
>      * igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:
>           + bat-adlp-vf: [13]PASS -> [14]FAIL +1 other test fail
>           + bat-lnl-1: [15]PASS -> [16]FAIL +1 other test fail

All xe_dma_buf_sync failures are expected. That test will need to be
updated with this change. Mesa still should work, so would should be
good.

Matt

>      * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):
>           + bat-atsm-2: NOTRUN -> [17]SKIP
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
>      * igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:
>           + {bat-bmg-2}: [18]PASS -> [19]FAIL +1 other test fail
> 
> New tests
> 
>    New tests have been introduced between
>    xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3_BAT and
>    xe-pw-138531v1_BAT:
> 
>   New IGT tests (1)
> 
>      * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>           + Statuses : 7 pass(s) 1 skip(s)
>           + Exec time: [0.36, 44.43] s
> 
> Known issues
> 
>    Here are the changes found in xe-pw-138531v1_BAT that come from known
>    issues:
> 
>   IGT changes
> 
>     Possible fixes
> 
>      * igt@xe_live_ktest@xe_bo:
>           + bat-adlp-vf: [20]SKIP ([21]Intel XE#2229 / [22]Intel XE#455)
>             -> [23]PASS
>           + bat-adlp-7: [24]SKIP ([25]Intel XE#2229 / [26]Intel XE#455) ->
>             [27]PASS
> 
>     Warnings
> 
>      * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>           + bat-adlp-7: [28]SKIP ([29]Intel XE#2229 / [30]Intel XE#455) ->
>             [31]SKIP ([32]Intel XE#2229)
>           + bat-adlp-vf: [33]SKIP ([34]Intel XE#2229 / [35]Intel XE#455)
>             -> [36]SKIP ([37]Intel XE#2229)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * Linux: xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3 ->
>        xe-pw-138531v1
> 
>    IGT_8012: 8012
>    xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3:
>    f3eded4f8a05d73a0b94f27e05737ea3427450b3
>    xe-pw-138531v1: 138531v1
> 
> References
> 
>    1. https://patchwork.freedesktop.org/series/138531/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-bmg-1/igt@xe_dma_buf_sync@export-dma-buf-once.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-bmg-1/igt@xe_dma_buf_sync@export-dma-buf-once.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once.html
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
>    8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
>    9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once.html
>   11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
>   12. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-atsm-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
>   13. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-adlp-vf/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
>   14. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-adlp-vf/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
>   15. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
>   16. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
>   17. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>   18. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-bmg-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
>   19. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-bmg-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
>   20. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
>   21. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   22. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   23. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
>   24. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
>   25. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   26. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   27. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
>   28. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>   29. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   30. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   31. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>   32. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   33. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>   34. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   35. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   36. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138531v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>   37. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
