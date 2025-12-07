Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2F1D2CE17
	for <intel-xe@archiver.kernel.org>; Sun,  7 Dec 2025 22:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FE810E373;
	Sun,  7 Dec 2025 22:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJs9jf3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5714310E373
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Dec 2025 22:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765145009; x=1796681009;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=z06e4BO69tQOgLG5/XOocM0r23P0bWtuuvAWjEGjBEc=;
 b=BJs9jf3Db54YweftGSgx4Gdm+VteJC77tHeYAzF1kwkZB93oAZsGFUsu
 LAZkZ6XstbhOfRHWssICWAl9gkCcmpd2mvxw+/FSiDx/WQlxCvEBO3khP
 ZjaAhDrI+Nd8bZxrjwzQAKIbHt6N+XEGsZgppLWIYoKKjVaGM65DMitdd
 M0x2u2TCjLD5vwhLX1Y5cMe4Kg2wBSK4Nyi6IA5C0v6q7vpYByBO76e8d
 VjPtM3Buj4UDDtnNxJIkEXKWEF1yv+eTi2jgyTBS3jwOtSeLKEwSfk8jg
 /apA3c7J//ndP9lNAMbPjR3kwQrOSp4LjoCckRnLTb4WYtE8+fT7BK8n9 w==;
X-CSE-ConnectionGUID: XbvvYC/oRUKqb9MCqYMHgw==
X-CSE-MsgGUID: WiLe+ZsPRaSHwLE34qt0Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66095882"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; d="scan'208";a="66095882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 14:03:28 -0800
X-CSE-ConnectionGUID: 3HmUQJf/R4GNnj4vtAfntw==
X-CSE-MsgGUID: oj/SRWagRA+Xx9dtI4kAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; d="scan'208";a="226448291"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 14:03:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 14:03:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 7 Dec 2025 14:03:26 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 14:03:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGCnpFlflZ4oT0RogWGHrLcr8eKMNhjyuGlQSvg4gBYdZbTTBQ/sn6Gh/avGIaZHe3ujiFFrjwWA5D5h9uYTOqmhj7No1KEEBXWWkFfwZqyNJvo1cjV7GAQfXMG+TE1z8QY67QpErG32O2FhazlUVD/RuvXOk0qqkir2e2QBrlfUBU3ju7xNPstHSZsX8Ibz69M7mC4Aw6EkIadgL/qap1EcTRPNMSO7dIvMFSoGPP6GUJzTaugahSoUC7aiOXC2vhWWlsAtcezuVoL0MNwMJzn2utojpARpE2/ylYwfqVs7777jkodhUBguyTfA7hXhmLps6cH7L6yWshCWMm8fog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOWFZU94jwT4TpRsfdXQoWZFP988OJqAte9ezrTNiHs=;
 b=vJYwbqErDbpY9nx0ec9e701LfMe5ddqgbhiTza0Cq0d0Sz+12Gnd9Dz3xBJ8GKGzoqHD8wULPhWg+aChJXTE2xmnkaKrkzg3DUUZfPppfUoQU7BxW/PT0pi8G2wIe3nljbHL1Lyg/eGLt2m9AAMy6PgGkjMQXavuJ86VyMihKyUU79AswkQ5R4B3w6QEcew0yOqQXXUlHFMA143UD3VO2qd46Qk7P+kfeZ8HZAvfBqgIdYBMs5vcS9kXy+qKRS3KXk6EBm6F1ABz6gtYtKn3Tj1aOpPNFgxgVNaBoTYhoh4XNmXuXeYJoE99UuKuK/wn/buzu774F2CPmhiR8b4dJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Sun, 7 Dec
 2025 22:03:24 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Sun, 7 Dec 2025
 22:03:24 +0000
Message-ID: <ba986347-f542-49f0-a4f5-796e23933969@intel.com>
Date: Sun, 7 Dec 2025 23:03:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] drm/xe/sriov: Add handling for MLRC adverse
 event threshold
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-18-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251206230356.3600292-18-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0095.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW5PR11MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 53054f08-6264-4d19-2ddd-08de35dc7142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUtURGZ5S0RlN2gyVnhJZmt3c3FCS2ZHY2hveVQ5OUpyVTdCTzVGQkUxdGts?=
 =?utf-8?B?aTd6T3JjMW1JMVgxZUZiVVlyTDkyVkw3TnIzMzhKNUxwei9WbUlqZ09XOFVz?=
 =?utf-8?B?L0lBcURsNURkVG5ha25pNFNTM0t0K2Q3VFZyVU5ldExUd09RNTl5ZWpOdSsz?=
 =?utf-8?B?ZzA4c29jQkJpb3lHaHlxUmtJdk02TW5QT3FrM3VHUjllL1VNVDA0ek9qZ1Js?=
 =?utf-8?B?dTVnQkR3ZDM4Y202emowTGxCVVplNmhQYTE5Z0hUSnl0dzhQWVE0cDJRQjhK?=
 =?utf-8?B?blhzVS9wS3hXSU5zTkpvTFBxM2RXdmRtcUhZalNPbGd5d3UxSi9ydDZGYkRr?=
 =?utf-8?B?dUVIQkhOdjVUTVQ4L2FBUW9LdUNNQ091dk1JUEFvSmFzaGlZOG12S3ZKSlpE?=
 =?utf-8?B?WXJ6V0gzNkZ0alQ1Qm1kTm8rZ2FuZFdjOXJBdGRLc0lCWGU2Zmg0Y2xtRWxh?=
 =?utf-8?B?OHAwMFJMckdwNWU0Njh0VEhxYUFVRnhQQ3pjT1kzWm5BU2wvb1lrS3VtME9v?=
 =?utf-8?B?a3lVTHczM2tTcmNWUG5lemdJS2VVcTB3NSsxMlNWVW1rTXJmREtqSGNTRmdl?=
 =?utf-8?B?Zk1IWE9TUlYwUndubmhVQ05mNllyYTc0VWxZb2RIZkhhSkpSdkdBUDBvVTVO?=
 =?utf-8?B?TGtROXFZdXROb3h2dGtwamRmSk9rNm9mbEl1emdBWE5Dd052ZElNKzlxSE1R?=
 =?utf-8?B?RXkwSGt5RzlGRWlRcGF3eU9XYXdveUQ1SHl0ZU5ZazlLbVFFT0JFaGxETFZJ?=
 =?utf-8?B?NGlZWE5QenFlVVJTNkpWUFlZWm1MMGZXTTh1WlIwMGpleEcxUjVGQ2E1aGpj?=
 =?utf-8?B?MlJ0NzJ2SE9wN1pQL0JXdklhY2UzMFIvR0RpdjhwekFVUDVWOW1GRFpBTUox?=
 =?utf-8?B?UzkyN2V2dmcwcjRZeWhVNEVENVJZeDYzQ2J5RStDVWlDb2k3enNwVWY5K0Ix?=
 =?utf-8?B?U200a3haQWNhR2hxbW9MZFBHQVBaeUVMRlZGdkxyQWgrZjIvNHBITHhkSGsz?=
 =?utf-8?B?K0pzZjg2SzdZTkZHNStmYU1aWWZiQ1dpQ0ZrbFpML29IVmw2VU4vWW5xZHB4?=
 =?utf-8?B?WWpaV0tBcGhaVUZXb1c3ZnI4Sk02cUhXbHo1M3hJS3VwTVA1dTlXRm5uWTY1?=
 =?utf-8?B?TmM5bDYxNGwvZnFqS2NPTUIwQksrd1FrUWVmNUh0LzdFSUxaUlpscGRxczl3?=
 =?utf-8?B?ZnoycCt0ZXNFWU1FVzBzM1RZOUIzK1BMZ3JJM0FiSzN4VUw0cHRWemZkQ0dj?=
 =?utf-8?B?UnRrOGw1ZjJxSU13OXVYSnVaZGQ4RFo2TXdYVTZnd3dSZWZ5RTdXWEMxOHlG?=
 =?utf-8?B?RXJrUWx5QmVhTTV6RFFIVkxvWDAraUxCNXQyZTVHV1VXY2w1K3FjZnNaU0h4?=
 =?utf-8?B?SDZ6NGlnbW9aVG5YNUF5VzhiRjVkVmRhUU1kR2o1S1IxT3dEZzJyQ3ZHZWFR?=
 =?utf-8?B?cTM5K3dNaElndXhZZlVSK21meWZMOXhKZlZjdFVYaFhEMzJmL3puOUUzanU4?=
 =?utf-8?B?Z0RaOTN5cEEyM0Jzcy9jMjFmbm13dnA0ZWNzQ3VYZllDNnR3T05JV0ZWaEFi?=
 =?utf-8?B?Nmx0QlVKU04zaUJ4bkVLOTl3WVl1TlVVeFlNWGNjQUJvNkhxNytaTitRTU5K?=
 =?utf-8?B?QmthMzB1RmE3cHRoVXVWWGNadnE4S0U0QlRxSEJEakJUR3lYVnpyRXh3ZnI2?=
 =?utf-8?B?UWRYWTlWbk1NK1RqbFpqbGdwUXZ1VzRiQkNEUkFrK2VVeHVBQmhZMFd2WFIw?=
 =?utf-8?B?NENlNEoxNWhLek1MVFlMQzNJTnZsS1kra3JFY1lCaWNVT3FOVGtqRUM0aVFE?=
 =?utf-8?B?V1pUT25PTWxSTTJleEoyZTVvVStOd3VQMnhGS0hNcFhMbitiTTBoU0FrTnUz?=
 =?utf-8?B?YmFMczd6WFhNQVk5OXEwMGhFNWoxZ0lNamNnbzhlN0pwSGNSdHNiWFFjWnpD?=
 =?utf-8?Q?1XgM8opSFg8bTJCQWIiL9DP6yIMNeFBk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3N3M3lCd3JpQXJWN3VRNkp2SWxwNzVKSmFHd2cvNWl1YWpONmIwRlR6enov?=
 =?utf-8?B?cGN1SWlOeC9QSXlSY3psUktOS2hJZXJZVW9tTFBZa1p3T0hjVnZYMjliNEZ3?=
 =?utf-8?B?Ky94OG5HaHlWN3h1YVlHeGtta0w0eHY0YjZEUXpoY1hpeDVwZG4xc3NXS2Rk?=
 =?utf-8?B?c2lneXVyeU5tWFJBYnhUbWZ5THdDMWxLVTlTcnR3eE90Ri9RZ2lkVlFheWU0?=
 =?utf-8?B?RHBuUkdEU1BUMTlQckpVN0JCN2xPWEJVVkFKTlV1MkFTL0RkT0g3eHFKRWVJ?=
 =?utf-8?B?V3hkYzlpWGtSZm9YWU8zNElUM09rUGZGSFFQTGxsckRPaHdnSURQODVPbDRw?=
 =?utf-8?B?TlNjUnBsNHZKbjY2M3RZRUZHY2M3NmRtbEVvUmlFWDJRYkNBTmI0THJtMitx?=
 =?utf-8?B?cytGWm1EdFduZHVoV3VXQzFVUCtDRzliNUpEb09GeFc1d256cWxlcnpuclUr?=
 =?utf-8?B?cWFtdTJzOXZidkxWaXc0amp2clBMRDR3NzFIbmtrVThLSzlXTXBDQUtVRktz?=
 =?utf-8?B?Tk1oSnFuS1NVUnFuTVQ2OU9jd1FWeU5RN0JreWl4em5ISlU1QnFDQVJ4QWRY?=
 =?utf-8?B?MXZTNVdlbWMxVWVlK0RnSElnejBrcmxvUzdTSnBnMERuUkxveHV1WXJpelNO?=
 =?utf-8?B?c2IrN05BbzB5RVBESW1tY3dKbm1xZnZkU1pBWmY0RlNvaU1PLy80L2lYWW04?=
 =?utf-8?B?UmllOExJLzBGY1k3MDhYQWFUZGdjTnBJYlRGRzkrczFTd1VGRms0SzdXWm9m?=
 =?utf-8?B?RXZWb2d3eDFrZXhnU2NEeDE4L1dhR1c2MWFOU3liK291L0VEeGt0bnArQnQ4?=
 =?utf-8?B?dHR2T04xZlBpYjhMQkNDRWdlby9tZkhtRjY1V0U4VTZucE41czhkRk5tamRM?=
 =?utf-8?B?Z1dwMUE1cnFYaFpLVFN6Mml5NVkvNmhVbE1SNFVCVnZDVnUrM2g3a1RpSVZC?=
 =?utf-8?B?eEM3dW1WMGZIbFBHTVNPN3YzVXZlY3FsaFlVZFNwdlRxS241OUtEUllGZ3l4?=
 =?utf-8?B?TTUyTjQ4OTVIbWVmS2U0WmVZLzRlWUw1SFBVeU9CQWM1dzZTc2xvM2pXUXFZ?=
 =?utf-8?B?cEt5NldnTnZVRUlFMXZaN1Z4M0s2eDBLMlpxTHgzY3F5OVlDL2RkWGFraGhw?=
 =?utf-8?B?cFQrU3FWU2JRVjJ1VkQ0YjZJdDJrcU9URVZOMWo3b3NJWEphblF6Umc4SW8y?=
 =?utf-8?B?TW1PWDl1djVVYUFzSzA0QTFBTE5vZDZxdnFpM09QdERxRW1WRFIwN25HSE9o?=
 =?utf-8?B?dHJJTnBtN2ZvZUYrc0MrbzR4T1UrVUFKTzMycm9XM2JIQ21OcXU0djFJMUpo?=
 =?utf-8?B?TWthMmJ1NG9wdXFRS2lNSHhFM3BpYXhSMVJyMlA0Lzc0c0N2aFFuaFdINEJs?=
 =?utf-8?B?RnpKV1JmRk1pdnpzVmk4UzNsRjQzNGpoRkg0V3lzUmxjWUVSNy94TndDalhj?=
 =?utf-8?B?YW5CZFFTTWZ1TVBmZWhwZFNQNVZ1ay9sQnZtUjVjMnozMUlPODJyTU1zeFo5?=
 =?utf-8?B?VnRBeE1qYitlTEYyQnZzZ1VrU012aGpiOGtHbUxRNGxsb1Fpc1krYjBzYlpw?=
 =?utf-8?B?ZWJxZU5QVlhPR3hqMkRpREpZbW1mRTdiNlZGb21DSDB4N3Z0Y0Y2Y3ZtWFM4?=
 =?utf-8?B?a3pQOEJaMHJNdjhrK2dvSUdicTIrZlh2RE5ndnB2dlJaa2xxN0d5cGRFOVIw?=
 =?utf-8?B?dHMzc1ZvM2NxRFQwemZGMi9kTjJnRERBOUR5Mmp4L01KWG9yVGJ0cDNZcDVJ?=
 =?utf-8?B?d2J3emtPdFUxU0RVbW94TnRScDRORWZHUlJDUjNjclg4dGpueW9tYTlXN3N4?=
 =?utf-8?B?SkVBRlBDSS9qVEI1V1krUG5COTdRcXZWRkhRSExrdVRJalZwMWhFV3JwdDdC?=
 =?utf-8?B?eWIrbmNIOG5CTEJrNkFDR2wyaENjd0VCV1YwUSt6Mm1kRktDdXY0b1I3SDIr?=
 =?utf-8?B?bVNhMllRWnNDTUxvaFJpVGU5clVyOUkrOUExbUk1elYwRTlURDJ2S0x0VkN3?=
 =?utf-8?B?M3FoU1g1dzQyQlVGZDg5c3ljcm0xRjhVNmNENnZnUGpXNVUwL0JpYmNXOGVq?=
 =?utf-8?B?V200L0pEUWlVL045TGFEVmhyWC9SMENQT1ZhN05oNEZpV0VkUEtXL1VMN1gx?=
 =?utf-8?B?SWh3aWs0czg3M044T1N6RTJEUGxkQ2lub0tTK1BBa3Z2cVNNc3EyNWROYVdI?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53054f08-6264-4d19-2ddd-08de35dc7142
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2025 22:03:24.5196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WY5J4Qsu+TjWQGaEjw0mjQH9/JmYcYy/MZ/wdqXUf328zmeG87tzZ5Yxg9h1NrNqsAaINe1KguTYo1ZG4sTTl2czo2BZ8+HVXdT2eKnQuLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
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



On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
> Since it is illegal to register a MLRC context when scheduler groups are
> enabled, the GuC consider the VF doing so as an adverse event. Like for
> other adverse event, there is a threshold for how many times the event
> can happen before the GuC throws an error, which we need to add support
> for.
> 
> Since this is the first threshold that we have that has a minimum GuC
> version requirement, support for checking that has been added to the
> generic threshold handling. As part of it, some of the version code has
> been moved to its own file and with the occasion some SRIOV
> documentation has been added.
> 
> v2: split from previous patch, add GuC version checking
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 +++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++++----
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 +++--
>  drivers/gpu/drm/xe/xe_guc.h                   |  7 +---
>  .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 18 +++++-----
>  drivers/gpu/drm/xe/xe_guc_version.h           | 36 +++++++++++++++++++
>  6 files changed, 74 insertions(+), 24 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_version.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index edb0546fb163..30a051a0b4ee 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -376,6 +376,12 @@ enum  {
>   *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>   *      :2: HIGH = schedule VF in the next time-slice after current active
>   *          time-slice completes if it has active work
> + *
> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
> + *      Given that multi-LRC contexts are incompatible with SRIOV scheduler
> + *      groups and cause the latter to be turned off when registered with the
> + *      GuC, this config allows the PF to set a threshold for multi-LRC context
> + *      registrations by VFs to monitor their behavior.
>   */
>  
>  #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
> @@ -434,6 +440,9 @@ enum  {
>  #define   GUC_SCHED_PRIORITY_NORMAL		1u
>  #define   GUC_SCHED_PRIORITY_HIGH		2u
>  
> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
> +
>  /*
>   * Workaround keys:
>   */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 59c5c6b4d994..dda671d05b89 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -269,7 +269,8 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>  }
>  
>  /* Return: number of configuration dwords written */
> -static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
> +static u32 encode_config(struct xe_gt *gt, u32 *cfg,
> +			 const struct xe_gt_sriov_config *config, bool details)
>  {
>  	u32 n = 0;
>  
> @@ -303,9 +304,11 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>  	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
>  	cfg[n++] = config->preempt_timeout;
>  
> -#define encode_threshold_config(TAG, ...) ({					\
> -	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> -	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
> +#define encode_threshold_config(TAG, NAME, MIN_GUC_VER) ({				\
> +	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER) {		\
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> +		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
> +	}										\
>  });
>  
>  	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
> @@ -328,7 +331,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>  		return -ENOBUFS;
>  
>  	cfg = xe_guc_buf_cpu_ptr(buf);
> -	num_dwords = encode_config(cfg, config, true);
> +	num_dwords = encode_config(gt, cfg, config, true);
>  	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>  
>  	if (xe_gt_is_media_type(gt)) {
> @@ -2518,7 +2521,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
>  			ret = -ENOBUFS;
>  		} else {
>  			config = pf_pick_vf_config(gt, vfid);
> -			ret = encode_config(buf, config, false) * sizeof(u32);
> +			ret = encode_config(gt, buf, config, false) * sizeof(u32);
>  		}
>  	}
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> @@ -2551,9 +2554,11 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
>  		return pf_provision_preempt_timeout(gt, vfid, value[0]);
>  
>  	/* auto-generate case statements */
> -#define define_threshold_key_to_provision_case(TAG, ...)				\
> +#define define_threshold_key_to_provision_case(TAG, NAME, MIN_GUC_VER)			\
>  	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
>  		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
> +		if (MIN_GUC_VER && GUC_FIRMWARE_VER(&gt->uc.guc) < MIN_GUC_VER)		\
> +			return -ENOKEY;							\
>  		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
>  			return -EBADMSG;						\
>  		return pf_provision_threshold(gt, vfid,					\
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 0fd863609848..5123ff1fb116 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -21,6 +21,7 @@
>  #include "xe_gt_sriov_pf_monitor.h"
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_pf_service.h"
> +#include "xe_guc.h"
>  #include "xe_pm.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_provision.h"
> @@ -301,9 +302,11 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
>  				   &sched_priority_fops);
>  
>  	/* register all threshold attributes */
> -#define register_threshold_attribute(TAG, NAME, ...) \
> -	debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
> -				   &NAME##_fops);
> +#define register_threshold_attribute(TAG, NAME, MIN_GUC_VER) ({				\
> +	if (!MIN_GUC_VER || GUC_FIRMWARE_VER(&gt->uc.guc) >= MIN_GUC_VER)		\
> +		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
> +					   &NAME##_fops);				\
> +});
>  	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
>  #undef register_threshold_attribute
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index fdb08658d05a..9028718189ed 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -8,15 +8,10 @@
>  
>  #include "xe_gt.h"
>  #include "xe_guc_types.h"
> +#include "xe_guc_version.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_macros.h"
>  
> -/*
> - * GuC version number components are defined to be only 8-bit size,
> - * so converting to a 32bit 8.8.8 integer allows simple (and safe)
> - * numerical comparisons.
> - */
> -#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>  #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)

I guess this macro can also be moved

>  #define GUC_SUBMIT_VER(guc) \
>  	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> index 0a028c94756d..f7ed32244c6b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GUC_KLV_THRESHOLDS_SET_TYPES_H_
>  
>  #include "xe_args.h"
> +#include "xe_guc_version.h"
>  
>  /**
>   * MAKE_XE_GUC_KLV_THRESHOLDS_SET - Generate various GuC thresholds definitions.
> @@ -23,15 +24,16 @@
>   * with the &TAG, that corresponds to the GuC threshold KLV key name defined by
>   * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
>   *
> - *	define(TAG, NAME)
> + *	define(TAG, NAME, MIN_GUC_VER)
>   */
> -#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
> -	define(CAT_ERR, cat_error_count)		\
> -	define(ENGINE_RESET, engine_reset_count)	\
> -	define(PAGE_FAULT, page_fault_count)		\
> -	define(H2G_STORM, guc_time_us)			\
> -	define(IRQ_STORM, irq_time_us)			\
> -	define(DOORBELL_STORM, doorbell_time_us)	\
> +#define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)					\
> +	define(CAT_ERR, cat_error_count, 0)					\
> +	define(ENGINE_RESET, engine_reset_count, 0)				\
> +	define(PAGE_FAULT, page_fault_count, 0)					\
> +	define(H2G_STORM, guc_time_us, 0)					\
> +	define(IRQ_STORM, irq_time_us, 0)					\
> +	define(DOORBELL_STORM, doorbell_time_us, 0)				\
> +	define(MULTI_LRC_COUNT, multi_lrc_count, MAKE_GUC_VER(70, 53, 0))	\
>  	/* end */
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_version.h b/drivers/gpu/drm/xe/xe_guc_version.h
> new file mode 100644

introduction of this new ver.h file is self-contained so maybe it should be in its own patch?

> index 000000000000..e6f80abd2f05
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_version.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_VERSION_H_
> +#define _XE_GUC_VERSION_H_
> +
> +/*

this should be regular kernel-doc

> + * GuC version number components are defined to be only 8-bit size,
> + * so converting to a 32bit 8.8.8 integer allows simple (and safe)
> + * numerical comparisons.
> + */
> +#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
> +
> +/**
> + * DOC: SRIOV-changes

	DOC: SR-IOV Changes

> + *
> + * We record SRIOV-specific changes here as those need to be tracked carefully.
> + *

what about 1.23.0 (CCS) ?

> + * GuC 70.53.0 (VF interface 1.26.0):
> + *
> + * Added support for EGS. See:

probably we need extra line here to render correctly

> + *  * GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG
> + *  * GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT
> + *
> + * GuC 70.54.0 (VF interface 1.27.0):
> + *
> + * Updated VF migration support. See RESFIX actions

maybe we can list those actions:

	* VF2GUC_RESFIX_START
	* VF2GUC_RESFIX_DONE

> + *
> + * GuC 70.55.1 (VF interface 1.28.1):
> + *
> + * Fixes for EGS.
> + */
> +
> +#endif

