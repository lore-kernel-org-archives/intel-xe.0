Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63934C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 23:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBB910E396;
	Tue, 15 Apr 2025 23:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvbjmyEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DC110E396
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 23:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744758716; x=1776294716;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ct4BP0ZNm2te3Fsuuxiw+GrIKO4c+lIeOdC9PEizwFM=;
 b=ZvbjmyEutAQo9tC7HUedgCGZ/gB+1AlW+uGqMvqLYw4AAaliZGgJ+ku3
 jSiQF2kc2C9IgiK/P6cu6RbZlOa5fDOWNyKRQ2cjns/bwlrf2kRDCPc7+
 zRiJhgg2+agaQ1+sbthH1xFfMy6W7WyJu1qpM236hBRul1v13qZx/M97H
 nRQ2412r9zc78wrfVZS7X2+0u1AOoBCqXbgXtpm2FjZac/USEvT6CKMCN
 PJfpI5QrOYjyOLjIQewBEbKH8IaEYPABkrB5yaqEXw2lLGwNd4Pbj7TN4
 BtxA2S5vdNYWH9rZqNNleJBbFA4kC3jMKdoIvohRV0pa2AghXEGD+iyOo Q==;
X-CSE-ConnectionGUID: NddAld1/TQCWJoqk5guFRA==
X-CSE-MsgGUID: BQF5j/WmRm+Rg9RL2/APYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48986992"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="48986992"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 16:11:55 -0700
X-CSE-ConnectionGUID: 5g/Hb4n9TXOVwh/L2RFiVQ==
X-CSE-MsgGUID: M582Dm3gQJa8EJWl5L5F0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="135245142"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 16:11:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 16:11:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 16:11:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 16:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VynwH8Puu/pm6jEhy3NAxYiXU4O7z8jL04ALX6ClfXrI4JzZbbbPF+hc+D8C2EnIK/SnkG+zxNCxVfYFqKt55W3jgwQIXUqvI7WBvqOvyVwzmHHyNl9kVuwbNZ+6s0W9zd+IUmsOvwq+5WOt4M4kUhOgdvictL+riFxjd1dHXrBZZib8uNwdeWErMlkqICyp03VOGCLVy8kivP9u1y5n867Mu+B0chhvFVJMeAs3l6APKOrDavpRnzQrZpgLHRmiwlG4aT4zxgWFHfD8GY78PPB1NM+U+z9jeU+o17K0FmEXRT0OqHI1SJ/RNCCFTZiqO115MAYni7kIUue93tA90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yp24R3qUTcIVag2MdG/5C74nhh/NwGg9Yb62Mf+nPpc=;
 b=KNZUDbwEwv10OeP8plE7W+TXGlNaCwOsFqgO7HN7y7zBTpzdYH7z00O7qlECOmjjkeRynupZB8kXCQOx6GYEQ+ncLpwgbLrrsokApV1ME3t51H1mMlH+lgd6sBElF40v4tNyjWvdLmWgbvLleewOlZpNWdu/l6mPCzQOj1rCFXoq/qLE8R1DmkfHsV/I5RRAilfxMjH/5o1eN5yNBCepZy2Jg7wzol+ffmRtXqjhonRzJBcq3eUT05FzC7Gn9oYEyXyIEn19erU0pe01MjTez8KTmDf6chr4vBHGt1G10NUNdmjhM0ISotmIwFPnX9rAZjEbOkIDw9Cn4SxkHb6OMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 23:11:35 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8606.033; Tue, 15 Apr 2025
 23:11:35 +0000
Message-ID: <96912d27-6543-43d2-96a1-96747009de2b@intel.com>
Date: Tue, 15 Apr 2025 16:11:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pxp: do not queue unneeded terminations from
 debugfs
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250415224845.1283199-1-daniele.ceraolospurio@intel.com>
 <6264db83-0cec-484e-b8df-719b704fa9d3@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <6264db83-0cec-484e-b8df-719b704fa9d3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:303:b9::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 6871ab55-6afb-4023-7f44-08dd7c72ddc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWRZVFU4ZzFuT0dXc0YxZERxSytMRUNlTFRPbjJ1STZEc2t1RzZqZldOVnVE?=
 =?utf-8?B?V3JuVHlERzJMQUtZNDdNY0RWWjd3SGlWbjhnU0xXRVJ0WEVlVnlnaVlOYTlL?=
 =?utf-8?B?KzRyWGVZTHdPQktnbkZXQmxxTmY3b3hZVXNwd3FmN3BaRzNaOEcrRE5VRVda?=
 =?utf-8?B?STlVUTJyK2J1QzkrU0kvenRMb1JzeGJmSG5QNmpOV1h3WlRsRGNqck40RzJ5?=
 =?utf-8?B?d1RGNHBwS3ZWK2EyWFkvVWZWeHVKRWZqZkJlZC9ZM2lrTEo3bloyeTM5SEda?=
 =?utf-8?B?K3F1T21nVUVuTUthd1YwUU5XQm5MQnNsMjlUZ01nRElBWXhiZklXcHFod1ND?=
 =?utf-8?B?NVQ4WFhvLzExSW1melBBMWx6NFJmQkNGK0FVeTZPTmhLWHhhMHdxQXdrMm9W?=
 =?utf-8?B?K2UzY2JTbkFRWUZxU01oOGxqVFltbWNFUHBIaXZyWGRvUjZaOG0yaDRKQlov?=
 =?utf-8?B?Q1dZZVd6cGtnY29LdWJSbG5xUGY5ZU92aGpvazhtMXZNN25xOE4vUGdsY05r?=
 =?utf-8?B?dEVQYnJYYUhiSmhwYmJWajhhOXhCY3ppSzZoVytXSjF0U2dYY0dRb1pzKzhO?=
 =?utf-8?B?R0txOC9WcGVsM0pLRndEbTRydUsrNGFmblV2aFhoRi9YalhFRE5PNUtOYWNG?=
 =?utf-8?B?K05RSDhuTkFlUFZYOGJXYzA4UzE5RytPRERzeU9TQk41R1ZCQWQrRURCOFFB?=
 =?utf-8?B?Wk03QzIzNDFZOTZrSitUNWhaUlBZMjc2RHhvaStpL1YzcXRaM3E4V2ZJRHZj?=
 =?utf-8?B?Ukp4bHhZeU9CQjJSWHNQOVFlY2I2R0xrME4wVmIyUlIybzg3Q1pmTUFvaFFW?=
 =?utf-8?B?M2MweENaQTR3ZU9EOEYxbDV4MkdRM2F5N0lKUUhyZTdjSmdoVjhpQytKNE1P?=
 =?utf-8?B?YUFHdmZuRWtZTTFFSEljODBINjBRSXVQZVl1c09vNXpWcERlSXNjekZpTjFs?=
 =?utf-8?B?VzJVY1FXQ1ZVbG4xbGMvQ21FeWxlZzNzM2JacTU1QXFsNmdDK0lCTDVQVVZU?=
 =?utf-8?B?bTd2Q0N1dWg5L1Vick4yR0U4cTlYTERxV20yNnJ2bHRJc1BBeFRvRFByclhU?=
 =?utf-8?B?WnFZSjZxOWdYSHk3ZmNqYXlsQlZFM2s4N1YrTVdyV2k4em1qY0ZPRkN5M2V1?=
 =?utf-8?B?MWRqcUlDbjE4TmRnNEtvVXpKaXlsL1BIWUVyRVJFeFF1Wnc2UEJVa2hRVktZ?=
 =?utf-8?B?SStncVZMeURnYjJtNmM1NE9tKzIxSDIxdXFmYkVBVXFOWkJ3T1MvV1BtM2V0?=
 =?utf-8?B?M3JpMUl5aVBoQWV3YTdSL3hYMWVoeG1TWlpveG9sOTBCSzdVWU15a3RNcXVK?=
 =?utf-8?B?THpkWm1jc253dFpVMjlnSnM3Y0tVc21BbG1DNW1pVUo1VHI3ankyV25Oek83?=
 =?utf-8?B?dTR4dFlWbUFRcXVWM0E2R0hGbmhnV1ByOEV4OWNIV0wxZTBuZmdGNFl3eEJh?=
 =?utf-8?B?SVVmbzZ1SXdDRUxiOHliOGNLSTdzMGhFUGxKcXRDT3hYa3JKM0RHZlU2TXlM?=
 =?utf-8?B?RVNkbWRjb2RtcHEwMTNRVFZOV0RmaFEvSjdKTGFQY25NSXNQL0oybzAvQzB6?=
 =?utf-8?B?TmdVS0FkVkliR1dsYlNNK0tHNS82ODVJYmhXT3JiYnhOTEZjdytNQTRvV1VO?=
 =?utf-8?B?ZEV6UTJhVEZndXJVRXFqSU1ISzJ4Zm9mTzBlYlBjMWtvZ1FDa01yOHNCUDJL?=
 =?utf-8?B?TVlScnF3Z3BoVVhFdDZEckpNWHl2ZDB3a1l4U2grZlVVdjlEL2Y5SmFEWVgx?=
 =?utf-8?B?d2g5cFk2NDdnanQ2NGYwOXhyYjNsTFBsekJBdlVLcU0wOHU3cWFXVm5xaitF?=
 =?utf-8?Q?KiwM1s4BqPBE1O4s1XwFEbIHBhvZ+l314Tixo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlA0Z204cFdhNExSV2FqSzMza0xxTXJ1eDhSUFc4N1o3cFRLakhhc09qTUxK?=
 =?utf-8?B?bnUxRGlMZlpnVGU5YXZvdzRmVTR0TGFRelVaQkk1Wlg1L3JwMmlyQ2Y1MnZS?=
 =?utf-8?B?ZlY1U3JQL0l3SE1WalRyOFA1bU50Y3N4SmtZMXRBNW1PYkg4RFRXNzQ4SXFo?=
 =?utf-8?B?WDB0MWE1M2luamJKYVhJWEZkeTdCVFhzekhkUEhSQWhlaHB5SFRaY3dXd2FC?=
 =?utf-8?B?ci8vTVBhUEY3ZGRDLzh4OFkrWVc3N1pLTncya25VTWp5MVpGbDJsNUZ5SStz?=
 =?utf-8?B?YVp1SkVCeWkyTHRPY0tPbXdJNDBmMk1IbE9hcGcwblVlRVB0SUlSQUZNd0g0?=
 =?utf-8?B?dTl1ek9LYTdhR1dTRWw0Uno5c2xDVlBTN3diM0gvaFZzeVVUc1hOZStORjJP?=
 =?utf-8?B?YWo4NjBCYnRJNVNmVTdaN0k1bTM5TS9GUTVMaUpFWmlYN3V6eXprNzlHM1Uz?=
 =?utf-8?B?V3paMkU3QzcyWVZ2S25SMy9iVFpSWGJUNE5rLzdqdkJFY0FTS3hqZG5QUUZt?=
 =?utf-8?B?WkFtTDVtSmxaUklUZ1ZRMmt5Mk1XZ3VneVEvYm9sN2o1dHlpVDE0am1rR1lW?=
 =?utf-8?B?MGFpcVZIcGV4dHlqYUw0OEFSaitxWGFyZDN1SFpCZEhEcUIxMC84RjlsUEp1?=
 =?utf-8?B?UTRFOGdVbTVNUUlzdFB5c0VVK1BSUGI1bk1EV2dydytXYUladUkzTTMyV2RZ?=
 =?utf-8?B?OEg0bFJzdDVBK1hUUWs4OG8wSFRTQ3J6K1lZUEM1TFh4aWwrK2lBc21qZzhn?=
 =?utf-8?B?QWg3RnhhME1PQXlQL2M2ckNEaUZKQlJnTTdKN3p5Z1hHYis0dzZ1WnlVNHpQ?=
 =?utf-8?B?K1Q2aEQyc3BaMFMzWTJYbkJaZURJa3JkeHdEYXR4MnYwUmNLdm1xSXZzLzRD?=
 =?utf-8?B?blpGa3FoQVNlcFRSQS9jclJwaXI1RVdJWC9Qd1Q3aHhnQU5ZUG5FeDZSS1Rw?=
 =?utf-8?B?a3VoOTZENkNYalJuOWNsZHRxM253c3E1QnFVelpEM1Y3K00xRzJMS3JVWWx4?=
 =?utf-8?B?dWtPbXFvVjlxS1Rxb2l3Nm5sRFhSL3EzVmI2NS9ncTZ6RVhFMUdaRFpyNjQ2?=
 =?utf-8?B?Sm5oTEhhL2pmQXh1Q2tiS1FsMWkxLzltVzRuVG9wUThaeWxZd201SEJNekE2?=
 =?utf-8?B?emlDVDdLU1JFem1aTzF4dzNXaXJmMFVQK1pjSlJGaGpMSjFkQnlxTlY1WFpO?=
 =?utf-8?B?TktIZ21SaDZtQnRMMjRNSnYxREU0Y2NnZVR4Q0NOM0IvOFFJS0FkMVczOWtH?=
 =?utf-8?B?cXhIR2pJT1dzL2VkS1NlcVFNSSsvZkdSZWp6cVpCMDVKR2t6Z2xXdnhwZUpI?=
 =?utf-8?B?RDRhN2tlYkpSR2VyR2RrcDdNaEJwTWxKUkdOazJ3Vk5kZlVGQlRGcG9FSmVV?=
 =?utf-8?B?ODJFblNReWJRZlE4QURDcXVOUGwyald1SFpJTkJENTZBTjB1NW1aelNUM2t1?=
 =?utf-8?B?LzBpcHZkNVl0ZXV0ZndkZUI5TWNCSkJ1M2ZpbmFXS1cyNC9HNW9CUjlFV3o0?=
 =?utf-8?B?dzYxellGWWFaRHI1dkNRWEJhV3lHUEVUSEtSZk1XMUc1OSs5Wi9Hd2RRMFBI?=
 =?utf-8?B?L3FmMWc2T2pVbWl4cENXZ3dCeTRocktwMlVOSlZyVDU0RTdTWDg5MWhlMVJB?=
 =?utf-8?B?U3orMFRtV0ZuUTlaV3hMV3EyaGcxdVd2dXEyU1NqQXJzUGxCdU5RZFlWSVFI?=
 =?utf-8?B?RFhUMytqdXJBL0diYjdaSlpnd2NPUG1JbWZOUnMvOStWeFladVo3ejNHWmtm?=
 =?utf-8?B?RWlUZm05Y1dGR1ovVlVlSUJqUTFDWWZFei9qOGFiLzZkR3hYTlE0YUNadUpx?=
 =?utf-8?B?TkJoczdYK2FYTUx1dGM2QmV5RHFlc1hIa3BaUDJiUzBTRFRLTTBDNVhXenly?=
 =?utf-8?B?VHpjVVZrSE85WXZRZ1htWjNDYjJHWEkxdVdtNFlrVmMrcnVESkdaTGRHL0tN?=
 =?utf-8?B?L1o3SmZObHQzZ2cyUGlIL0s4cWhneHM2QWl0eVZDb1dlVG1NQmpLYmdDWnY3?=
 =?utf-8?B?Vm42OUY2d1V4ZG9jN3dqQWlDR2lzZFJieDQ3bUIraWt3Y05JbEwwRTJPcis4?=
 =?utf-8?B?QzZaTTNWcDhuQS81UUVDbmptUXV4U21IZkp6N2pPT2xWU3MwNlBENGUvWklG?=
 =?utf-8?B?NEo1L0VpN0I1MFAzRDZXai9RbkNBZ29pUlg5cVRVd2ZPNUwzU01NVW9KWnM0?=
 =?utf-8?Q?VyilOtyQjIdplmtF3oTMkik=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6871ab55-6afb-4023-7f44-08dd7c72ddc5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 23:11:35.0902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZXdAjhvdj64sLkL3Ur5YvywttaS09NdcdflWDMUenMf0fW+BhNg3qul3CtlxMFiSUWohzwIYP4XjJUHNvkx41F+ErmXofK5e7/0LHlKm/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
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



On 4/15/2025 4:04 PM, John Harrison wrote:
> On 4/15/2025 3:48 PM, Daniele Ceraolo Spurio wrote:
>> The PXP terminate debugfs currently unconditionally simulates a
>> termination, no matter what the HW status is. This is unneeded if PXP is
>> not in use and can cause errors if the HW init hasn't completed yet.
>> To solve these issues, we can simply limit the terminations to the cases
>> where PXP is fully initialized and in use.
>>
>> Fixes: 385a8015b214 ("drm/xe/pxp: Add PXP debugfs support")
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4749
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pxp_debugfs.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
>> index ccfbacf08efc..eb4a084103e3 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
>> @@ -66,9 +66,18 @@ static int pxp_terminate(struct seq_file *m, void 
>> *data)
>>   {
>>       struct xe_pxp *pxp = node_to_pxp(m->private);
>>       struct drm_printer p = drm_seq_file_printer(m);
>> +    int pxp_status = xe_pxp_get_readiness_status(pxp);
>>   -    if (!xe_pxp_is_enabled(pxp))
>> -        return -ENODEV;
>> +    if (pxp_status < 0)
>> +        return pxp_status; /* disabled or error occurred */
>> +    else if (!pxp_status)
>> +        return -EBUSY; /* init still in progress */
>> +
>> +    /* no need for a termination if PXP is not active */
>> +    if (pxp->status != XE_PXP_ACTIVE) {
> Having both 'pxp_status' and 'pxp->status' being testing in 
> back-to-back ifs seems unnecessarily confusing. Maybe rename 
> 'pxp_status' to 'ready'?

True, I hadn't realized they were that similar. Will wait for CI and 
then respin.

Daniele

>
> John.
>
>> +        drm_printf(&p, "PXP not active\n");
>> +        return 0;
>> +    }
>>         /* simulate a termination interrupt */
>>       spin_lock_irq(&pxp->xe->irq.lock);
>

