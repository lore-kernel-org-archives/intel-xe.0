Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540DCD3A661
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 14:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D98B10E678;
	Tue, 29 Oct 2024 14:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+FyAGQ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D10C10E678
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730212962; x=1761748962;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5WSc3lBvOd1Txufp/WBF9MyqbGDenUOjLb5xzyPXpgM=;
 b=A+FyAGQ3mXfLWPoaogLqzFH8k3nNXfh1QrXTft4oZhu1i5gD0vPBbc7k
 2hsHBThUpUmk5864a0TjyOJQz1yJIcGMz2l9j+Vka2TH94PthsyBELX8E
 1b6K+XZhKfSva9/708RdINsPHiKWhtD5bRS4cn7LP5eNBXjb8Y8GeXsVA
 G3I5CLrNg7P7nf2DKIhduAzOPPGFddBR0OCXOU8AI4pYgO3PjsZYFmUmi
 qssQvDTK1+edpiqRHLor/DsSRqZxZt8Ds1dfG2U5FuLtz/zMS5opX3DGq
 AcGj6ZbTKC5KFjVtYpnDRhE1ogbDrGErMAQEOv4Rhpd6c8aWLVPTum6AM g==;
X-CSE-ConnectionGUID: IsAn3z+oS82BN7t/jDTiOA==
X-CSE-MsgGUID: IdoOjdmkQI+1+rO719tzbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="32710247"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="32710247"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 07:42:42 -0700
X-CSE-ConnectionGUID: j8qjhdemS0WMGURxnBiOjA==
X-CSE-MsgGUID: q1kUlBSkTfaustEISDQYQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="86752383"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 07:42:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 07:42:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 07:42:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 07:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymikjMANlSIF4P6i6AMRrGtBw9Io8Pd0e0ExhzuU4y8cAl0q/leMGYnFpM2UGDX2JvfslY6bM5oxEhCrtUexA4cIe8Bn3IfHOP91K5FerjAXfZ0m9IgTdWz3vftmX/zKHeYUgIumvF/ui4cCkYX6u+ZNwV13PiwiTlXVC4zpX5d6YMQ6lmMByVfZevuyuFh+/mbxGRlZXv6XbchJTw2g/4X2K0RIfm13NPIjdQHcZbje0W3/qlSA7OytTw0nS+iUyx+HJLXdi/qHyRNUlopnP+zrZN8+gpAZN3gkItn+0xNd3IG2fLU0GJCdL12qYISWKcwzx8fnJkzstjfuxPSSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dah76faMap4AMyjVo04JpFW95vk3uXz9EAtScqfu3gM=;
 b=eVeRnTaWbGSoqJuPkAF5sAV1CPBOgE/w0hLjm5JwEkNb0nXQ10zRUj2/GA+uRExftHizpWvqZcDvTnBFMJ5AEASCQ8cHzK9X/ZwlIeTxUzTNtCNQoPOYlSryfdy3K2N2o/51Yua0Wzm9VroBdbGKMoyjEjWQeyBXHhEdJpt8HK771xpMpPlg2AlFQwNQLRkNoigUnIdAk6044gG1m9HyS5B7LpGgQMjIexTfHXIw/G5fI3swwN6yta7v4AEJGaS8VGWsEBUlO2zitFMB77HUID5RCUrB5lPtFSusGtA5zVhKaqfSBCTKOKOK7SC+zY0G5OJ/0hvNJ3rznJrtahurpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7082.namprd11.prod.outlook.com (2603:10b6:930:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 14:42:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 14:42:31 +0000
Date: Tue, 29 Oct 2024 07:42:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matt Atwood <matthew.s.atwood@intel.com>, Clinton Taylor
 <Clinton.A.Taylor@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/i915/xe3lpd: ptl display patches (rev6)
Message-ID: <20241029144228.GX4891@mdroper-desk1.amr.corp.intel.com>
References: <20241028193015.3241858-1-clinton.a.taylor@intel.com>
 <173015496410.1357171.8113927544223783725@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173015496410.1357171.8113927544223783725@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 08dcaef5-87d6-4ddb-2d41-08dcf827eb30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iwa/DC24v+j1Y5dzdo6+EN5nKLEnz7bOHTaFaEw67VFZVnaVEhb1R5liZIrS?=
 =?us-ascii?Q?3i4OWUbgQ1ZZpy8PxrgA5RZTdF1sHDAE7UuF3yxoXCyfykkj7vpYOcLSUUNM?=
 =?us-ascii?Q?yYF2SDNRb8hwggikme7b/mmDXXkW1ysAqqRzTarjlf5483c1I+QqjDpRcs5O?=
 =?us-ascii?Q?Ra9pLjk0LZWuwuszEEkb6riwcUZb+nRdnpZ/5ewpUG0nAXF4YoFnGv8dz+QW?=
 =?us-ascii?Q?MKPxstz4bYDKHy8tBPcw0tl+ipEzSu4GPk1ri3+8Yxgg5TDiSSNV5Nc2HpxY?=
 =?us-ascii?Q?PrmWNUwE0IgdlG/OvchRJncMnBZS+ryJou8RoflfSdSzlc4m4KrLmewQdMT9?=
 =?us-ascii?Q?Yf9tAjrFI1rzCergxxYmikqYfxSIWSqVqik7/8v9eYrg57vAK0P5CHJjUGK+?=
 =?us-ascii?Q?NdFghspCgkVlD3bf94O9mNO9IpLMpQtWgJ2Gxh/CqoPepefRMAApO6yFLF0k?=
 =?us-ascii?Q?v3rUrEXMqNrPlzF8K9Vpb9nLT89bGFTcWVtGiCafv3BVvrYANWnQFZyjEu7j?=
 =?us-ascii?Q?xypYom/cBQHWE695XKsgHZ4MHrcS+cHwUYIhhaw0t88OmlwsBxEqZtqdwqyl?=
 =?us-ascii?Q?m+5dmHMBXA9JyMGeTfCdq2pMjQZEf3oFHO/YjVASdmJWy8gK4AIMCkpoguwk?=
 =?us-ascii?Q?3wPctFr/kzfWvskkHKmInQYNRcPHOllV0S8OWTBhwt8D1pUAED15XXHRlFeq?=
 =?us-ascii?Q?1B5xYAcEko68czR+O3SWLkNYHTtvLXVy4apqLGj/hPj5Hf3Aof1qSuABUv0L?=
 =?us-ascii?Q?6+aS6BnuwzwIUWZ5KfeZUhX4tpgYPG6CU6VTJAyRIxgIsDinLUlpyqRWCl1h?=
 =?us-ascii?Q?NwEEZYOHwRGA8QJ1mTVEnNHR3WWdmlUHadMXqNVTfygUkwDOKEWhPqaDi3te?=
 =?us-ascii?Q?Al+hverKoaG4X3BhT/wyqa4ibrCH3gnR5477bJDRguINtUiu8fGAhf2NgkCr?=
 =?us-ascii?Q?K07hoLotiRRjlgLcbkZfiJkK+/N6nIr4GQFZQbSCM9wSmQYcwyCqLXaxNULO?=
 =?us-ascii?Q?XYkdC24XxCsUnISttJIzmaQ49TO4EQB1Xh6JM80vdpkriEW/pxX7AIEepPnh?=
 =?us-ascii?Q?ODRhFiHtPMkB5Hybb0zsfuqMTDLWrCR8jICZ5NMoNJkJ5UvtbVclTCUrB/OR?=
 =?us-ascii?Q?2T1cNxUQzPE3sXMG1df4pPLUJyRUs3e2mSHK+hBU7YBYy5pb8s3evKxhtSbH?=
 =?us-ascii?Q?YaA4jshSQebMMb5q85HuZX4DgWk6nFp/n0F1dIwRFceHBiCk4f4YkWQEu2H8?=
 =?us-ascii?Q?0Rh7IQoFPtwb17MzfjGBSYb9Iw9fcrlcf26QsOVbXQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p4mAVOILD1BVgSP9ABhVelgPUlGuCPds6OAqE2SJR3Kcro0Qjp75Sx+Nn3Xh?=
 =?us-ascii?Q?1EJPGSyjv/dCV+MDl1kzL0XwTZDZCLsW6RvgT1NHiUTdfSDRVh3Also83fRr?=
 =?us-ascii?Q?jqCm9YOgzyqunWK+cVaoL8IH9PU0Xf5kKqsJfkrkUN6A4TveAJLSXcIJDl4m?=
 =?us-ascii?Q?HC9GVwfnE16uje8YPZ2zznz0YZsP99uNUulcpipeNed+6EY605xVXnwUVVT6?=
 =?us-ascii?Q?BzA4/1cvP5KhnHlgqTXbwDZTSiI0ghhRkGaAooXXqxKm7ypqz+cAS6z1e0Pb?=
 =?us-ascii?Q?esde0ugYigUaCeH0NrqePdyGsFgvKVzE98zJDDe4WqJNuPIhbQ1YWbzKPass?=
 =?us-ascii?Q?ssRNEb2Aqg4c12/aIbWZSqlhaEBGnc84p1AV3yUpVHMgX9FR59sk+kcMURFs?=
 =?us-ascii?Q?T9cucJTKJpjSdCVOiewtMPsC7AMkYdqw9ACs5vXwBIDCTceVD4uMqMoY66rH?=
 =?us-ascii?Q?4Cuq9OcersbESMcoxbjlB6DlILihFflzHG3LgO+O37q/hG5s2A297bBlzz/x?=
 =?us-ascii?Q?hOtYwrh9CtFtX0QZwP/psUKQ9QuWRU8Z1iNTOQG8AJbKKqBCgjwDQUSvP/Cw?=
 =?us-ascii?Q?9cn9G9q189cgle5QnGV1IUPQDOymDzavRPFGG8bNmvXtCSlXqZXOqVslbsia?=
 =?us-ascii?Q?uqRNAhTkGjXfvRbDNxU2PeWiJw7z319HXuusa+tmuPpoNYnX532NKXMQo9ww?=
 =?us-ascii?Q?YLnO5RgJ2wdtIEBLTceRuJjWISbbwBA/av0NtJvddBJU0Yg3gZZAfSMXhGYI?=
 =?us-ascii?Q?pDkAfOunNTeuV08fU8xOgPiS0I+D4mbOk4KhDoOxN2vNTtNG6ZILijvHj+CF?=
 =?us-ascii?Q?3OGztSsGvqgDKShb/UHlYc4MsZ2I14J+7Emn1HJSYHJafOADt6lS2PvWJUEI?=
 =?us-ascii?Q?uJCu2DqouT5fbJU/1R21opVLcUG6RkFTYMdWuuHIw21Y+QkOCzZbc0sDn+xB?=
 =?us-ascii?Q?tHDB5WdcZxNfbb1Ccc+xFvUKSX0hsrqcLDuHrfFBEyXnvm9oie0sVWw5CsZC?=
 =?us-ascii?Q?WW/RycAWsym2Mx84EK1wl07CT0ogDEMvTnlB5jx74tBrOIn31Ti6BKiWRX6L?=
 =?us-ascii?Q?XA+dmaqHuDxOEtmv4EoH/ywRSYv7kyit/ABC2ByDJbP45SaX65r7xHfHMvAd?=
 =?us-ascii?Q?TscCoTmg/jI6tjAhpcXD2y+imt+JZ/GCKuqz+rGUPFJLUiFm53yCUWh6LRXX?=
 =?us-ascii?Q?3HOKfaDnuqs5RZbgz7w+WbuILAGI4+gIss/+g76nMSAlZ3Ri76TKt/naA8SI?=
 =?us-ascii?Q?de/MiT5wpITvQMNgYI12HTKpZfGKcXOUY+yMiDGIEsts3ztqRBXENPU36/0W?=
 =?us-ascii?Q?KFTTLeUzb16vIpVc6/xyJoEfeWlWnBNcpMT9XLwLynivblqxygZZ8v1eRYNO?=
 =?us-ascii?Q?jgdAyVuOoWmJ9vTUvJF8O3grBWfE/nWedKPZgNIetGrW4Z3LXgKCqoHSUGh8?=
 =?us-ascii?Q?52vCshifF2HCKvC3LtIRpSUZKiD2JDM6ldRHhwUQ1KMwXOSL9QTi4R+6gnKR?=
 =?us-ascii?Q?mjX2CCOvCpJulPpPq9xjDrf7epMWvPYVKRRki2hT3JBhfY+Yv9f0BQ5eePxh?=
 =?us-ascii?Q?YdLO3rCB05BO1vxRaKcdLNqoX3uSAilF9A4vWa/GMlREF8qK1SEiY63wf2y9?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08dcaef5-87d6-4ddb-2d41-08dcf827eb30
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:42:31.7709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbRqNs60G850YlWemj+441gNPI2pMXfb/c6l69IiECAeFk2vORgb/HXpu6TapCLH2ab/UAJdTJxq/6kf3RtV+F3ByFL/gzdIWrvOUU9PjD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7082
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

On Mon, Oct 28, 2024 at 10:36:04PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/xe3lpd: ptl display patches (rev6)
> URL   : https://patchwork.freedesktop.org/series/140195/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154_full -> xe-pw-140195v6_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-140195v6_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-140195v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-140195v6_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>     - shard-bmg:          [PASS][1] -> [SKIP][2] +3 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

(kms_big_fb:2156) drmtest-WARNING: No card matches the filter!
[pci:vendor=intel,device=discrete,card=0]

Looking at the boot log for the machine, it seems only the igpu (ADL-S)
is being found and the dgpu is missing.  This is a pre-existing issue
that's been happening for a while; not related to this series.

> 
>   * igt@kms_big_fb@linear-addfb:
>     - shard-adlp:         [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-8/igt@kms_big_fb@linear-addfb.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-2/igt@kms_big_fb@linear-addfb.html

[drm] *ERROR* AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad40023f)

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3086

> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

[drm] *ERROR* CPU pipe A FIFO underrun

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3194

> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][7] +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html

vblank interval differs from modeline! expected 16666.7us, measured 16471us +- 6.547us, difference 195.4us (29.8 sigma)

I don't see any existing issues for this (at least not on this test on
DG2), but this doesn't appear to be something that any of the patches in
this series would cause.

> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-lnl:          [PASS][8] -> [FAIL][9] +4 other tests fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
> 

GT timeout; not related to these display patches.


>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
>     - shard-bmg:          [PASS][10] -> [FAIL][11] +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

Ditto

> 
>   * igt@xe_exec_threads@threads-hang-fd-basic:
>     - shard-dg2-set2:     [PASS][12] -> [ABORT][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-basic.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-basic.html

lockdep splat in drm_scheduler code.  Not related to this series.


Series applied to drm-intel-next.  Thanks for the patches and reviews.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-bmg:          [SKIP][14] ([Intel XE#1124]) -> [SKIP][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][16] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          [SKIP][18] ([Intel XE#2887]) -> [SKIP][19] +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-bmg:          [SKIP][20] ([Intel XE#2244]) -> [SKIP][21]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][22] ([Intel XE#2311]) -> [SKIP][23] +6 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [FAIL][24] ([Intel XE#2333]) -> [SKIP][25] +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>     - shard-bmg:          [SKIP][26] ([Intel XE#2313]) -> [SKIP][27] +8 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-bmg:          [SKIP][28] ([Intel XE#346]) -> [SKIP][29]
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          [SKIP][30] ([Intel XE#2499]) -> [SKIP][31]
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          [SKIP][32] ([Intel XE#1489]) -> [SKIP][33] +4 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-bmg:          [SKIP][34] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][35] +4 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_psr@psr-sprite-plane-move.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_psr@psr-sprite-plane-move.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-140195v6_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
>     - shard-adlp:         [PASS][36] -> [DMESG-WARN][37] ([Intel XE#3194]) +1 other test dmesg-warn
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#1426]) +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-dg2-set2:     [PASS][40] -> [DMESG-WARN][41] ([Intel XE#877])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-180:
>     - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2890]) +5 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-180.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1124]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#2191]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +41 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#1195]) +1 other test incomplete
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#314])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#373]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#2423] / [i915#2575]) +22 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2423]) +38 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#323])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#1541])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([i915#3804])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#301]) +3 other tests fail
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#301])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][62] ([Intel XE#301]) +8 other tests fail
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [PASS][63] -> [INCOMPLETE][64] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [PASS][65] -> [INCOMPLETE][66] ([Intel XE#1195] / [Intel XE#2049])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@b-edp1:
>     - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#886]) +6 other tests fail
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2293]) +3 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
>     - shard-adlp:         [PASS][71] -> [FAIL][72] ([Intel XE#1874]) +2 other tests fail
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#651]) +11 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#653]) +11 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#1503])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2763]) +5 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>     - shard-adlp:         [PASS][78] -> [DMESG-WARN][79] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-warn
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2763]) +7 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#870])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_prop_blob@invalid-set-prop-any:
>     - shard-adlp:         [PASS][83] -> [TIMEOUT][84] ([Intel XE#1033] / [Intel XE#1727])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_prop_blob@invalid-set-prop-any.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-4/igt@kms_prop_blob@invalid-set-prop-any.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1489]) +2 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1122])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-no-drrs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html
> 
>   * igt@kms_psr@pr-sprite-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2890]) +21 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html
> 
>   * igt@kms_psr@psr-sprite-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_psr@psr-sprite-blt.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#327]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_vblank@accuracy-idle:
>     - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#1523]) +1 other test fail
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@kms_vblank@accuracy-idle.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-2/igt@kms_vblank@accuracy-idle.html
> 
>   * igt@testdisplay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2423])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@testdisplay.html
> 
>   * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
>     - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#2667])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
> 
>   * igt@xe_eudebug@sysfs-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2905]) +3 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@xe_eudebug@sysfs-toggle.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][97] -> [TIMEOUT][98] ([Intel XE#1473] / [Intel XE#402])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1130]) +31 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-lnl:          [PASS][100] -> [FAIL][101] ([Intel XE#3160]) +1 other test fail
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#288]) +9 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_reset@parallel-close-fd:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][103] ([Intel XE#1081])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@xe_exec_reset@parallel-close-fd.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#2229])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2229])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2229])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#378])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@xe_module_load@force-load.html
> 
>   * igt@xe_oa@privileged-forked-access-vaddr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2541]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@xe_oa@privileged-forked-access-vaddr.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1061])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3hot-basic-exec:
>     - shard-lnl:          [PASS][110] -> [DMESG-WARN][111] ([Intel XE#3184])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-3/igt@xe_pm@d3hot-basic-exec.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-1/igt@xe_pm@d3hot-basic-exec.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-dg2-set2:     [PASS][112] -> [ABORT][113] ([Intel XE#1694])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-dg2-set2:     [PASS][114] -> [ABORT][115] ([Intel XE#1794])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [PASS][116] -> [ABORT][117] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][118] -> [ABORT][119] ([Intel XE#1794])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@idle-residency-on-exec:
>     - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#2564])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-3/igt@xe_pm_residency@idle-residency-on-exec.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html
> 
>   * igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_render:
>     - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#3220])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-3/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_render.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_render.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [PASS][124] -> [FAIL][125] ([Intel XE#958])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#944])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
>     - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#1130]) +80 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unplug-rescan:
>     - shard-bmg:          [SKIP][129] ([Intel XE#1885]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-adlp:         [DMESG-FAIL][131] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3194]) -> [PASS][132] +1 other test pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
>     - shard-adlp:         [DMESG-FAIL][133] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][135] ([Intel XE#3194]) -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [FAIL][137] ([Intel XE#1426]) -> [PASS][138] +1 other test pass
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-bmg:          [SKIP][139] -> [PASS][140] +6 other tests pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-bmg:          [SKIP][141] ([Intel XE#2890]) -> [PASS][142] +7 other tests pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-dg2-set2:     [ABORT][143] ([Intel XE#2388]) -> [PASS][144]
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [ABORT][145] -> [PASS][146]
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          [DMESG-WARN][147] ([Intel XE#877]) -> [PASS][148]
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][149] ([Intel XE#301]) -> [PASS][150] +3 other tests pass
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][151] -> [PASS][152] +8 other tests pass
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
>     - shard-adlp:         [FAIL][153] ([Intel XE#2882]) -> [PASS][154] +1 other test pass
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
>     - shard-lnl:          [FAIL][155] ([Intel XE#886]) -> [PASS][156] +4 other tests pass
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>     - shard-dg2-set2:     [FAIL][157] ([Intel XE#301]) -> [PASS][158] +8 other tests pass
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][159] ([Intel XE#3267]) -> [PASS][160]
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-panning-vs-hang:
>     - shard-bmg:          [SKIP][161] ([Intel XE#2423]) -> [PASS][162] +60 other tests pass
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip@flip-vs-panning-vs-hang.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_flip@flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [ABORT][163] ([Intel XE#2625]) -> [PASS][164] +1 other test pass
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>     - shard-adlp:         [DMESG-WARN][165] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][166] +1 other test pass
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [FAIL][167] ([Intel XE#1430]) -> [PASS][168]
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
>     - shard-lnl:          [DMESG-WARN][169] ([Intel XE#3184]) -> [PASS][170] +1 other test pass
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-bmg:          [SKIP][171] ([Intel XE#2446]) -> [PASS][172] +1 other test pass
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
>     - shard-lnl:          [FAIL][173] ([Intel XE#2948]) -> [PASS][174] +1 other test pass
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-lnl:          [FAIL][175] ([Intel XE#899]) -> [PASS][176] +1 other test pass
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][177] ([Intel XE#2142]) -> [PASS][178] +1 other test pass
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][179] ([Intel XE#1473]) -> [PASS][180]
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [FAIL][181] ([Intel XE#1000]) -> [PASS][182]
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_balancer@many-cm-parallel-basic:
>     - shard-bmg:          [DMESG-WARN][183] -> [PASS][184] +9 other tests pass
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-6/igt@xe_exec_balancer@many-cm-parallel-basic.html
>     - shard-adlp:         [DMESG-WARN][185] -> [PASS][186] +4 other tests pass
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@xe_exec_balancer@many-cm-parallel-basic.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-2/igt@xe_exec_balancer@many-cm-parallel-basic.html
> 
>   * igt@xe_exec_basic@many-null:
>     - shard-adlp:         [TIMEOUT][187] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][188]
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_basic@many-null.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-8/igt@xe_exec_basic@many-null.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
>     - shard-lnl:          [FAIL][189] -> [PASS][190] +3 other tests pass
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - shard-lnl:          [DMESG-WARN][191] ([Intel XE#3230]) -> [PASS][192]
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-4/igt@xe_exec_fault_mode@twice-invalid-fault.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-userptr:
>     - shard-dg2-set2:     [DMESG-WARN][193] -> [PASS][194] +5 other tests pass
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-userptr.html
> 
>   * igt@xe_exec_threads@threads-hang-rebind:
>     - shard-adlp:         [DMESG-WARN][195] ([Intel XE#358]) -> [PASS][196] +7 other tests pass
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-3/igt@xe_exec_threads@threads-hang-rebind.html
> 
>   * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
>     - shard-dg2-set2:     [DMESG-WARN][197] ([Intel XE#358]) -> [PASS][198] +6 other tests pass
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-464/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
>     - shard-lnl:          [DMESG-WARN][199] -> [PASS][200] +12 other tests pass
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
> 
>   * igt@xe_exec_threads@threads-mixed-fd-basic:
>     - shard-adlp:         [DMESG-WARN][201] ([Intel XE#3230]) -> [PASS][202] +1 other test pass
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@xe_exec_threads@threads-mixed-fd-basic.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-9/igt@xe_exec_threads@threads-mixed-fd-basic.html
>     - shard-bmg:          [DMESG-WARN][203] ([Intel XE#3230]) -> [PASS][204]
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
>     - shard-dg2-set2:     [DMESG-WARN][205] ([Intel XE#3230]) -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-464/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-adlp:         [SKIP][207] ([Intel XE#1192]) -> [PASS][208] +1 other test pass
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-3/igt@xe_live_ktest@xe_dma_buf.html
>     - shard-bmg:          [SKIP][209] ([Intel XE#1192]) -> [PASS][210]
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1192]) -> [PASS][212] +1 other test pass
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html
>     - shard-lnl:          [SKIP][213] ([Intel XE#1192]) -> [PASS][214] +1 other test pass
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-bmg:          [SKIP][215] ([Intel XE#2229]) -> [PASS][216] +1 other test pass
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-dg2-set2:     [ABORT][217] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][218]
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-432/igt@xe_pm@s2idle-basic.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-463/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-adlp:         [DMESG-WARN][219] ([Intel XE#569]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-8/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_spin_batch@spin-all:
>     - shard-bmg:          [SKIP][221] ([Intel XE#1130]) -> [PASS][222] +124 other tests pass
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_spin_batch@spin-all.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@xe_spin_batch@spin-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-bmg:          [SKIP][223] ([Intel XE#2423]) -> [SKIP][224] ([Intel XE#873])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-bmg:          [SKIP][225] ([Intel XE#2423]) -> [SKIP][226] ([Intel XE#2370])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-bmg:          [SKIP][227] ([Intel XE#2890]) -> [SKIP][228] ([Intel XE#2327])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-bmg:          [SKIP][229] -> [SKIP][230] ([Intel XE#2327])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-lnl:          [DMESG-FAIL][231] ([Intel XE#1725]) -> [DMESG-WARN][232] ([Intel XE#1725])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-bmg:          [SKIP][233] ([Intel XE#2890]) -> [SKIP][234] ([Intel XE#1124]) +5 other tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-bmg:          [SKIP][235] -> [SKIP][236] ([Intel XE#610])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][237] ([Intel XE#3194]) -> [FAIL][238] ([Intel XE#1231] / [Intel XE#1242])
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-bmg:          [SKIP][239] ([Intel XE#1124]) -> [SKIP][240] ([Intel XE#2890]) +4 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          [SKIP][241] ([Intel XE#2890]) -> [SKIP][242] ([Intel XE#607])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [SKIP][243] ([Intel XE#367]) -> [SKIP][244] ([Intel XE#2423])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          [SKIP][245] ([Intel XE#2423]) -> [SKIP][246] ([Intel XE#367]) +2 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
>     - shard-bmg:          [SKIP][247] ([Intel XE#2887]) -> [SKIP][248] ([Intel XE#2890]) +3 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          [SKIP][249] ([Intel XE#2890]) -> [SKIP][250] ([Intel XE#2887]) +4 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][251] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][252] ([Intel XE#2890])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>     - shard-bmg:          [SKIP][253] -> [SKIP][254] ([Intel XE#2887]) +3 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-bmg:          [SKIP][255] ([Intel XE#2724]) -> [SKIP][256] ([Intel XE#2890])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_cdclk@mode-transition.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-bmg:          [SKIP][257] ([Intel XE#2423]) -> [SKIP][258] ([Intel XE#2325]) +1 other test skip
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          [SKIP][259] ([Intel XE#2325]) -> [SKIP][260] ([Intel XE#2423]) +1 other test skip
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_chamelium_color@degamma.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-bmg:          [SKIP][261] ([Intel XE#2252]) -> [SKIP][262] ([Intel XE#2423]) +2 other tests skip
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-fast.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-bmg:          [SKIP][263] ([Intel XE#2423]) -> [SKIP][264] ([Intel XE#2252]) +7 other tests skip
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-bmg:          [FAIL][265] ([Intel XE#1178]) -> [SKIP][266] ([Intel XE#2423])
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-bmg:          [SKIP][267] ([Intel XE#2423]) -> [SKIP][268] ([Intel XE#2341])
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_content_protection@content-type-change.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          [SKIP][269] ([Intel XE#2321]) -> [SKIP][270] ([Intel XE#2423])
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-bmg:          [SKIP][271] ([Intel XE#2423]) -> [SKIP][272] ([Intel XE#2320]) +2 other tests skip
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-bmg:          [SKIP][273] ([Intel XE#2423]) -> [SKIP][274] ([Intel XE#2321]) +1 other test skip
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-bmg:          [SKIP][275] ([Intel XE#2320]) -> [SKIP][276] ([Intel XE#2423]) +2 other tests skip
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x85.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-adlp:         [SKIP][277] ([Intel XE#309]) -> [TIMEOUT][278] ([Intel XE#1033] / [Intel XE#1727])
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>     - shard-bmg:          [DMESG-WARN][279] ([Intel XE#877]) -> [SKIP][280] ([Intel XE#2423])
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-bmg:          [SKIP][281] ([Intel XE#2423]) -> [SKIP][282] ([Intel XE#2323])
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-bmg:          [SKIP][283] ([Intel XE#2890]) -> [SKIP][284] ([Intel XE#2244])
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-bmg:          [SKIP][285] ([Intel XE#2372]) -> [SKIP][286] ([Intel XE#2423])
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_feature_discovery@chamelium.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          [SKIP][287] ([Intel XE#1138]) -> [SKIP][288] ([Intel XE#2423])
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_feature_discovery@display-4x.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [SKIP][289] ([Intel XE#2423]) -> [FAIL][290] ([Intel XE#301])
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@bo-too-big-interruptible@a-edp1:
>     - shard-lnl:          [INCOMPLETE][291] ([Intel XE#1504]) -> [TIMEOUT][292] ([Intel XE#1504]) +1 other test timeout
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-lnl-1/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-bmg:          [SKIP][293] -> [SKIP][294] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>     - shard-bmg:          [SKIP][295] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][296] ([Intel XE#2890]) +1 other test skip
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-bmg:          [SKIP][297] ([Intel XE#2890]) -> [SKIP][298] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
>     - shard-bmg:          [SKIP][299] ([Intel XE#2890]) -> [SKIP][300] ([Intel XE#2311]) +16 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         [TIMEOUT][301] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][302] ([Intel XE#1861])
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][303] ([Intel XE#2890]) -> [FAIL][304] ([Intel XE#2333]) +7 other tests fail
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][305] -> [FAIL][306] ([Intel XE#2333]) +2 other tests fail
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [FAIL][307] ([Intel XE#2333]) -> [SKIP][308] ([Intel XE#2890]) +4 other tests skip
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-adlp:         [FAIL][309] ([Intel XE#1861]) -> [TIMEOUT][310] ([Intel XE#1033] / [Intel XE#1727])
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-bmg:          [SKIP][311] -> [SKIP][312] ([Intel XE#2352])
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][313] -> [SKIP][314] ([Intel XE#2311]) +3 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][315] ([Intel XE#2311]) -> [SKIP][316] ([Intel XE#2890]) +7 other tests skip
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         [TIMEOUT][317] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][318] ([Intel XE#656])
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][319] ([Intel XE#2313]) -> [SKIP][320] ([Intel XE#2890]) +6 other tests skip
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][321] ([Intel XE#2890]) -> [SKIP][322] ([Intel XE#2313]) +8 other tests skip
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][323] -> [SKIP][324] ([Intel XE#2313]) +11 other tests skip
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
>     - shard-adlp:         [SKIP][325] ([Intel XE#653]) -> [TIMEOUT][326] ([Intel XE#1033] / [Intel XE#1727])
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          [SKIP][327] -> [SKIP][328] ([Intel XE#2934])
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-bmg:          [SKIP][329] -> [SKIP][330] ([Intel XE#2927])
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-bmg:          [SKIP][331] ([Intel XE#2423]) -> [SKIP][332] ([Intel XE#2486])
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>     - shard-bmg:          [SKIP][333] ([Intel XE#2423]) -> [SKIP][334] ([Intel XE#2763]) +1 other test skip
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-bmg:          [SKIP][335] ([Intel XE#2763]) -> [SKIP][336] ([Intel XE#2423])
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-bmg:          [SKIP][337] -> [SKIP][338] ([Intel XE#2505])
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-bmg:          [SKIP][339] ([Intel XE#1439]) -> [SKIP][340] ([Intel XE#2446])
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-bmg:          [SKIP][341] ([Intel XE#2446]) -> [SKIP][342] ([Intel XE#1439] / [Intel XE#3141])
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          [SKIP][343] -> [SKIP][344] ([Intel XE#1489]) +5 other tests skip
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-bmg:          [SKIP][345] ([Intel XE#2890]) -> [SKIP][346] ([Intel XE#2387])
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs:
>     - shard-bmg:          [SKIP][347] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][348] ([Intel XE#2890]) +1 other test skip
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_psr@fbc-psr2-no-drrs.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_psr@fbc-psr2-no-drrs.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-bmg:          [SKIP][349] ([Intel XE#2890]) -> [SKIP][350] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          [SKIP][351] ([Intel XE#2414]) -> [SKIP][352] ([Intel XE#2890])
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-bmg:          [SKIP][353] ([Intel XE#2423]) -> [SKIP][354] ([Intel XE#2330]) +1 other test skip
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-bmg:          [SKIP][355] ([Intel XE#2329]) -> [SKIP][356] ([Intel XE#2423])
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-bmg:          [SKIP][357] ([Intel XE#2423]) -> [SKIP][358] ([Intel XE#2413])
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][359] ([Intel XE#2423]) -> [FAIL][360] ([Intel XE#1729])
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][361] ([Intel XE#362]) -> [SKIP][362] ([Intel XE#1500])
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-bmg:          [SKIP][363] ([Intel XE#2450]) -> [SKIP][364] ([Intel XE#2423])
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-bmg:          [SKIP][365] ([Intel XE#1499]) -> [SKIP][366] ([Intel XE#2423])
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_vrr@flip-basic.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-bmg:          [SKIP][367] ([Intel XE#2423]) -> [SKIP][368] ([Intel XE#1499]) +1 other test skip
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-bmg:          [SKIP][369] ([Intel XE#756]) -> [SKIP][370] ([Intel XE#2423])
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@kms_writeback@writeback-invalid-parameters.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence:
>     - shard-bmg:          [SKIP][371] ([Intel XE#1130]) -> [SKIP][372] ([Intel XE#2905]) +8 other tests skip
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-bmg:          [SKIP][373] ([Intel XE#2905]) -> [SKIP][374] ([Intel XE#1130]) +4 other tests skip
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@xe_eudebug@discovery-empty.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-bmg:          [SKIP][375] ([Intel XE#1130]) -> [FAIL][376] ([Intel XE#2364])
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-bmg:          [SKIP][377] ([Intel XE#1130]) -> [TIMEOUT][378] ([Intel XE#1473]) +1 other test timeout
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html
>     - shard-dg2-set2:     [FAIL][379] ([Intel XE#1000]) -> [TIMEOUT][380] ([Intel XE#1473])
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [TIMEOUT][381] ([Intel XE#1473] / [Intel XE#2472]) -> [SKIP][382] ([Intel XE#1130])
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          [SKIP][383] ([Intel XE#2322]) -> [SKIP][384] ([Intel XE#1130]) +3 other tests skip
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>     - shard-bmg:          [SKIP][385] ([Intel XE#1130]) -> [SKIP][386] ([Intel XE#2322]) +5 other tests skip
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>     - shard-adlp:         [SKIP][387] ([Intel XE#1392]) -> [TIMEOUT][388] ([Intel XE#1033] / [Intel XE#1727])
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-rebind:
>     - shard-bmg:          [DMESG-WARN][389] -> [SKIP][390] ([Intel XE#1130])
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-8/igt@xe_exec_threads@threads-hang-fd-rebind.html
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@xe_exec_threads@threads-hang-fd-rebind.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          [SKIP][391] ([Intel XE#1192]) -> [SKIP][392] ([Intel XE#2833])
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html
>     - shard-adlp:         [SKIP][393] -> [SKIP][394] ([Intel XE#455])
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-adlp-3/igt@xe_live_ktest@xe_eudebug.html
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-adlp-4/igt@xe_live_ktest@xe_eudebug.html
>     - shard-dg2-set2:     [SKIP][395] -> [SKIP][396] ([Intel XE#455])
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-dg2-433/igt@xe_live_ktest@xe_eudebug.html
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-dg2-432/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_pat@pat-index-xelp:
>     - shard-bmg:          [SKIP][397] ([Intel XE#2237] / [Intel XE#2245]) -> [SKIP][398] ([Intel XE#1130])
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-bmg:          [SKIP][399] ([Intel XE#2284]) -> [SKIP][400] ([Intel XE#1130])
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@xe_pm@d3cold-mocs.html
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-bmg:          [SKIP][401] ([Intel XE#1130]) -> [SKIP][402] ([Intel XE#2284]) +1 other test skip
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-bmg:          [SKIP][403] ([Intel XE#944]) -> [SKIP][404] ([Intel XE#1130]) +1 other test skip
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-bmg:          [SKIP][405] ([Intel XE#1130]) -> [SKIP][406] ([Intel XE#944]) +1 other test skip
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html
> 
>   
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2388
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
>   [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2564
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
>   [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
>   [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
>   [Intel XE#3220]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3220
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
>   [Intel XE#3267]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3267
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154 -> xe-pw-140195v6
> 
>   IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2134-24707cf2a7c47d4cd192c97e73d58aa4011de154: 24707cf2a7c47d4cd192c97e73d58aa4011de154
>   xe-pw-140195v6: 140195v6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140195v6/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
