Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEFFC30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 18:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FF210E288;
	Tue,  2 Jul 2024 18:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdZ+pkY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224EC10E276
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 18:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719943385; x=1751479385;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kG5f+khDTGbSfhfcpPxjTMXKEF+iad1jIvvr/GFJDZk=;
 b=jdZ+pkY+p6X37EpbBI/K2DUtWPUJAS4qjBoCI4Y+L4LbtN5J/WlnHDLq
 6b8yGY7NSC2VjfCrHqkcne9r7shnTLkrKCs8CfdjlMlw14DqoU8Im2Rla
 IbUy8z11n0xqmgakv++TblZCWypScFXJWdYGLDLkH3HPhvFVL0He949U3
 CwVNAr/rANNKEYYkfljnqCr6XOdX5jKZ91rcMQNK48xf/pxG/UmSEJreC
 nukPNcvhM/UGus+L9b1SqkCrlB0P6tX76yAtrdG5hcCfvh6JEG8d+TRnL
 Lo/Ro2HCFgCaNIRwJjLldhi+6+WcfS0xkqdp4dl0dfSfCvwMOOwdRmJsN g==;
X-CSE-ConnectionGUID: soSJyZPPS+6eCwezLQ/Jng==
X-CSE-MsgGUID: EKy1ROLoQUeU0omk3wuMXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20901896"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="20901896"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:03:04 -0700
X-CSE-ConnectionGUID: hbYcW8xBTJyaV6XA6D5Qpw==
X-CSE-MsgGUID: +a3E/hHcRxODsyZYBrnZzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="46127201"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 11:03:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 11:03:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 11:03:04 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 11:03:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avLO0fA9e/tPYs5nhgH9cpmqP5b4F1fBkUp0w/A0Ujl3vH0ivfWQzpDHwUF3E74wpY6OCgKyRfPDV1R6ugqZaCQiwgpdOi32oqYsr/xGY4/QYz3PQl1luAbxKAEGLIlfJK1Q4IejvnxReiXgJO1u8GuEhceyNc8sDlvGNWnVo8nnkNnutIGClqgGyP6ettT4oyz2caUFfmwoW/Rarha7b3WrbPIqUtTWxBkOCOLFrP1VddcHj5zg9nEYqX8u4xpLIGriihyKj+oNflS6QvGZ1/WQvsNEh6Tw19cENI3w22F6BET3tb/k+7uES6wv5zS7BoOeCXzji/RRVNbxUnpkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6A5SSL9Kdsbb9+XYZUPFNn65I6Ybb9gSDrzh7rMOoBc=;
 b=hBfrM0HMOg1NwGEPRnpDN7hY6XX3HSi86m+C7WhSl61klnLxElX8KBxtywsCcsMyd8jSLip3+8B7w8/rv+v1vJ361yt43oarp7KJjJ0BMCiEq6ayvderyGK2kLT2I0/qBUGkemP7WGN1HPpDy4+GnCHZIACeGdscKAZGQjNkEaLsgXmu5t4qsCxy4cjPsL2PmJul3aZhV5ZZJlWsRHM2mhhGiHsSWfz8u17CBQ4zNc5jgHrbTVqu/014EvDuwz87HSAvOGwk8xdh1DdwJmMLkcTGCrEhBDflNgH0E+eYzQRw93TPNidkgZWKz3SqHMAvRJdbKt1KnT194cfSY+yqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 18:02:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 18:02:56 +0000
Date: Tue, 2 Jul 2024 13:02:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ryszard.knop@intel.com>,
 <ewelina.musial@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for Reapply
 "drm/xe/gsc: define GSC FW for LNL"
Message-ID: <ct6pqzwxnhlmgkal5yjbaaukl7kcshlg2ifhjiodxu464o4xth@6lnkhu7lrwck>
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
 <171988208839.3729.11952250272154489901@2413ebb6fbb6>
 <mxtejwnl6xie7a7py2ntnrbq5s57o5ho4exy3gygwggau4hgt5@lg3ixotyab4j>
 <790e4a09-a383-47fd-8c1d-2b8994c6c0b4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <790e4a09-a383-47fd-8c1d-2b8994c6c0b4@intel.com>
X-ClientProxiedBy: MW4PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:303:b9::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c858a5f-6f1c-42ce-8905-08dc9ac1338b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?k7GejndOKrJJN/zDyiP9N3w75ycx2PE1p6kqdSEEIlFLxrNNH+GK8JC4Ud?=
 =?iso-8859-1?Q?eATzw0TIvvW06Klk+BpG1f8pTuWi45yv6FITzCs15iv82xIx3Vv7/jW3ln?=
 =?iso-8859-1?Q?EEcg6KkGluXnJ2AOIpPv6lZI66ALZyXqBUrELtVVzPR+ylJzY3h9iwWzOz?=
 =?iso-8859-1?Q?nWflqyKI9gkm6J4rQqkFrjopESW1SItWalHBPuPfTCpbZIFGnn8PPMJJ03?=
 =?iso-8859-1?Q?lSudERCHlxehHtpaNkwf2rYPCK1lt12qTv+HlUn3p3+Xpjwa59XszuwE7P?=
 =?iso-8859-1?Q?87b9CHxYmm3wpF83FprgRbIGCmmikRuF/nGSPYhxl1AQrF7C012/M48xBL?=
 =?iso-8859-1?Q?SrdzkokyMWEUiZfOcshwxkoA7hqMnCfE0ZW2XdNKQanNBulYvMCr47kJe2?=
 =?iso-8859-1?Q?kAPYl3RBPwyvpSCMAbRAMBcLErO8zjpL6ZukYrHkFyH1Rv0dpoVpm7uFli?=
 =?iso-8859-1?Q?Vo9LqM+1TsCmA/kqLHp27Awssipj3/+VSG8eaeCXflb+5JrXWj7rD4vX3B?=
 =?iso-8859-1?Q?1RfCt+n7fwAaV7h6T9/4WcZkBj9+LUONMWJpqcn8Lc+BVnz1F0u8YSnREP?=
 =?iso-8859-1?Q?EaYh3cSV1GTXahiFJWGsSRipt6LgXIRQtAC1zFz5qURVMTzxGlyCdwIWkf?=
 =?iso-8859-1?Q?04bCjThXfJ3VMxepD3mGorkYYGqXLOTFDYlIUAE9EGx8e0nfpMpbTPjX6u?=
 =?iso-8859-1?Q?6phOGtoJsOfHK0LqFlVrin86VdKEBlYC40spTcchNS0GBZwHrKTBu5fwOg?=
 =?iso-8859-1?Q?lpWfqxN3PEWKRVOPeFCbMFgiSU7Tb7Jqc4mF/NXa9qOQK0PwRbe+qjizqI?=
 =?iso-8859-1?Q?OHJm0uB0g+YiNfDm1bSCFxYwmhhuQFDbNOnIvAEWaJ2642693kFX269bhr?=
 =?iso-8859-1?Q?Vi5rfPsm8qKoUseOooz/2g/XfLHI/j3US/Z6+D3jQbOG+N+E1Wu+KgBLej?=
 =?iso-8859-1?Q?LpMuogZjYZ8mE7f+o/qVRBryRKeLFAzgPMUdFTnCSGC9ogCzhN9burjd0F?=
 =?iso-8859-1?Q?5LzcXuluKXGbaRunZxdCzNX+i4KV5+Hb4hq01df96muWSNB2BsEMOUNrUq?=
 =?iso-8859-1?Q?g5Iw7BonE1uaxLdZKlC6TmVQTOTxxqjjpxmwbHIPkAeBsMoqJaSwcNQ3pw?=
 =?iso-8859-1?Q?FyXBpHzvUzGTMHTVlpjP/JEC5ZlR+/bLRHQ3Ey3xOqbNHekIlm7Xm3iqZ2?=
 =?iso-8859-1?Q?jz1hJ2Yb5YrFDxvOoqRXAfTg6P2jm5r7JbWxNMhDftXGZ8nhdN6QY0Mf1V?=
 =?iso-8859-1?Q?UMcdi5F+3wyi/UB+j70or9Xa1UM/VOg1/4942tvAm5pIelSU8Y4LoJ/Qhi?=
 =?iso-8859-1?Q?tcgZ/7RFtig3xl++3JsfVFvlG22muqx8n6E1U6Gx8TPGjRQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fRwRiNimsZYgvxFqYI6TNI3HNzrT1j1D8T7qkVnUzSi6gA1KFTg5Z5VXEw?=
 =?iso-8859-1?Q?TcPuHwFBnn1jxmFFx+34hN7NfPi+EDcSJURGVqkas2eMjK3E7m10tPcNsa?=
 =?iso-8859-1?Q?fCtWlRQPuK0DE/295yQWN+ODyfSp3+LX1yBAW2O8cSr4YjMtEvnF8Xt5ts?=
 =?iso-8859-1?Q?TMGUWEGifyK5OCpZvqdJK2AQuFgTiGDHOIyCIDDi7fE3xhG2t9pgrw8lL2?=
 =?iso-8859-1?Q?gYF99VphyAhwn4J2oQZTBkKNPnWmA5SZHANPvvjjatJIt0fw5x9H5Q+dSz?=
 =?iso-8859-1?Q?sC//8tp+eNMzscZpJTsZDyhVN4438CzqodoO8eJ2qz5Au5hNmkGwiXi2Ev?=
 =?iso-8859-1?Q?0DdJ2NjiOGupwRMjvUFJ4qzeUPSMwsw9o6a80kzdrZ84rzW70ZIYjMvoVN?=
 =?iso-8859-1?Q?o3VhgoYVqunq4+ytTuPB9LRTEKCwz8EAVCDABx0mjb5wtiqsptW/VtVIU7?=
 =?iso-8859-1?Q?pWjrGvu1eV/59CWw2kVn1jbgPorYuZ5j/FVlrMeC8amehAP1agHwREGABt?=
 =?iso-8859-1?Q?+n4BYMNyLQTyaalfFTQJm6ut4FD504FWNPZG8dsUGxhe/6fqyfGuIxlxSF?=
 =?iso-8859-1?Q?PHw7L1BN0n+ZrXnFNwVXSNAOiyGeQa+Q//WuPy4GD4PRMmTcjDQqmlI6NU?=
 =?iso-8859-1?Q?DLcO/OQCSodKWZEr1HJxT3xh+R3PKkm5eK/YoP+4PaPsItssLYjGvcVAZv?=
 =?iso-8859-1?Q?K/MPX3OMHLM9gOUJyAMImpEENaf0pvJgmdUF5Clp+K/HhUqqJMpfOEG3i1?=
 =?iso-8859-1?Q?kxhYTzTAXRr8sI3NXx+iLVNADINAgpBjnRLQ0k8CaHnh/BESnWXbncu3iD?=
 =?iso-8859-1?Q?JaT+4yeT11caw3oUxM9eVOpQaC0BCejZh58IXAVcNKam6mRC2OY/9EAN8q?=
 =?iso-8859-1?Q?A9XC2eGR/1J10Q1ony/67hCl6i8WoBx1AHgGedwY7z7g8tBNzEkGYOu/Nb?=
 =?iso-8859-1?Q?OmbZr6D1q2spMqY5PFGfkiTPJbZuSJJ417JGW1AUpFpsQsSD/P3CZ4rHFb?=
 =?iso-8859-1?Q?cq9j9hgJX6Chk7PO/Qun8buhPSCKUzD3c7ewI32anMSwDq83q1iGM14SA0?=
 =?iso-8859-1?Q?1YHcN3R2MTRfKjZYVx/UpjFxTqRWcNnDgk0hg6O03oCVGvl84Xx+vF8Bj/?=
 =?iso-8859-1?Q?1XA0e75paXrZaky+iAqUAAorPHWnzQ3gd8xDLOA++9Dar8/D7gD6qd04Mk?=
 =?iso-8859-1?Q?jPp6rqIIV3JGscXaZUMqIzMDvUz/9JxC9fCsDPAZBFdaamLRm26p+jiH9G?=
 =?iso-8859-1?Q?QFKcpms0TD2DsvYZLi0OnUMqR2JTd6hPsvpJts2qCCeENWLSDNyJ2qj1zz?=
 =?iso-8859-1?Q?n5Hh22rY3fM2RFxL0F8BfDq/Se7iKqeue1PoEs8IJoXrRcn7jnGx2QNJRV?=
 =?iso-8859-1?Q?x8gRxh5WdTvQKsaagqBtmVjAgR8hWn80mwLp+bg3BInQzu4Sy4HO6sEkAv?=
 =?iso-8859-1?Q?YVuPzNREImPXuqmD3/yj4bl0D68bNM3SeVZh1MO8FlzA4nPKSBBB5z+++w?=
 =?iso-8859-1?Q?iTKyMGBansO2rYgd3HWGxFa2eVcONGlEbAIi0MNAQqhgdAQxjFI3Eboq/q?=
 =?iso-8859-1?Q?2KXamfTuoKlUOZ6S9JpP3ObYSxVntZ13GM2Pc24TRXuuw6U4L6A8sx85us?=
 =?iso-8859-1?Q?H0YFriOOh0quNn58HntgiL7dNCj3VymOHvSPqODiKmUTSxHRKT4RUtHA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c858a5f-6f1c-42ce-8905-08dc9ac1338b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 18:02:56.5758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFldfCXEMzpcIO1Z+tqoqbheoaxCYNjQh4kVFlQf++K+t4SeU5pKm0NTzu6DhuOFV+fGu26WkPLNQjS2BF/G70Om1d+MzoFM90gD6pOOHHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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

On Tue, Jul 02, 2024 at 09:25:31AM GMT, Daniele Ceraolo Spurio wrote:
>
>
>On 7/2/2024 7:29 AM, Lucas De Marchi wrote:
>>On Tue, Jul 02, 2024 at 01:01:28AM GMT, Patchwork wrote:
>>>== Series Details ==
>>>
>>>Series: Reapply "drm/xe/gsc: define GSC FW for LNL"
>>>URL   : https://patchwork.freedesktop.org/series/135623/
>>>State : success
>>>
>>>== Summary ==
>>>
>>>CI Bug Log - changes from 
>>>xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -> 
>>>xe-pw-135623v1_BAT
>>>====================================================
>>>
>>>Summary
>>>-------
>>>
>>> **SUCCESS**
>>>
>>> No regressions found.
>>>
>>>
>>>
>>>Participating hosts (5 -> 4)
>>>------------------------------
>>>
>>> Missing    (1): bat-lnl-1
>>
>>I guess it didn't really work. +Ryszard +Ewelina: Can we promote LNL to
>>be considered "a reliable machine from the CI POV" so we don't have
>>"CI.BAT: success" when LNL execution is missing?  Or is there any other
>>reason why we report success in this case?
>
>Damn. I can't repro the issue anymore with this WA applied and even in 
>CI we weren't seeing it when I sent it for testing before: 
>https://patchwork.freedesktop.org/series/134099/ . I did 3 runs in 
>that case and none of them hit the problem.
>
>I've triggered another run to see if we get any better logs.

this change should NOT make the machine "go missing" really. Actually no
change to xe-only should really make a machine not have any log at
all....

I believe it was a very unfortunate coincidence and there must be a
network issue or the like... but we can't consider success when we don't
have a report for LNL. Particularly for this patch since LNL is
the only affected platform.

"try again"  in patchwork sounds good for now.

thanks
Lucas De Marchi

>
>Daniele
>
>>
>>thanks
>>Lucas De Marchi
>
