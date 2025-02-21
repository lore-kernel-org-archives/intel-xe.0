Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E64EC021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 08:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FA210E2D9;
	Fri, 21 Feb 2025 08:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGWO14k5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDB810E2D9
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740126360; x=1771662360;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8WElqdhBUDc5Ogf1NvrBDZbVHyp5SP4qKIkZGB40/vs=;
 b=SGWO14k5PK5xt8V3DEzBlN2bhm16uebPk3+BpNmR8OFwK0MhYVOnMT9e
 DMfOKqCbYoF4jJatfWPOcTk982ML3nbcb1nXS+KZDm8I0l/yCb/Ly+Xfs
 R/qlw5KHlFZBvPBa3MW/9i8B0upySjvn3BukEqq2ei0VJzsdSEIXmef4g
 yZWeUnDATkz2vSVi6IwI54MZio37PvdeJXmjhJIGRGN1dNohyum4RkhdA
 rn/0vySqNKUY27yLHj/F+ig5JjlyXyIyK1UFv0bl5/9iKgUtjmbgbKaDv
 fo9pY37UlA/O6l92umeBMC0D0epf4cWo485+EmoDfL3d5AQYv8zl1xl7Q Q==;
X-CSE-ConnectionGUID: gZcVraOaTN6lyL3hqaEktg==
X-CSE-MsgGUID: lUdStXEySo6XyDVxD0PMCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51578531"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="51578531"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 00:25:59 -0800
X-CSE-ConnectionGUID: 3tCCJWrqTXqz9ygEgy9AJQ==
X-CSE-MsgGUID: qyWuLHl2RGmn3PvrQLhL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="120237747"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 00:25:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 00:25:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 00:25:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 00:25:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSLtXbQtQPN4jijiTP4WdhoAJMTUDvUAAC4xHiiLKEfTC6XxZBP00u+QqU+xOZY19B1q8OcaBDjCpHOGn0EuUP42WGaNAwJ7yayZIYPtOSURMYjcDI+4Adbztv6tJ0FTa/7M+pjYHrppUiB8Ch+uukQ6m4Q7c5j9luNqRfjMa2+bPTMc4g/gQom7HT0g6y/AUobdyjQrZMiQBX8PnvWySJDCBrguXXUfPelZbWMe0/VummRXMovs1UR6gbdIbAGyKwb7tplgBQ9wSKwtePvd9UHXVHPxQNCLFIiMlGYFi2gfyEHLPSfaAukW6K1LIUdT0HQjHiiqzU5K0cgMfaFJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f3eDa3UDGdHmknvaWJ+Lis/LcxxSJZLHeG9tbio4Yk=;
 b=K1fdoM0HEZBUyXBjS4AnhCxhhdmH1oggWLJESTrJvSutn5HG4gAUG09Dmi8p/fw76H/buByTy8WAxuVq/kP4Pz8OZPh6uesTYo7f4cgP6nT88j8am/gfx1T691sOv5skMmzfuE08h7tcicXrBHv0UerTP6EvOUX1pKdTLwVz4qtHX6jFvWhQURtEr63W+7NCEea/5FuyL2SuTdnRldtpoKs36GrgxRB8YRRvSa9yse6VL3W0GF5diWSzhmOb8LANfbpTwHcfUI+wl3bWa42qKr397lr2Tb6F2iMqQgr+33wSmqsToNxuzEFxWduH2aaXTQMklqpoTsClv+zZ2BOh7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN0PR11MB6280.namprd11.prod.outlook.com (2603:10b6:208:3c0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 08:25:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 08:25:40 +0000
Date: Fri, 21 Feb 2025 09:25:37 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/pf: Create a link between PF and VF devices
Message-ID: <20250221082537.muiietmytt6qeizm@intel.com>
References: <20250221055722.21370-1-satyanarayana.k.v.p@intel.com>
 <20250221055722.21370-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221055722.21370-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: DU2PR04CA0327.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::32) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN0PR11MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a35e8b-18b1-487a-0309-08dd52515362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzJjYnV1a05HMXdMZGZ2d1k4cUNtU1RZemhrQkZ6UmFtYmtIRitaY21lNkhT?=
 =?utf-8?B?VGIzV2E0YlZFOE9CaVVpdUMvTkdNUG5SeXJzNmt5N2lFOGY4azZSNkE0WGpD?=
 =?utf-8?B?RkpFQ0trV0E0cDhWOG1PQTBwaEZuNy9leE9SWjNxc1dOOE9ZVmRycWVlR3hu?=
 =?utf-8?B?YWNOVXBJWXVnV1RJMXR5VDI4cmdwMTh4S0REaGRSNTBhenhGamJUaXhlNkhD?=
 =?utf-8?B?UTduTG94b2o2WW5IUFZUbjU3MFBDY3lwcjhTeWEwdzRBRWUyZ3crNEswR2g5?=
 =?utf-8?B?VmoyR0RGQTFIdHZ0WnZEcVQwOG1zbStSUTA0NXlHY2luZmtUNExhLzhUTU9W?=
 =?utf-8?B?UGc3TTNIdmtoZzJiZmhjNnN3MElWMTRkL2tlcEhHUGIreGlUMzlaMDJFWGhO?=
 =?utf-8?B?djZKVUdjZVpYV29JRGhVa3B3VUpyK1o2ZG1wc08xc21vY0V0UWFzMm5ZUEhP?=
 =?utf-8?B?czkxRHBwelFRS0hjMHR0b0RPcFNObms4ZGdwQUYvbk9VTDlCM0ltcUxySEYv?=
 =?utf-8?B?TjM4NHo0UlJtL0RFZUV6ekVHOGNrL3hoZXBWOWZ4d29WOEpUUk93WXdFakY5?=
 =?utf-8?B?bS9VcUkyV3I1OEJnbFY3T3owSDVLREhkOUpZeTZYZ29zZDdPenNvOGsvRFgz?=
 =?utf-8?B?L2gxeGlZOU9OSlUwMUk0T2lnb2lLdzZQZ1lmWDExVG5jOWV4MHhxSkl3Y1p6?=
 =?utf-8?B?cVNqSTBhK3FjcS9XamE2YzlaV1dFVklUbkFtNzg5aHNRNGJyQ1FSNy9TSEEy?=
 =?utf-8?B?aEY2dDFxbUs2N1ZoWHhWVURNYk41ZlNqNHpURmRFaGdFeThTK3hZTTl6UVJo?=
 =?utf-8?B?SFlibWxWTU0yUnN2TG9wY29pb0g3cU1rRjBpNTdJTlFSZWhoZ3c4MGV6cFZw?=
 =?utf-8?B?bllQdlJ3V0ExbTd5YXFNc3RnTnd2QTgyZjhMWVk5dlhLUlNpUEk3UExyS2ZF?=
 =?utf-8?B?b1RKRmY1TkNsOUxFOFlQdUo5YkdaK3BDOVRzVS9FdWl0Y0N4ZWgzOVdZSElm?=
 =?utf-8?B?VnhvVmROcnAwMnU1clBoaHhJTjR3Y3FpNHBjb05mQkhXZlFUMnMybmJSNFQ2?=
 =?utf-8?B?Y2RkK0t3dGFQMU04VmtLTTM5eTkrNFhNRHVFWlIxcDFSNExScUw1a2VEeWJY?=
 =?utf-8?B?TkV1VkptL3VkS3ZCK1ZVSUhyOEJub2hLU2J5b01uT096SEMzYlFTczZBdTRG?=
 =?utf-8?B?cFNkSm1jZGdpMDYydFRqU2NSVVJmc0ExRWVMdUY2MGh5cWJicUJIM3dZL0VC?=
 =?utf-8?B?b1FPSXZuaXI1YkduSlYzYW5CSlF2QjZzNjlTc2E5a1FncnBKQmp0VXhSc1lG?=
 =?utf-8?B?VU5PM2txd2l1R0s2YmhTNEN2WktaUWdrd2RvVlVQR0NEZHZhTTNod0JDL1Z6?=
 =?utf-8?B?UXZyS3NleE5RLytqVjAremFDOFVPMXRWMXJ3RVVwaXJ5czUvM0EyNml1ZXJm?=
 =?utf-8?B?a0NjVitNbUllMVI1a2E2My9oWUJoRXFzS3ltVlQvTUcxRkxpUHgvdlNUSURZ?=
 =?utf-8?B?SHJUeGU0dVppazRCYTExMjAxajhweVhndjcrcVNWNjhxY1pHbnRhOVZFU2I1?=
 =?utf-8?B?MlFLVGpPMWZ1VnFMcEtacVFXUElIRTJkVWxNdGZHSkszY0dvSmpwZkI2L1J2?=
 =?utf-8?B?dkZhR0xqWkJMT3FZUDZ6S0NXWVhvT2hQUFltYkhKaTdSWkNTNzNDclB4OFlq?=
 =?utf-8?B?UFdGSDRJMThySzlBTHlrY2YwS0tKcStvZXZSWnArdmlxR3ZhM2JTU3hqUmt2?=
 =?utf-8?B?RFVNdEU5RzQvZG11QTIybWhpdFIrbm80T2RzNTNCK3lHREJqdnNXNGJoZGhl?=
 =?utf-8?B?WEFtaFJ2NTFLM0crQm9QY1lRNENSYS9MY3ZLcThwWDRuTWZSclJSTkZPbW9Y?=
 =?utf-8?Q?PPwg8McXM3Eml?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmZ3TFBlSVdDL0pXSlg3Y3ZxZ3l4TlozU1lWd2k5bXQ5RFAxcW1hWFMxQ0tx?=
 =?utf-8?B?cytnY1BhV1dxa3d5ZnkwT3ZPWktiRk15SkE5V2ExMGhLWEtVQTFPTjhKWk5G?=
 =?utf-8?B?dWFhMDRDQnIwNGFkT3oyVjZaTnljM054QXdJZlNqeTZvb2U5ZVRXbXpicCtX?=
 =?utf-8?B?MG1lVEpVMTY4ZkpMVXkrbnFzZ1ZTODVWYTNFNGc0Z2NTL1RJMXBkSjNVU1JY?=
 =?utf-8?B?UENPRUNISld1S3IrQm01QjJVUWo4SVlKRTIyYmlxcVJtTFgzT0FxWUdBRDBZ?=
 =?utf-8?B?Y25yR25xMUJFWVh2c1c3L0lsWFl4a1FvY1RmQ1c2eHlqOG14SkdHeXdWZFpy?=
 =?utf-8?B?eFA4bUZrQVdPbWZqYXRSNUQ2OHozS0xmSDVneEMxNDh4YnFwR2czUHJkbHA2?=
 =?utf-8?B?bzNsSFRnSHVwOHgraUZJOFdsd3M3S2xsdmZSdGJaa2k3Q1JQMndaaTFxVXNt?=
 =?utf-8?B?bVBCY0JUU2k0K0FtS1hRcTFPSDFMbGNwaGxOcXhDcDBuMVRlcU95azRMMzRj?=
 =?utf-8?B?SS9YMmhqc1Zxb2NGazZZVDdVMVdVdlhjdmpnSnhWclRHUXhiK1k2TFNYNEZB?=
 =?utf-8?B?UGJJamRRQ0htSk1iQzU4U3ZRUmVjY3JaWHd1V1FLUjdscFBwNkQ2Z2EvSW1X?=
 =?utf-8?B?Z2FWQlhxeHlmcStHc0p5MmZMd0xmV2pyTC82SWVIWUFadndaSC9zUzBIY09T?=
 =?utf-8?B?MFBKTzFqVnJiSzBZWVpnL1JjWVk0WllDMEowWHFrVlIxbU0wWUs3N0NKRHhG?=
 =?utf-8?B?QllHYmtDNzFhV282RmVqUmRZTFpVeEtLc05nT2dGTm1UK3RSamphUlppQTlR?=
 =?utf-8?B?cmdnR3pjOVFpQzAxRldUNlNXa1ozKzFjbUp6dWUwMjJSbWpEcDFxT0h6cEJX?=
 =?utf-8?B?aFpIUWNoOTZEUGZYL1JHMHJadGJnQ2Jnc3lneDVWM2o0ZWpONVVwNzF2QjFh?=
 =?utf-8?B?WjI2dWp5OEFoeFgvMkR1SXdJZkpKcUNHMldFenkrWGdrdXVPbUo4eGFWMlRT?=
 =?utf-8?B?cTVjWVBVWmc5NVBvbFUrcHROU1FJZkxOc2xZZE1jeUoxM0FjSG5MYjJRT0Nq?=
 =?utf-8?B?QVhtUzd3ODkyUUpveEdUMkZXTUlWMklwNFVnSi8zcDhXWHRvUWNSNStUOURn?=
 =?utf-8?B?L2xaa3VTTDlMbWxpZFNSSnBDSmdMbDAvSjdvNWFGNjhBZTQ5Zm5jamJIbXlD?=
 =?utf-8?B?WTZFMlVrS0FyQ1UvekNaVC9mVzg3M2VRbm9TYUIwdllqdkJKUVFFTmJLZEF1?=
 =?utf-8?B?Z0h6bERkWnVxTDJENXJ6NmFoTFUxdHFzR2wyMGlUZDNPK2lxbVpzNUdQR2My?=
 =?utf-8?B?SW9NNVlRRSsremx3STJNVHNudmtkMkd4WWdBaVZmNGY1Kzl2U2xlM3RTYWNU?=
 =?utf-8?B?bGtrRHEvWkpqY0tsbXBHSUFOUHdpem1XWEZkT3FOTDFCSTdpVHJMWGhBNFVi?=
 =?utf-8?B?eVZNeVBTV2huRG4wN3BXOVFRT0NVVm95OWd3d3hJQVNaQmhndzNWZ2VuMThn?=
 =?utf-8?B?RlFNeWpvNnRadGdtVkRYN0VEbC9VSFFMZmdHK3p2SmhUV0VhaDFsMFpxRUFn?=
 =?utf-8?B?cktzYW1KZHcraTFZazhUWFJzZEk0MzFZNEl5MkVQMEZCMWJyQy9zQjViZGpi?=
 =?utf-8?B?OUJkMkNZNlkyNUxyRDhOWFY4amxQY3BnRlZaZTErV2lGQzZQN2FyWXRsbGE1?=
 =?utf-8?B?TldmTHFVYzVUOGxsdUh0M2JvNk9UNzB5N2YxYlcrMktxL0FJbGlNRnNFMFBo?=
 =?utf-8?B?TFp4WUNWUUM1MkFPem1LL2VaMGRVSktFRjVubmRVQ1hrQWErRXp1STZUSWlw?=
 =?utf-8?B?QzhhMnhidjBpbys1cXlzMFNGQ1RLbkFQRXMxc3ljejdsR2JqMDRYV2ZyeVc1?=
 =?utf-8?B?M2ZKRUY3aGZpWTRDeURQOEpJWGJqN3JJRDJJWWFCc0wrU1BOcVQyNW9rZ2I0?=
 =?utf-8?B?TkZqRG5IZGRRMGdvTnlmbVNDZnR3blN1dWJaKzJuSVo4YTBlL0VEQ0FsQVlV?=
 =?utf-8?B?S08vcS8xUnVBUEZGV1MwTGZXcC9Ud0JtS1E5aWxkb0FuZldXYjQ2Y2k2NHVO?=
 =?utf-8?B?a1oyUDJEN0w0Z09wQ0xTVFlpVW01ZTFObkFkV1lqWEVqU2FuK0tSb3dRbmJr?=
 =?utf-8?B?eTRwNmxuUm1ZZkdCMGUyRTg3TDEzNHdQSkhBVjZPd09HL2wwUmdwSTFiYnN3?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a35e8b-18b1-487a-0309-08dd52515362
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 08:25:40.2296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DH5BSB8FDDSDOXPPfcFb5knViIZCkbaD26QrcU+qMk1gPCYIhUMgRO5c5IMOltYzdEM5ofwiIj5MtIvv4tIZizHqKw3OCWlblzTqMdAiXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6280
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

Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on pią [2025-lut-21 11:27:21 +0530]:
> When both PF and VF devices are enabled on the host, they
> resume simultaneously during system resume.
> 
> However, the PF must finish provisioning the VF before any
> VFs can successfully resume.
> 
> Establish a parent-child device link between the PF and VF
> devices to ensure the correct order of resumption.
> 
> v2:
> - Added a helper function to get VF pci_dev.
> - Updated xe_sriov_notice() to xe_sriov_warn() if vf pci_dev
>   is not found.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 44 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_sriov.h |  6 +++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index aaceee748287..6d2e87d1c6ba 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -62,6 +62,48 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>  			xe_gt_sriov_pf_control_trigger_flr(gt, n);
>  }
>  

> +struct pci_dev *xe_pci_pf_get_vf_dev(struct pci_dev *pdev, unsigned int vf_id)

Perhaps it would be good to add a doc to this function.
IMO, in general, it is good practice to add a doc to functions that we make available
outside the source file.
> +{
> +	/* caller must use pci_dev_put() */
> +	return pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
> +			pdev->bus->number,
> +			pci_iov_virtfn_devfn(pdev, vf_id));
> +}
> +
> +static void pf_link_vfs(struct xe_device *xe, int num_vfs)
> +{
> +	struct pci_dev *pdev_pf = to_pci_dev(xe->drm.dev);
> +	struct device_link *link;
> +	struct pci_dev *pdev_vf;
> +	unsigned int n;
> +
> +	for (n = 1; n <= num_vfs; n++) {
> +		pdev_vf = xe_pci_pf_get_vf_dev(pdev_pf, n - 1);
> +
> +		if (!pdev_vf) {
> +			xe_sriov_warn(xe, "Can't link PF and VF%d due to missing pci dev..\n", n);
NIT: I would changed a bit a log: "Cannot link PF and VF%d due to missing VF PCI dev\n" 
> +			continue;
> +		}
> +
> +		/*
> +		 * When both PF and VF devices are enabled on the host, during system
> +		 * resume they are resuming in parallel.
> +		 *
> +		 * But PF has to complete the provision of VF first to allow any VFs to
> +		 * successfully resume.
> +		 *
> +		 * Create a parent-child device link between PF and VF devices that will
> +		 * enforce correct resume order.
> +		 */
> +		link = device_link_add(&pdev_vf->dev, &pdev_pf->dev,
> +				       DL_FLAG_AUTOREMOVE_CONSUMER);
> +		if (!link)
> +			xe_sriov_notice(xe, "Failed linking PF and VF%u\n", n);
> +
> +		pci_dev_put(pdev_vf);
> +	}
> +}
> +
>  static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -92,6 +134,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	if (err < 0)
>  		goto failed;
>  
> +	pf_link_vfs(xe, num_vfs);
> +
>  	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
>  		      num_vfs, total_vfs, str_plural(total_vfs));
>  	return num_vfs;
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
> index c76dd0d90495..f66b68a25b20 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
> @@ -10,11 +10,17 @@ struct pci_dev;
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
> +struct pci_dev *xe_pci_pf_get_vf_dev(struct pci_dev *pdev, unsigned int vf_id);
>  #else
>  static inline int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>  {
>  	return 0;
>  }
> +
> +static inline struct pci_dev *xe_pci_pf_get_vf_dev(struct pci_dev *pdev, unsigned int vf_id)
> +{
> +	return NULL;
> +}
>  #endif

Other than that, it's okay for me:
Reviewed-by: Piotr Piorkowski <piotr.piorkowski@intel.com>
>  
>  #endif
> -- 
> 2.35.3
> 

-- 
