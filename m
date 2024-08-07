Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBF8C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 19:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9AC10E5AE;
	Wed,  7 Aug 2024 19:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdd4/c+U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8529B10E5AE
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 19:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723060414; x=1754596414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yl/8qoivwn/htsNd2NRfMNki80eihImERwH4p3rcxyo=;
 b=bdd4/c+U/hM+MG7GBWHpky0gK6vsPFWLSZOOrdXP5csNKtFJfFZSNqB6
 w/6RM6WYQ7zuSSI3UddU0p4Vb3jHwy4WhMPev+fhJ1VSZLoEwLdBHiaX4
 iR2OterZlQBc9wQ1/nxPM521tHjLtCIF0F7eSK6uBPTk40WCMBXPUbTFC
 1qBoptqw7TvHsnvw/fO/VEFoS2Fjy89dLMUFGNIpGfcpHb/VdodkmMSr+
 TS/4wzZ7OWHfIO7dcPR3BkdToZ6smq+ZIOZLj+pzmUIakzCMpRB6i0V7i
 ZXc8r1kj6PXp7zugqkdqDzcMnSvzcVHZwZbgAq3loApCgA85gpc2OVag0 g==;
X-CSE-ConnectionGUID: oDptI1KmSwGNux9XI31jng==
X-CSE-MsgGUID: tBRTF/SHQgyP+wtAu6IkdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24064967"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="24064967"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 12:53:34 -0700
X-CSE-ConnectionGUID: Dcokj3URSdOsEyYCe1YGCQ==
X-CSE-MsgGUID: FebsI7ijQUWWFxxwEdsgJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61841017"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 12:53:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 12:53:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 12:53:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 12:53:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IH9UTBKFokK9zCc2bMg9NROBgduOgNqIz3fW+TzbQnn3sG51UQusvQrIEcXSF96tF/Q5EP+zDJyKLCP2TyOpH4PnPLl7seWgCzzN8uQTeM1NAyz4dBrWjh0pbeBxL/58Ev9Bi/Jm7zUCbDSdheuuCel/esRt8ugx9UPSc+XFtLvl1h0FIm4ee8ei5vWIHsKqrIpt1ht5KwbRKn2/UYh0ks5ZlqCOmw9sczvdfOfcCecEyjHWSfawJAPFyzkGgbNO4qU0cpYwsS2+haTo23n78fT0Pd5+O9fk/wY9ZHymNZgskojeh8cHjLLx1+3gMfTVtVimSUaagM8WFeZ45HjTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2YsMNxM2yG/N4JgdLh1X6dmIcP84R1dbe5DRlkpoPY=;
 b=Ba3RR3R4YyuWTk2ScTifsC3GTWbzL+Mfx6WXdCpwBg4+YgitCiJZkkvC3OSRRhgMu1pmodUek8wX5E1CLmzt17uhk5S29DwtxDiRiOGEfOB4l2aiRCdQ/JVBdrB8+gjjvbxcWkobFQ1oPAvmUMWnCwNBPC8Ix7sDlfO6TCcFHe5gYEQBgXnMA8ClmPTlJQ70muPxoeJxiQkVyOIm9qLOrYuvhYXxRK24wPTQPlYYCYG36sEfi+9rOgZa5Uir37TQKo4RHi0C46W/YFBUES2MrlvZmfbzWoWxYIaR3jDL7HTZDEEKBSPcN5SPCbsASDjeiQBAPC2+hBH8vXnmfHHxlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ1PR11MB6250.namprd11.prod.outlook.com (2603:10b6:a03:459::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 19:53:30 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 19:53:30 +0000
Message-ID: <91c0c1f1-0e09-486a-94bc-0c355ce2368a@intel.com>
Date: Wed, 7 Aug 2024 12:53:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe/guc: Enable w/a 14022293748 and 22019794406
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Julia Filipchuk <julia.filipchuk@intel.com>
References: <20240805205435.921921-1-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240805205435.921921-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:40::19) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ1PR11MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c748955-7239-41fc-ba15-08dcb71a9c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEFuY2p3SnZTR2Nodm1jc3c3Mk1LM1g3bURGZWRtb0RtWEVOQ1U1SlR5bEdi?=
 =?utf-8?B?aXV0eURlZ1cxWFowYVpjZ2Q2Ui8zSGhxM3JwWmlqWVErVHIwQkIwL2xycDEr?=
 =?utf-8?B?NXJ6OGw2UkMzeFRkMlpVcUliV3VycXByVXpqbzJ3RVBObjIwU2MzZ0tOYmtG?=
 =?utf-8?B?U0xaQU1lWmh1Y2VmN1ArRHJNN284M01VM1oyQzV6VFdhZWk0SlorYk9VdFZt?=
 =?utf-8?B?dEdWWmZPZzF2NmVHdFhrb3AxSkF4QzRmS2pSRHNPajMzTmg5U0g1VSt5T2Vr?=
 =?utf-8?B?VlhYNEszWE9vV2g0M3AyaWZ0bVd4YWhmNWtURzdxSjF6VlVMREtLMEg5VWxv?=
 =?utf-8?B?VUF5WGxXQlVrUjlVUndnK1BLbnF6TzVBMStKUXp0VGdUU0piUUg5dmVYUDd3?=
 =?utf-8?B?cDhFeWowd1h0VDBnL2xjUWlBYjhLaW94WmNwY1RucDlENmZrdEhDTEE0UU55?=
 =?utf-8?B?OHlEZ3llS2l0cGh2RmJCa3hiclRWSmlERDFFRG81WHRRekxETjltdmJKdm9H?=
 =?utf-8?B?VExIY1hrdTNxNU1wQWlLQWU1V2lTeWN3bHZaN0RFci9NYkJXcWNRYm16Sk9Z?=
 =?utf-8?B?WS9TZnRTMU1qUWo5U2Y4NWh2QzVmV2J5TjdvMlViYzF4MG0vbmdJazFTMUxR?=
 =?utf-8?B?UTUwN3lOb1F3eWZYemdPNW5tU1g4QzI2MnRWQXZiaDBuSVFSY0FEU3g4RkFR?=
 =?utf-8?B?QkhGWU8rZHZmQVFSTG5QWjdOeXhPM3FzSk5pSU04MTVlcjNpeUhNeU9sS1k5?=
 =?utf-8?B?MlU4YlY2QXF6MXNCUXRyckYxQlFDZDBwRnBGTmFaUCt2WWFSeEVlZHk5Rng1?=
 =?utf-8?B?M1VNVkJ5WnJCVGVNL3Bld211NFdHSE5XUEVyRUs2UXh4RmlaSUp0ZG9yalZo?=
 =?utf-8?B?cXF2LzhYY2NmaDRPYVU1a0s2UTliSmlqQkVndzFUYVNzOU9Scm9VRkw1M09G?=
 =?utf-8?B?VFc0NUZkQ2dpTkJxMU5TSXdOQzBaUktScUhDc3pMelI4ZUlUdFJjVE5mWDJG?=
 =?utf-8?B?WXZ2ZXlMZzcyM1krQ0J3YVBKeEJidDFPS3ovOEZMVlNPS3ZXdE9mZEw0SHRY?=
 =?utf-8?B?MnhJZzNmcFJCUk5CMFN5ZEU5MmtsL1cvNHRLUzhDdCsraGtjNTh5NHdjSmNM?=
 =?utf-8?B?Vjlxd1gyMWpadUFVRkNZWUFiN3JEY1lJUWxsWlNnQXcwWTNycFJCbXVsUlpZ?=
 =?utf-8?B?ZytDKzdKZzhJcDdCeXZYNTd5WTgzVEVFaU42R1BWN2tWTXRBSXRQd01OdjIx?=
 =?utf-8?B?MDlVQ2tScXVaSFZScVoyUDRKQnh6K1VCUFJhRnNGNUVZZ2JJZm1KTDhRRmxz?=
 =?utf-8?B?YTR5UHo2dFhlTkowYnNtMFljZThrUmpMbnJ6UHQvK0t1S1J6US9iWk45OHR6?=
 =?utf-8?B?dkJsZGx0bVE0R1Z4YnVVWEd1Z2czMmphcVBReHgwL0tubFdKdFd4RGpmRElY?=
 =?utf-8?B?QTNsZnFUL2c4S3NBMWdqMmd4SithWjlHQ200dTVJKzg1S1hXYnAySEYyMXJ1?=
 =?utf-8?B?d3ZEaHA5elczTGhCOURtbzVzbEEzd2ltVTltamcxL0tvWURCc0dFeTRKb0JD?=
 =?utf-8?B?RUxlVmxVZ3l0UGlUVlV6QkJDdi9FeW5rNDZvWUFlQWJlMkZxdFRLcFpMOGFa?=
 =?utf-8?B?SERlM2Zra3ZGczB1bDBMMUNIOFRZRC9ZY2xwMThiQW41aGxoMzN6b21uUHk2?=
 =?utf-8?B?c1lrd2JPL3RiZHE5ZWMycE9PRHlTTkdFYXJVZVVFYVJ2S1VaMVJWdVptaUo4?=
 =?utf-8?B?WWR5K0c4OGRNZlVhWUxoNEZ3TU0xRkRldVo2VlkvS1orcmwyQUhzOGRFRGsy?=
 =?utf-8?B?MjRZRUxtT3FkR3R0d3hIZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RldEUnVFT2pQN3JXcjNlVHpXQWJWY0c2UlZ0SzBUMHUxd3JUNUNRaWtMQmgx?=
 =?utf-8?B?c05jbWV2aE9vTjJEZEszNGo2cUJ2NEo1SW5CWHdkR2w4SE0zMWQvQjFSRlBl?=
 =?utf-8?B?U0IxUjFkbkpEekdqdWx6MnZjSDFQZkhmdm96OHB4cFBEVGhqUDZvYzFvYks0?=
 =?utf-8?B?NHFHcVdGL1pqcmxtWmtaMTZuaXhsRENneVVqcDhWMElvTDkxcFZOVC80bDBR?=
 =?utf-8?B?UjdOWTVMbk9sZDZxMVJZSnBYSmxvOFZwZlNmTk9wMncraDNvTGJZZVB1ZDNI?=
 =?utf-8?B?MkpaSE14a2dxOEZHVHdNTE5WK1NDS3MxTXdGLzE4alRpN0tpVll4Z2RtclBa?=
 =?utf-8?B?V0ZINUFCbWNTT016cnRZQklTOGczMWFBdzJCV3BwdXJTSjcvNXNKTHU3V1VU?=
 =?utf-8?B?dnM1N1dIOW5CS042MFViR3VVanBmTU56WjBnR3l4UlVYejVJbTVsQzFmS3c5?=
 =?utf-8?B?bzRUN3d2dEF5KzBrRjYrUEJ2NkNweUd6TFYwdFBnbTNLYjhhOUdycmYzRU5u?=
 =?utf-8?B?Z28rbmNEQnFKZXFFSEpONEdKdUlyZ0daTFdqdzd1NVFGcWtSSUJUV3hOM1U4?=
 =?utf-8?B?Uk1xRzhCL3dzWUNDanZ4Vy82UjNwaVB3WEhGci9HSFhjL1BVbWdYTTJTZ2Y3?=
 =?utf-8?B?YXNvcnZ0NHFpMlVKTnA1REdJK3Nha05iZHFLdEI0NnY0a3lPRm1LZTBWa05v?=
 =?utf-8?B?Y0R0Sy9mRHdMNDR1Q0NmeG1ONkZsVC8rNUEvNjBabXRMYmRSOCtQTFdZM2hC?=
 =?utf-8?B?eEVPbk1uWU9vcnVDbWhKMTRoZktsQ3JGZmMxdzdJMU1sL1RSYkpwdkpNTUZY?=
 =?utf-8?B?L2JBNjdYVFZEL2FlblZBdVVoZnh1QWJlVElsYVFOOWtPamp0TDBVNFYya0pw?=
 =?utf-8?B?eG4xeHJCRTA1MVc4V1orL1F3bnYxajI4VVdQVVZQUlBWVjN0czg4VEY5T05C?=
 =?utf-8?B?MW95bDVEOWZrNlBxUUdVbTRIMkJjcjNsaEhOMFdEaWlQVnAyUy9rZ0RwSENz?=
 =?utf-8?B?TzZGWFRlcWREWHlSdnFseis0MVFUcWdmRmhFU1JQRUh2VXA2K253bk5uLzMy?=
 =?utf-8?B?eFpPOS82MmRzNmkxRW84SWxGSXFjejF1ZzZQTk12Q3ozSTB6SklreStnaDF5?=
 =?utf-8?B?V0toTXRZN1pxOW9YVnV6dWptekhtTHN4aVdPQmlScVZuZWY2Q0Mybk1xa21G?=
 =?utf-8?B?SkU3U1dyK0RWZGJNT0ZacG1SR1pFUmNXNG9lNlljRzdJbnZkZXZSa2RuMWVS?=
 =?utf-8?B?MGpoSkdjeWlNWlY4MFl5aVNLSzZSRERiekdVdUdUSDA0VE55RytLczc1Nzh0?=
 =?utf-8?B?d2UwaFdMb1NyMFdGbExkUTdPbHZVeHBURFZhd2lzWnpCMGRwWVJLNTFycEQw?=
 =?utf-8?B?NjR0bXFMNkFZK2Y5QllNNVcxTkZKWkcyRnN2Vk81UCtIc0J0TGl3NW1uRVdI?=
 =?utf-8?B?MTRSaCsyYjU0YWtpL0lxMGx6T211bmJhV3hSSTlDZ3hicEVIY3pJS2xxdEl5?=
 =?utf-8?B?dWM1MnhhVnhsQVo5TVl2S1V3N002NHNyZ3JXdFBJYytYdXpReUtMMTYxR2tP?=
 =?utf-8?B?SUZOWkRNY1c1dzdFdGYvcFp5OExBUzJZSG9EbUdiSlRkazQvY1c5Q1I0bXR3?=
 =?utf-8?B?RnYwcVU4V0xhcjlqQ3dVZllKcGtKZnlrVWhLZ0JKazZNcWVlUHc5dExIcGtD?=
 =?utf-8?B?UEpXVVR0SXhDWEE4NnlFTFZ4OUlZY2MxaysvMi85Q2s5b2Y5SGY0bk5sTDg5?=
 =?utf-8?B?SmlybXpMZWZ5NVhlRHBic2xkSWdnckZKeXVWZ1MrbVRheHE2Y0w4MDJXRDFX?=
 =?utf-8?B?ZEdOVXYvNnVTV3NRV1BLUmNlZ0U3bzVBR2NJKzVhNzA3b1Y4Qy9zemtKdjZt?=
 =?utf-8?B?VFA1NGliSmNzMnp6Mjh2ZFFkZ3hlQmNjSW16TlBSNFREM08vOEs3a3RKTHRk?=
 =?utf-8?B?M1FOYVkxZW5XWFJHeDl6WHFMbUNJMkhsbVRRNzMvUldMRDQwL0RFT3JBeTZn?=
 =?utf-8?B?Mk43NVdNRW8zRklpelJyRHAxUlhJcGhhNFAxUGhFK1U0eHRqUnlmNS9tWjdC?=
 =?utf-8?B?RFJZNGY0bmtLdnp0MVNJV0U1a2lHMVF6bWFlTUQxQks0VE1IRUVUb2JzclV5?=
 =?utf-8?B?cWp3WTZFN0hyQ3FUTTR5VHllOUhtNEIrU2daREVUcGFyY3Zpb3hrMjd5QUpW?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c748955-7239-41fc-ba15-08dcb71a9c38
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 19:53:29.9535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLfoRoOJQ0EGtLr7eLcDzL7Cs165Vu3KYiXaBdEtrc8HjgZAV4U5ytI3Rnw0gc+FTm3iCgqSILx+L7JXv81buA4Hx1S85NzvlwIWENHsSPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6250
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

On 8/5/2024 13:54, Daniele Ceraolo Spurio wrote:
> From: Julia Filipchuk <julia.filipchuk@intel.com>
>
> Enable workarounds for HW bug where render engine reset fails. Given
> that we're bumping the minimun required GuC version to 70.29, we're
> guaranteed to always have support for this KLV in the GuC.
>
> v2: Enable KLV correctly for either workaround (Lucas)
> v4: Add check for minimum supported GuC firmware version. Enable w/a for
> hw version 20.01 too. (Daniele)
> v5 (Daniele): remove now unneeded fw type and version checks (JohnH)
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 6 ++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 4 ++++
>   3 files changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 8f9f60b28306..6b30743a2f6c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -351,6 +351,7 @@ enum xe_guc_klv_ids {
>   	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
>   	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
>   	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
> +	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 1c60b685dbc6..d1902a8581ca 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -24,6 +24,7 @@
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_platform_types.h"
> +#include "xe_uc_fw.h"
>   #include "xe_wa.h"
>   
>   /* Slack of a few additional entries per engine */
> @@ -367,6 +368,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   					  0xC40,
>   					  &offset, &remain);
>   
> +	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> +					&offset, &remain);
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 540d38603f32..5cf27ff27ce6 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -27,6 +27,10 @@
>   16022287689	GRAPHICS_VERSION(2001)
>   		GRAPHICS_VERSION(2004)
>   13011645652	GRAPHICS_VERSION(2004)
> +14022293748	GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(2004)
> +22019794406	GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(2004)
>   22019338487	MEDIA_VERSION(2000)
>   		GRAPHICS_VERSION(2001)
>   22019338487_display	PLATFORM(LUNARLAKE)

