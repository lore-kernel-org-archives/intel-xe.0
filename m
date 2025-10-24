Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5A6CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 22:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7029C10EB41;
	Fri, 24 Oct 2025 22:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGnIaAUc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583F189317
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 22:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761343311; x=1792879311;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=eGa+O/sqj/w3MT9q4mWFIEeQFPveEwRK5B+Wzs1RzyI=;
 b=ZGnIaAUcJD+cAijyAQDCZPtQ1AN6kbGV1YOMnE7RJbjCF2FNHj/miKzr
 c9kO2QKZXaLoHK/0nbe8ptQItBcyO56Lxoe0K3kzKoe2LTIN9Dqyx5+WS
 rJcB6/VACHNAjKaHlZIxas6VmVOxGPHpo47IoQIhw8UQARXm2huk8vQ/j
 Vu0jxd9szKEq+P07uOFA1VPQI3lc+0702OM5Yafij9el3a1nMBcYJzCZ3
 xGHjRQy1aA0zsuKbSIjK5LN/QfhMsY5m2ifJrz6si05/m8rb8LQ4vATVn
 HPMLWlKbQWur2fw5dQ5WLTeguxIVCSAsKBn+vcyCn3007oZ9Rj8qkdkAM Q==;
X-CSE-ConnectionGUID: SOXYGGL5QxSYDtxhTWgUOQ==
X-CSE-MsgGUID: 62qhPsv4RjWFozP39F5sHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66143089"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="66143089"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 15:01:51 -0700
X-CSE-ConnectionGUID: vtvhKOPkThqWVsyuEi7spg==
X-CSE-MsgGUID: gmTD5LjLQoSrCu6KyPPxaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="189658384"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 15:01:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 15:01:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 15:01:50 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 15:01:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bM2ffXODvKYRAt2lBkDbdR8VJrUrTy6SDEZCba3cm3/h2MH8n2S3iETcWWpHLx+FEWVmjt7catVfCUI2s3z/HpBugspxtPMnRfeGnbfwN6nXkrGOAoJuE5xIY8YBdTheU5Xl9JGBXpUKx7AkJrQ6pgR7y84rxVbEMe4XMFzJaJPhALw/UOxTHcJz30bvNhyhkGLy2IffenUM6qMLNOPbMqGANzLjR3uN/sipPJy4HB0Wui2wOrUPU1WlIUwv6zv0bDlQumLq9lZW/Ojb28kOZGkXDsmKashSj+bxfO4cnbi9O+VWc9qd5HNHrbb0u+tNIzxYcqOcRaAQXrSocp+Olw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqrheVHoMvmrjTPLvF7Q3vHYwLOlYNv9g/whpMQfXM0=;
 b=UlFizldJ88nQB8g53gi0NaEMIlUMNSDDfvnDDZwbeyFlxAOWxfmVlxpZYjOXQAUlJxcm0rG7SZPJN0CXInKnqvSnNlvXLqIfNbUDsb3TLUEfQ6wFoDDTFbkG2LpaAs3lT67ffysIzG4SD1MODhE3Lmh93KF4YWezh1hx84uK4pV0l14a4I3c0IYC6XOOK79NQKT2eoUJq4znENuoxCi0CoylZNtCMKkwPWQHEIwO4XvqThNqdUghav0xOEBHoK707O+t2TBddtNOgP/9r73FUQGHGiCRtv4MSTbDbok3f9h3JuHYzcj5tFf9N6Cv9AADxO9TDgl8YTJXHAv6zDclkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:95::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 22:01:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 22:01:48 +0000
Date: Fri, 24 Oct 2025 15:01:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s?= for
 drm/xe/configfs: Drop MAX_GT_TYPE_CHARS constant
Message-ID: <20251024220146.GC5409@mdroper-desk1.amr.corp.intel.com>
References: <20251024200834.1512329-2-matthew.d.roper@intel.com>
 <176134033929.54054.9087836478159356441@97596180aaec>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176134033929.54054.9087836478159356441@97596180aaec>
X-ClientProxiedBy: SJ0PR03CA0201.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4769:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a11ed1c-f0f3-46f9-c5b0-08de1348edc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HVuxS7OLZRk83TacrsvQs72F1CxNkp/W6tfdjeUy3t+uGp+y0Vpaw4MYeRGd?=
 =?us-ascii?Q?axyBPVeud9iIjRVf8AscW9AmKEyFIcWrJS/Ov7sZ1dhJSw3ZolhKYV2hdRaU?=
 =?us-ascii?Q?OyXNlcn9iSBYENPifuEqgkTJYCnpN8MNNwI+1KxtKovBhXkzVTlPJ1Ep4XzO?=
 =?us-ascii?Q?M6+v0N2MRBMAEmklPMVJGN8MhFE0NhlkPYU4SaHCIwT9+UAgWLshkCyxHuN4?=
 =?us-ascii?Q?UqiPRDgQ+TqnOVFNAUi35VkVuJdSq3mhqJlFIePjyli82PTswiU6Bsx3hNSK?=
 =?us-ascii?Q?zisQ6PVZFnWebME7fbqByFHyjckw1ZEt8GM89Q4dB+KVy4PjbAxcrh78jVZX?=
 =?us-ascii?Q?PwWDfebVyXx/mCspnAFjTpXMo+ykGK411VkivVQtgfPxMdcvl2i1ihvNDtUq?=
 =?us-ascii?Q?NNuQWacpjZ1HQBA3XbGyChHBksfZ6fakHPBBeMMFYtVWA8c3RuSdAvegG9aZ?=
 =?us-ascii?Q?eL+W2BbKUk2rONf6QkEtyA3tKynZ3cenEFMmKPb+xWK2dlNWuDgD4E2+B8vl?=
 =?us-ascii?Q?HdDgYIy9WpvmIP4VJDzWgZgggmVICDN4CYPDmaT5Dpgzyy97q70SvIL89twr?=
 =?us-ascii?Q?0nBAurFj6vWUXjc8t+Fly+uRvM0jDDyuRe00ouRs2sl4yKYbljZH/pggf4gu?=
 =?us-ascii?Q?eoH5SWJN7fahr/Rd6ujch9GvXZa/IyYgyPcc/M9QPyYxHCsKfYA7qwgkIomj?=
 =?us-ascii?Q?y8psGoIVRDEDo7MocE1ZO2gqybUY/efOFw1adUewSqzPK9eCaTTWvpX0A1OH?=
 =?us-ascii?Q?2D3feNOYIUA/8RWGS2qskj6vcghNTzfIhCs763yVJ8nxG3bJO798v113QVqw?=
 =?us-ascii?Q?0oJ88O5BhtltZmxwofsDVOrwzgBYHDsHLgaSvXjERJaciLBEFgNj5mMKdxVm?=
 =?us-ascii?Q?ZylPx+Mz5fJSIYZvSDexFkGaRKWeJ9nlY3rZs/GDcA9h4vsZtof6abWxYU6+?=
 =?us-ascii?Q?nhaXQv10+4rSWpKjzBY+Cx1YANfFyF9F94Sh+J1jXJ8MPodPg4TCFqdZMw7H?=
 =?us-ascii?Q?hRsjQZQnUbuIbGRZI/J00Ir4VOVLletpWsPOwbF8sx5f2mEDnjP42kDK5fMf?=
 =?us-ascii?Q?WbNIvINRP1wpgfn4sjRfP4UkMH2hfbJ+QIBIVsc43c293iqCwEW6ZomyJURa?=
 =?us-ascii?Q?KESJQdPPtl76Vk45OMXC+squlAXPJg3VS82WJiZDqCFY9h7j7zyZ6cd+B3dn?=
 =?us-ascii?Q?m44LbPjARhvkR5rDdsAgic5VF8NytT7BVVN0s4fh8e266UHjxe76Y0o3AdG3?=
 =?us-ascii?Q?2BaHmpDs5LjDsAfvaxhJCgl7tX8zn6NOcR8wq+DJmsJRhQSGpTWUCoK7hSWE?=
 =?us-ascii?Q?NFe90H+9XcmX4/wS+rFx3r9L445f0G3R3tJqs/OHegzjC8exPwLvTkDlbSxr?=
 =?us-ascii?Q?qux3po0cRE8ed7vGjX7da+XsbKeFYo+GTD9esoLP6gkNvlUqIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?geE/prphjRkstLpibQpWfN5XA8m7NEW6vHurllQF5+eEx+qv3PBLY0nXVPwx?=
 =?us-ascii?Q?LOuAlQ1al9phOOAvtC3l4MymHJwtRSl3Bt3X7dakQoU9fHs1zAgU2T3TQxlw?=
 =?us-ascii?Q?BwZa7XYkLfpONIhv4Nb/lN8QNH5stVViN1ipbvlnDYMMkphg5tWeeA6y8LJ1?=
 =?us-ascii?Q?CzLjAioovLT7JtJpGstdlPC1s29JfzjptGI5N7UF/fGjvCH3yhvwF30EUtPH?=
 =?us-ascii?Q?iELxt/RYDI4Pt+5BR3RKYK9MprWYSX+4uMaXbbICeLqngpQVdsURZ7spCLRs?=
 =?us-ascii?Q?Ri8o7CRpRwITqBw9J+VYEPYYUC0ativz6eN6UVv/L08IWWoIKttrHiEbvr/J?=
 =?us-ascii?Q?8tkgcVmNyPPlT/36WYEbkjUJqfibneLAH2KF145oI8IwuRH7RLj6pVB9CNmA?=
 =?us-ascii?Q?lMUeMr8K8F7XpYYh3vuJjbTnjH5GV5G02wdQqoi9/VXu4SMS2YeAz/cdnafl?=
 =?us-ascii?Q?55xy5V/OQyJug6IF+xrptIjaFvg4ZW7ctB/zW8JXXy17i1CZVrmHIblotyvJ?=
 =?us-ascii?Q?BcYjq6CYbePkes9QZZ/803XL+r0OXfIUHbA/RHZZ4o0dchaCeyEn0H3RrA3o?=
 =?us-ascii?Q?Zk1Wyx1LDgPflKdY4t/gDTM/ReE0BYZLlpvXL3l8nm7Llx9k+Y0tYUGNHOTu?=
 =?us-ascii?Q?JNPUwcABoVE8QWTWkMGtMtINSfGjjgbXSrB0rbI6OQNnkQBf/GuHqzG+eI08?=
 =?us-ascii?Q?k1E9ynyUVPKvoLxPvwGTkevqyRKmmmMu+JTzdxxu1q4loPnVlNFur1IiADSb?=
 =?us-ascii?Q?5e3X3hpC1t6++0010TtaI6/OUMwWB80din12Snt32lCuFBuw4nYcGHowvX02?=
 =?us-ascii?Q?HjQ8fcgJtgSoRUEIKdkM3u/JWjkC4A1WWQUMZGjxjffsZ+wvE7UyRJd1oqkt?=
 =?us-ascii?Q?nFsbR1+i4Q9PC7eEKMY+6TFUDJ28vPpxpbyeRjq7awqXKUKtlXuDlYNuwe+e?=
 =?us-ascii?Q?b/JbJdnS/i0/Jr3suckjUwhdzhsBtTVBCz8YBPRkJr35p79AMyz8bD5LVxaY?=
 =?us-ascii?Q?+xb1L9WM3yyhTF2A2YNAqZjuaIduvZ5fklx3sXJ7D+Ctx0UyCqfHwme+42by?=
 =?us-ascii?Q?oLHoLql/EZKQ3RVOV6fqYjnwHFkRYZvkCDSqymDmNT5/NopaMl9T8jbxs5al?=
 =?us-ascii?Q?X30imwKwoFSdvHihN3zfD5h/n7r5QFy90+o70S3XIyaucLBUGF72I384n5fN?=
 =?us-ascii?Q?KgVtf0+i4HUon37LMcE1bun/FNJ8FnBEqKz9twzT/3A+TnHMkojrWE0Ddtrt?=
 =?us-ascii?Q?4ZrKKRYB0Io9/+E1NBML/mP8RtpVJYO5dTKeUZwJHYd+OI7W2RHDaKzv4otS?=
 =?us-ascii?Q?fCmp13bTbdxfMktbfbpw+v2kjpUGFW9stn5rBtuK5Et4NK6w6u42Md9mtm1a?=
 =?us-ascii?Q?I74kQ9pJJdorqruAeswNbFoNYusmDP+Aj+I7btToh7cfxK48Uu1sEgsugW5y?=
 =?us-ascii?Q?/xAWeFPJtyrxh/UIA/VB+EeikZ6JRTUd+YY5XhQAw3s9evyyJgC5a5wJef+n?=
 =?us-ascii?Q?cA58xn2cce8NZDId2zdhKlMLPEHOXcAWZJMdXw6StD1GqxLRiacJJnRBxAsN?=
 =?us-ascii?Q?Ip/kq+3Bh7c6YKQMT3Rt58hbMOZzxtmFQwjb9gMQPqOiP809vT/8mBWFENWu?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a11ed1c-f0f3-46f9-c5b0-08de1348edc2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 22:01:48.3575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tw33UBNrBtNDfjf3nUlKusbsGlcYToKrv4cSFjgI0SwOxjZ686uQyQPPpomx607zbuX5aCMKuCZhJbHTBpbUjKgA1V023UqR7R967SmMjbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4769
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

On Fri, Oct 24, 2025 at 09:12:19PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/configfs: Drop MAX_GT_TYPE_CHARS constant
> URL   : https://patchwork.freedesktop.org/series/156513/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e_BAT -> xe-pw-156513v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Gustavo for the review.


Matt

> 
>   
> 
> Participating hosts (13 -> 13)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e -> xe-pw-156513v1
> 
>   IGT_8596: 8596
>   xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e: dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e
>   xe-pw-156513v1: 156513v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156513v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
