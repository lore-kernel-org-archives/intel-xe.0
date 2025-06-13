Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D1DC71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 06:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1DC10E1BA;
	Fri, 13 Jun 2025 06:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bctteqal";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9A610E1BA
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749796238; x=1781332238;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YpFUwWS3pl4rMx6qkMZPVwi6EQSiluMXMuMsMDEO4aQ=;
 b=bctteqal3LCU257w+Siu6Mc7dHYKvORPC93hP+Q157ecYREkM4scN/nQ
 hQRASAs73jEpLOsu8NSWhDaYf8W3aJDdY+9Q5jWZztzMNsf7StvUXIDbt
 blYLjiT34Yfvl7i7fHVBEbsi8A9bo53n3fLRZ07jllU06H+KCUbE/ydAo
 9ofy0QW+bHMG7qysJ445PCeK7aqimkknUnFnMcPIIMcte1+cxw8g7vqiq
 /+Drzy1pFOihb4u/D8582WGfcV+tn+aF30g5jqqr+vV5lzYQ7mkDQo/43
 v7AOQTwO6Nv2LVOjwzq5VAFN0gcOCzCYzUZT3WpZ7xmteCL0DRV9nKZRm g==;
X-CSE-ConnectionGUID: vsyK6GaOQK66fbIQ02ROug==
X-CSE-MsgGUID: /Zm7d38eSxSW23WeapMxbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51919667"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="51919667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 23:30:36 -0700
X-CSE-ConnectionGUID: JARPZMPnS6O/rfnT7xMiCA==
X-CSE-MsgGUID: CjdzoMDHQ2OXaLL4rWP2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="148110926"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 23:30:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 23:30:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 23:30:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 23:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7DoJwkdUpXH96qH62bo0tfVI/OyOov4+KNGqnulkkaKMlSNvAPVo8Rs9P1SqPiGbKxswyHu2Y1AK18O5kC4iwuOIA/w5IqxYy4Cx0yRNyOCMynbGb1GxKvlwGj5nfd5BJkhxzLSTUVeXEkz88U18KqiEsXCrmy0zzKeSRSayyhuZt2R2+T4aCbjBeMeTxi/euuUwJzILFeKHRytskeRDvPtiKCy+mBeN6wBJdABP2qxwZRZXE5evxgivQrfdSDe//SyhOikPizuBq0gx+the4SKnB6G3wuo5sni4EqpHPL3xmhbCkSadXOcgTJHLt9NcEmMz7yoU3aK5HDWyTbY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuAYiWjhXO19hF1J7Y0MO7Nyxz3b5Xdfd3ukraz507o=;
 b=VMnS/Dl7sSNsKvAcGIj7BsHvPLzKs0Gnx2oQt8rpO9WBtL2SyHt1X+WFUpgj3a3hPWLLaBQau6i3Zb3j5MiUTvjQ3l8mQM6/cVsbvx/TX60TGWn57nnu/KEcIdliJsIJqJsTCBnwlKcHFh3sT8bS4GHBFKN+OkbGpHt2RaBNPri1bPW5p8plHlIBwGk0EFxLRNMdGPc5Deh6gwL+EE1GEHTf5L4Iv5ngNEAvTAxMko0H2Z9uUh2jGDnKVLVeYi8aQmAGl2aqm+HE4hiotEc5x0+Ovq1onKCqpx9QDrRvzYRXPT6MLXNVfdCuk26aHaOpG5Rd5XFu/sEM43/7Pj1C6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6293.namprd11.prod.outlook.com (2603:10b6:8:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Fri, 13 Jun
 2025 06:30:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 06:30:27 +0000
Date: Fri, 13 Jun 2025 01:30:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/bmg: Update Wa_14022085890
Message-ID: <ydhhvq55wuhuekr3ddlchpfzspihp7ipjwmcwbastqrpzks5ya@byevlphjjjhd>
References: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
 <20250612-wa-14022085890-v4-3-94ba5dcc1e30@intel.com>
 <928717cd75ee2ee36dee435d31bd7bbf7ab60f0d.camel@intel.com>
 <rghvmypkecku6r45fef62b2epqkcknz7lp2xim4yubx6akdap4@2skodbxg6gjs>
 <9ba620913fc7fcaca4dc3f24f9d0d616492b627a.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ba620913fc7fcaca4dc3f24f9d0d616492b627a.camel@intel.com>
X-ClientProxiedBy: BY5PR17CA0038.namprd17.prod.outlook.com
 (2603:10b6:a03:167::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: be9b8155-2f5c-47cb-c229-08ddaa43c96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?EeQH1pz34zJrciNzy3iYUaih+J+hIDzO5nguSXgHgAPSxzFDFyGAIkcb5i?=
 =?iso-8859-1?Q?bDZnEqtfj0HvRs70u6xb8l4EqYU7RhIgN4/klTjahrkncQgUZONeo+HPLM?=
 =?iso-8859-1?Q?mmDLrdFf/+GqwYBLrpGFHuWQzqoge5lPdPas5oABm6kOQq/xlIuNSS30wq?=
 =?iso-8859-1?Q?IcOewyII0/diSkaJtxs7GLCTAs03BPNaOvd65S6qepXlW9brdj5P5qa45n?=
 =?iso-8859-1?Q?gB5E+NJ7qXN2RDTL7WGvl9mcrX1gabRxEiziqa9Yl0UCX2BW1SjYr0p8Az?=
 =?iso-8859-1?Q?xCcjgJzewWPIYgPvVFDk1ARqbkPJlHR46SRnK2VVbD2QsDm4rnaUZAFpIV?=
 =?iso-8859-1?Q?UFoSQAlGgbXgOaY2frR2203E4cYtKrRHJExV4WP4G2oxFg7HrkNVgp6aeb?=
 =?iso-8859-1?Q?VsDMT+P4dSQAi79Kq/bvHh8B+7ucZ7ZMFxa+eR1aoa0kBgZ9JeQqwOdII3?=
 =?iso-8859-1?Q?NTzrdKEQGOPCitCToJ/LVOKHu9RCz4jOlYTL/eNQujZJ81Q3cDQyjpnuUo?=
 =?iso-8859-1?Q?SU2AaQHmaSzl+vpsd91apAdBB2GLHXQFkGEYNcwmBEicyR11Ph2NI7UIGp?=
 =?iso-8859-1?Q?cqBEV9QQR2jaPrUX2VVyNcvGLZoAxdsEWoD/RphyouJQRGcz7JD81a+jSp?=
 =?iso-8859-1?Q?mAcQVOEPyBIdAsxpYLPRUZ2gaOFDdRoYAzySj5Df1jpCnrQePBJgdq3bLX?=
 =?iso-8859-1?Q?Q3bwn9a9FbxxTHI3hbQwCTv5rkoWxhkYJva5jsFLsw8wwW9iT+Fc+7N8ki?=
 =?iso-8859-1?Q?tn3Z/JzzKwiT75Vhb8pzj3BKShgV1SFJH62KtvJdE4LHAbPjjQb/eLldAe?=
 =?iso-8859-1?Q?g5SXX50G/uhHhjdwOd+yn8E+clGdqdl2CpDoQe/kSC+5mU/4G6WQhX1Kja?=
 =?iso-8859-1?Q?/GMOwUsdeuMCvqHhCbhh+yrENzz2UujRpbEvZbOOquWZisQBvZTsr8YFo7?=
 =?iso-8859-1?Q?qfRsZNpabYFBmwEnNzAw+wbMJpFBtJ7DS7JpYLQ+4MlfUVxNZLOT8uUbIN?=
 =?iso-8859-1?Q?a+gC+e6isJL6Xsp9LU7OTPGDbflYWG81/COrNPRwr2cNHr5TAuKRsdtjH3?=
 =?iso-8859-1?Q?hN3gfCCx/VEP2McTB0iblstMNzDNki8LWAE2/dOwt0pEhRqcMgj2aDQt6V?=
 =?iso-8859-1?Q?ViT1AjlQOvAWHi7NnJYZx1JeRNklLpmN+V0zh6loiwfifqBSSmeDuhcHr2?=
 =?iso-8859-1?Q?GmdsYPS4TpO+3r3rQx7/VB+uT709BY78+dPA+pzrIEmybbmj7Ufc6gOe9T?=
 =?iso-8859-1?Q?8Ar4klNJsQHc8VrlpTJVi5exIGUAaNQ/lnukckrWovRqGcMQBF6WiYRtc9?=
 =?iso-8859-1?Q?eF1JuiC9Yg7gFZFun6Wugcsf49zfDyva+L/E6e2H1uEEeTQHGvje04Myvw?=
 =?iso-8859-1?Q?9I6Uq2U30e0IQHP7y4U8Zt4KB2yd0ulbL9GPoYPLBbbbJC81BdLpHpn1SI?=
 =?iso-8859-1?Q?e4Z7igwwVbIpZS50EBgPq6qwOMSXdg3zkYGfB9eO8DN8J2nrNiS3afFVm8?=
 =?iso-8859-1?Q?s5nSAA9Ca8fbfQeD/1hHo7kQjcosDUFV1b37xLqLBybg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?StnfP78VHdloDPAcUpSzeksY+27ZRKQr0rY1tRy6HzqrpwOdn4UFJ8isqz?=
 =?iso-8859-1?Q?TfrbNI9z4rxOEvCIEvvRLaRoATIBuAw9WkzcGu6GJL1Ni7DqcrPqSa0DbW?=
 =?iso-8859-1?Q?iKDPw1qR5BvJj0H4VGfe8libAe1BflbLzLWVlZqBL5WLkItrDtYbgCynCl?=
 =?iso-8859-1?Q?Nm9pxugj1q7hFE8fGuiU4TmNgOGdZFOTRN+OiPKxOCsKvh7evo+RGGCa5K?=
 =?iso-8859-1?Q?+PAcKenHFmIXdmRqkT8sTtIRoqeZPb5diBuD0n4jmo+TpjobnSUjdGRN0V?=
 =?iso-8859-1?Q?uwp8ZQiv1UYZPWXwGaWx+Uu8eJlvzEr02DuBpLpL5mxtzGAFEFnPdsX0WU?=
 =?iso-8859-1?Q?XtMHD9aOUdjYnG+mSp+sCMut/tyWIhGQOv2OwOGi28UVRr0qahlKlt5Ds4?=
 =?iso-8859-1?Q?rsclSdFz66kJFOopcSbLkxRR+b4CcnlJTCXnyTnrU5hgdgbA8HwBoJXS3N?=
 =?iso-8859-1?Q?6iCn3nY1aae7UpxutGzFmJXsJs1UMExYVrFgkQXM6VR0vF193q5cQyxVsD?=
 =?iso-8859-1?Q?9o9cmmuEOqfrSsGMjARz2HRmfu+E3AcPjSzlFO4npk2Q2vpNzutN6Dr2pd?=
 =?iso-8859-1?Q?SvqL304k9eUK2u3v2EX+R7twwBGjshknasLoZG7vy4IXnhWjfskROwVGJX?=
 =?iso-8859-1?Q?2K2TkI6AFN2FzlHNtxK/huRLuux3fcxhJP3Ols2SQ/jrhYvjP3fBfr8Ijf?=
 =?iso-8859-1?Q?CFg5RNa1hAAVF1DrCzGnX5cUzlWJpwH/uSaUhZfKLlYTXfs+huWsbX4qpy?=
 =?iso-8859-1?Q?ai29v0Gg+tNOXjE8eJRph9McqPx3Ld0C9jLkM8lcK7tHwQUPiMkG2chmoD?=
 =?iso-8859-1?Q?kkdZJuN86fM3T6V+241F14rvshIP+AgCjw8hyq1uIuBxYE8aIsWUYNto/j?=
 =?iso-8859-1?Q?YHUh821qC+fkmjSPLoDo49r8C8+7NoqqICGihYHA7s+OkhlVwFASPKwnhD?=
 =?iso-8859-1?Q?2ZrUwfFKGhntE/Ovr0e4iOSKLCcW3OkQ5HN/tVaqd3iiSUiuiAN86l8EYv?=
 =?iso-8859-1?Q?KjX4Ro0sBYVzZ+Qzzk8pkJBlik+06sbZoKyNKTz19vtOFO05FB8WxsUWUQ?=
 =?iso-8859-1?Q?WaJfEp9J5ta5hhdYzxbLgEEtoJo9zg5ONmFwlIwaKXvozLMMmKveTur13t?=
 =?iso-8859-1?Q?RRJ4nw5w7jNvXCD7IDjiwficv/TQsltEbtSQg9g4YOXJz19PWQ9D6XWP2v?=
 =?iso-8859-1?Q?rCcPPEnsmDlZ2m58G9IqY/sizI7MG65WMWaBELRCeETYfSJ5bQPcbsIMxz?=
 =?iso-8859-1?Q?PiW52MurY21BGJ47qd1RMCoCyXEfQ/OQYcSfm7FDU+5fypMZBUIdg/dysx?=
 =?iso-8859-1?Q?Rg+O2aCkKatl5ThD2Q8Zca8ObQDGdaVYcOlpsmT/I5a7LGAcYcbLy//kRr?=
 =?iso-8859-1?Q?j4ZcwnDHAlz3wE5gvOEY/khcoFdqs/IviNuomqWz+XOnvZLX0NImzkO8+3?=
 =?iso-8859-1?Q?0U/GiYyzxhRN2Qds8hsAq/gAykY7kFkUWH0MD7hhbPxo0mg4kL1uTwBTx0?=
 =?iso-8859-1?Q?kC8KgrMZh8JUWZoJ8bQYlaIJwC7swDgYIOpio06QiCczm5hDTNtjYi4Bc3?=
 =?iso-8859-1?Q?31mRjpPH2yXDaMZ9Yrqxpb+10NrxnfJ5MPtWeT3p5NTd/X6lKhRm18ubdi?=
 =?iso-8859-1?Q?ji2lvDNu6lBLKncFqgiUYxodc0/1/Ru0h2w/iaaR0YCvwDoVdRKKCXFw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be9b8155-2f5c-47cb-c229-08ddaa43c96b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 06:30:27.7098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GH09u3Jp9YyTRFiaGHO7Cwu8qz4MNXeoA3Uw15aYq2WJiWMLm8919MjCFmgBNl2zefCkicqoRxEE7xbSqvvq0cwy++HyvTJaLNT+Elg4VkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6293
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

On Thu, Jun 12, 2025 at 08:23:04PM +0000, Stuart Summers wrote:
>On Thu, 2025-06-12 at 14:31 -0500, Lucas De Marchi wrote:
>> On Thu, Jun 12, 2025 at 07:15:14PM +0000, Stuart Summers wrote:
>> > > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > > b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > > index 425cb401c2762..38b589fe9198d 100644
>> > > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > > @@ -59,3 +59,7 @@ no_media_l3   MEDIA_VERSION(3000)
>> > >                 MEDIA_VERSION_RANGE(1301, 3000)
>> > >  16026508708    GRAPHICS_VERSION_RANGE(1200, 3001)
>> > >                 MEDIA_VERSION_RANGE(1300, 3000)
>> > > +
>> > > +# SoC workaround - should apply to all platforms using this
>> > > +# graphics version in tile->primary_gt
>> >
>> > If this is an SoC specific workaround that spreads across GTs,
>> > shouldn't we be using the device ID rather than the GMD ID to
>> > determine
>> > the workaround application?
>>
>> devid would be a nightmare to maintain... imagine each time we add a
>> devid we need to add checks in multiple places in the codebase.
>> We should add support for SoC WAs properly and then migrate this WA
>> there. No need to do that now though as that would mean a much harder
>> path to linux-stable and no real benefit.
>>
>> The way it is now, we eventually remove it from here and add to e.g.
>> drivers/gpu/drm/xe/xe_soc_wa_oob.rules. Or even just keep it in the
>> same
>> place and do
>>
>> -14022085890    GRAPHICS_VERSION(2001)
>> +14022085890    SOC_VERSION(1234)
>
>Ok and the 2001 from bspec does seem specific to the skus right now
>that have this soc. It would be nice to have a way to tell that this
>needs to be reviewed if we get something else with the same GT IDs but
>different SoC. I know this says SoC workaround already, but is that
>something we can expand to something like:
>SoC workaround - currently applies to all platforms with the following
>primary GT GMDID.
>
>Otherwise the rest of the changes look good to me:
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>

I reworded it like you mentioned and pushed to drm-xe-next.

[1/3] drm/xe/guc: Ignore GuC CT errors when wedged
       commit: fa424387379650cdc0ce42c2f6e76e020b4c04d1
[2/3] drm/xe/bmg: Update Wa_16023588340
       commit: 6ab42fa03d4c88a0ddf5e56e62794853b198e7bf
[3/3] drm/xe/bmg: Update Wa_14022085890
       commit: bdde16c9ac5cb56ad2ee19792222fa1853577af7

Thanks
Lucas De Marchi

>
>Comment rework isn't a blocker for me though. Feel free to keep it as-
>is, we just need to remember to review this (anything with "soc
>workaround") when we do that rework you mentioned.
>
>Thanks,
>Stuart
>
>>
>> Lucas De Marchi
>
