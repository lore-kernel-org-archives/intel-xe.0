Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5258C61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 19:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB78E10E422;
	Mon,  9 Jun 2025 19:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HP7Ef6Sc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58FE10E422
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 19:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749495891; x=1781031891;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HdAb4uBI9bfuPiwkWcFs5/FEKDMGiZny1sMckU0EAc0=;
 b=HP7Ef6ScflcN4/czCcg7gTGeQR65D+KG303BvjUzZsEQb3q6VpFOfLqN
 lrUOdC4wataBW9rm706uVJtb1dwTBItiKLTVUkjrYsBS6pV/JT6s43/cC
 4KMCbqVsySerafBANu0mYXn+tK/NTw/GzkTgsAu3GBxswvJ3QheJ8fb6/
 Bv86nN5a1VhwoDhVKv5GpwLwWMON3x8oySw5+iCwSmoYTaJ5OZuVdIBG4
 NKTU2v+UhWW5jy5SC/OABcDzfGrQIFiyWJDAcPtvVWHMOW+yEV0Njqd3L
 1hJdMSU23YRiAqrKxTN0vOW+7A/KcM9pTwCyZHZIhKJmLggN/ehNOHLIG g==;
X-CSE-ConnectionGUID: x+HBZWo5SxKflcsHIP+GeQ==
X-CSE-MsgGUID: r0YF5RBGT2ucAz6Z53aWAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55391425"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="55391425"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 12:04:51 -0700
X-CSE-ConnectionGUID: Z7NloM2BRGKxnqQAPoRjJg==
X-CSE-MsgGUID: 1vJ2HJwTSMqGDz12laoaYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="177506032"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 12:04:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 12:04:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 12:04:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 12:04:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DE0mRZhxvU1TmmI4JgdB3ZzHG2DK0cTHJo0xfGcJXsxQAyEUYT52KCD4pU6j0Y9TXlqAvw3QbxBNHjcGH+ry/oaEgG1fW+0WfbL2ingsJ3WxtAbNZ7B2mDe6hn5w2BSokQ9nu5Lxbp7pie1ITNxfPDLnysth1O7Bi1SEJW7Pldu/tKBeBsWcSC3BgmZcB5RSwstmfU6tHacXZDmKq01IEw3TS6kzttqsOzQkjAhIS1OvUWjgwQpQ4TOM0eBa3i6AmYTBz9DQZNUlyVkSkMkdVYWmi0GSjc8INSc+T3iwqLQbfXtQBT5W51wrIRidho4uUA0C8KSHReco6q7688oRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFsDdqEiTb/N8S33zhJ0zDtVtvGDGw16iV1rw6fA7go=;
 b=Bu/m01OdIj55PGJTjWLWGz4YfGHJi4HaYOFkFkNwucU4gfOcjXfjKvHerb/UA5HjN4BbqKqefVrLXPuDViGTjttFxCsDWu/0yMInLJOvi1UYKp3KE0EOqyL58AxxIjt7l0+8A97pPK64m9gP7gIHOV0GIhLRrfELb/d/GpxmXqRC0Kzc0FIkotJvCc4I2gYY2tlC21U8qxlLvcpmR2ZcwzrCZ2loYycdA7cu7M3BIUHKGAsAFxPShgA+OuJwomcC8H5XiIb6NLUF2kAJmAJ0CBZtI0/XsXBCtts+E7Tf+1SmUO+A8ob+TL/bIXYAhZjNWoQTQbfRJydaDakAOA5/CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Mon, 9 Jun
 2025 19:04:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 19:04:45 +0000
Date: Mon, 9 Jun 2025 12:04:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/lrc: Use a temporary buffer for WA BB
Message-ID: <aEcwTNAlxsr-4Na6@unerlige-desk.amr.corp.intel.com>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
 <20250604-wa-bb-fix-v1-1-0dfc5dafcef0@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250604-wa-bb-fix-v1-1-0dfc5dafcef0@intel.com>
X-ClientProxiedBy: SJ0PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:a03:331::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ae8c01-e4eb-4a66-d37d-08dda7887f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2JyUkEzT3kraTdMekVFSTlSd1htb2pyYno3S1VTMEpNeFlVSm9NWWV3dXBN?=
 =?utf-8?B?d05neUV1eHEzTXFwU0UwODNoVVNMVXdGQk1PeXJJVHBRaHk4dXhQVW5mVTNz?=
 =?utf-8?B?MjNSenFDb2ZzM0dsYWN6SlowRXBjU3VDYjNYREFyTzQ2blZTdVhQbkwwVCsz?=
 =?utf-8?B?clFKOUpZb0VVVUM0OWN5eFNHRnFCZFgvMEE1WUo5blJWb2RTWUNtV2xCK0Ni?=
 =?utf-8?B?QWFFZW5CbEc0UjRsR3hMSngwZ0RiTnFmNWlPa0JqTUJhZWZxMXNJZytMTWlh?=
 =?utf-8?B?b2pDU3Y5RjZrTnlRYWhxalplN3ZyWEF6cDU5Vmg3bGVEYlJNd3dkMm1BeWt5?=
 =?utf-8?B?YkpXdFZPRTRKellUQVBYZis4RFczRGlSL0lXZFNDU1lDV1plWEJ1UGtVeHRW?=
 =?utf-8?B?Sld4Q3RHZ3hFNmRESHJXZ1ZSSlBkaEtXUGRYT053M2JpMUdhc0Rvc3NZdHJN?=
 =?utf-8?B?NnBDaDlScWZ0ZktkbzhZQ05PalVGMkM5anZQQ3ZPSG9lWVkwM2g5L2xiWEti?=
 =?utf-8?B?VklRM0NpdVVvTGtTd29aTTZqcGFLd3hlK0QzcVF2blpkK1hGYVdGMzk0cmcx?=
 =?utf-8?B?WnJ2Z21QUUxvM21HWGE4L052UFNFNHpQNzg2VlhUTGxNaFBnOFNIWnA5N1lm?=
 =?utf-8?B?NUVwZ0p3OTRxSmdMM003VU1JNnN5djFUZXY2M0pJMUFqVzBiTSs4Ryt4bEs2?=
 =?utf-8?B?bDdYeDhuREFjOGhHSHJlTHE5dE5WY2JkYnRVdzBnQkZMNHp2QUcvQ0d6M2Qv?=
 =?utf-8?B?N2UvVmErcEtneFgrbktwdC9TSG1TNUNac0Ira1ZNSlVLWWQ1aERpSFZwamxv?=
 =?utf-8?B?S0owQWp1NWI1NUx4RUhDemJMajduUHJDZi81Z0RGYWZaNGRJcWF4TlNOUTBH?=
 =?utf-8?B?azFiUGk3cUhXZ0RCZkJYb3FXRWlEbGdHKytjbTU4TndVOEpDaTNjTzdSLzlW?=
 =?utf-8?B?UzcyVlUvUVNuTDhGWlF0SElORGlOS0dOdHk2ci9acnA2WkJmN0J5cnBTOVZ1?=
 =?utf-8?B?Njh4ZFpGN0djNkttcFpaT0hpZEZFWHpjN1l3RDI4aGRQWWJHeWVtenkvQkhH?=
 =?utf-8?B?MVZ4VWFnMzdnM2FpS1RIVTZiZm9sMnpFUHJqcVUycCtuTzJEakEwdm9mcmo0?=
 =?utf-8?B?dWVHSTF0Myt2eUtIR3poSDY1cmN1eXRHVlZRM0hxNzF5c0dQdFdEcjAyem0x?=
 =?utf-8?B?Y1N4QUVoSndoOTJPUkhQaFhrdFNaeUhhSm9DRmN1Ty9ocGtjOVBTME8veDlv?=
 =?utf-8?B?cXFrMmd1OHJ1NDVmSlFyNTRIN0wrVnF6cTlGUjFCMGRESXZsbVRMM0hHSFNX?=
 =?utf-8?B?cW54TzloM1dDLzRUZ0tZZUZydmk3TklrRzV2NHRoUlFvSUVNNmFWTXhwYzdV?=
 =?utf-8?B?L0l1L09QRzE3c3lXeVpOL0RLL0JHSHlkYWloaXA5TjNkSUFZODNYQ2FCRXls?=
 =?utf-8?B?ZGRmeXFKQ0x2OVA1YnJPOEFHTUl0OVJjM3FJNlZScDF4d0ptUk5FWXoxNnZH?=
 =?utf-8?B?cmx1UnphelVhVGJ0SE0vdlVLWjRvRm8vZ3hmS0R4QVZCdzlnZUdrR05Eem5M?=
 =?utf-8?B?RnpiVnQxbTJnTjVTUVpKL3kxUEhTUUFKdzRiOFZneUNhbDJGNTY2eVZoTUVs?=
 =?utf-8?B?SXJ5VkgyM2hzTnZqNEh3Z3dzbjg3TkszT3d2WmNPUWo0bnA2VitaZjFuZmhv?=
 =?utf-8?B?bjhjL29OZ0ZTd1FZSU5kY240TEJlRHQwSkFQeEZqd0JadktxSTJEWXNNbkFL?=
 =?utf-8?B?R3RCMGhpanZrT3FBanlVUmZlaW9hWjF5YndDbDNXazh2OE9WaEhhdEpWQ1Az?=
 =?utf-8?B?dXc5UVgxdjZlWENVUW43RzVqb2NjUmU3RFJEWW5pdnQ1WVBLZDMvaHl4VVZ4?=
 =?utf-8?B?UWdHV0xJMjREVVdJNE0ybmJhMkNlUUQ4cGVUdERhUnNERXJNZ0FBODFMWUdn?=
 =?utf-8?Q?Kgi9BcoDgN8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnhXYVh5ZmxGZk9vdkQ1dm9NMytRemt4SGd0a1JFbGNBeUpGYWpMTGJ1aStn?=
 =?utf-8?B?cTVNNWxLcXpJME9xTzhBUGxBUi9icFArTC9VNkJ3R0piRDJvVlZnRnFwSHVZ?=
 =?utf-8?B?T21VQXF6Y1JDY0x2ZUVjZGZzUjllbnBQOGJLb1FOaG8yd3dXZ0REMWlTRDNK?=
 =?utf-8?B?bGVObnNWSDE3MlBPQklYdnNQNHoyY0dlSmt4MnF5eW0rZkkycWpYTjdDc01M?=
 =?utf-8?B?WnVKYnhNUWEwTndZekFzR055TGhRZEFrUEhmS09OcktVeExWaTJpNkRPeXNs?=
 =?utf-8?B?WW4zUWlpeHVTTDdZOXNXTW5mWlR0TTBvbVoxN3dDYUIyWklxVzJHaFl0T3F2?=
 =?utf-8?B?cHp0K1hPT0xqT3ZFVFNLRWhCVjNQcjZjeXdsMkdJZlRQQ215dmZRc0JWUkUx?=
 =?utf-8?B?UXZLVU05UWMyQWliRTVZRHJ4ckxiYUlLV1FRYjhNYTJwaWNLejZnSzQ5N3NQ?=
 =?utf-8?B?RzYzZytuNm9MOVNtTEJkRFBxclhsSXJKZzNYTVJSa0JWSmVmeXBDMDNvdk9P?=
 =?utf-8?B?NXpDT1kvQ1N6TjIxVElueTgzUUtqRVQ0SzVyNnZkYU8zK1VLYm51bGlVZk9I?=
 =?utf-8?B?dG5mQWtGbVJNV2hvTXJiTTY3RzQ2ZE00SU1Ta3BiSDdZa1pZWGZ2MDdqY1BB?=
 =?utf-8?B?aGN6aGcxV2RjbTRkQUgrN0RDdXlkQnY4WmJEMmFDa3JEOTdIY0s3czlaYUVN?=
 =?utf-8?B?NnJmenlBekNpeGZFazBFQWgwQUR2bjFBZTNBdUdmbFpGdTlKaDRzUFNQUUVW?=
 =?utf-8?B?anFNTWJkTDVVTERZSU8xKzhiOXFIWCt0NUZqWTMyTEJlbTY4VGVnVkJwTkdO?=
 =?utf-8?B?ZnFiUDIwY2FtRjNTZm54SU1GU29uSk12SmZFUGZGV3VTK2hXQmJrRUxuR05Q?=
 =?utf-8?B?d25yeHRxVWUxd2ZpckkwUE5rL21NZ0RaZ0xVQkFjSlphQnFRNmN6RlBqMi9U?=
 =?utf-8?B?T0NYTGVkYVZ3OWVpQW54V3phaTgxam52T0Y5WHBKMGZLL1BnekNTQk5hT3A4?=
 =?utf-8?B?YitlMklHa3hyMUFiaFgvZCsyZU9rNzBSejcreHM0U1J5QnNHTkNYOUV5T1Az?=
 =?utf-8?B?bnJBa2x0SXYvUmY1RURrUEVIaVpzRUJGT2NlOVQ4dkN3VHYweTk5VGxaSTBl?=
 =?utf-8?B?OS9kYWtBQ3FoQmFCVDVrNllOdUxWclNnNmZtTzdPM05LYkpsbGZyODNtSHQv?=
 =?utf-8?B?TXRZSE01aXl1allJRmsxOXU0dTMzdURMRWlUeXhIU0lRVjZvcmpxcXNJRXhX?=
 =?utf-8?B?TmJOTW9ZcEh0Tndyamc3WjllQnBDTk1LTEJPU2pOelZCSHl4ay9Zb0loTlBt?=
 =?utf-8?B?TWxFOW1iVWtYZ25acjhjVmcrbTVEbks4bUNudDZDMzI2L3ZVN1hDVHFNT3ls?=
 =?utf-8?B?ei94cVdpcnR6WjArYk9Rcm9SZHMwME5JQ2hsZ3ZyNnBhZ2dLYjJXL3F3R1Vn?=
 =?utf-8?B?ZFZpaVNvUjBGMTNoM0VQb3lDSTJGc2dmTkZNYzR5R3ZpZ1c1bnJ6T0tnM3lY?=
 =?utf-8?B?N08wNjg3L2xneHh4OW1Ya1VUSFh1WWVjVkxjUGVoMWhNTUFjTFlMeVBGYjFO?=
 =?utf-8?B?bXFmdCtvcFBLR3doemVVZ0Z0bkNINVU3Vk4zelhQTmV3N3RiUmFKdG53UHl6?=
 =?utf-8?B?dTJJV0RsR2twdS9uMElWdmtSWVpnWEd2OFVhNGFlK2hIMENScnMwOEk2cXcr?=
 =?utf-8?B?OG1Hc1hPYythTGxpWWJad2lqdW9aWFdvYzYxZ0NqVklSUlV0SHlJYnpkclZU?=
 =?utf-8?B?UExWMmhOZUlDVjVLL0lTUkR3ckdwUURNM056MzRUOHBjdm9xOEdqdXpmK3Yz?=
 =?utf-8?B?R25nYnFnYnI0aHkwWXd1ODRHNEswNHZqa1VPbXJxSlNEUnJsVFJOMTBuUkFM?=
 =?utf-8?B?VG94RTMyUFV3cjN4WlRGVnZNQVFGc0h3S05SSGVoT1hraFVsVTh5SVFDaFZn?=
 =?utf-8?B?VVBTSXFtVDJuLzJsUEdUZTNCNWgxRkJtZVRGQWhzU0pXK3dwQTdJcmNHSCtN?=
 =?utf-8?B?eFlROS9sWVdySFg0d2ZrT1pzdEtCT2RoWkJpeEhGYUV5VnpPY0NNUGRmbVlx?=
 =?utf-8?B?c21HRjlZa0s2MWx3R2dQczlUeU1IY1BQUlRwNHpwRFBnL2RmbEdlT3RLZFpJ?=
 =?utf-8?B?SllvN0JhcUlrYnRtNFdtazBFaXdaU1A5cEI0RlVpMHI1ZlJzVTlVWEJVbmdr?=
 =?utf-8?Q?QLZLuswO+NrV9R2ZmYR8z5Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ae8c01-e4eb-4a66-d37d-08dda7887f93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 19:04:45.5588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CWO6/6pR4o4qqoRbE9++IunSVNbgD5CyYf+BaCJowKvjM1TUUN2F5JXR+3lfA4TIOL/FiQsRjrAz6VxuZJa2C9bcq6FJwWPd3aN38Kwq2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
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

On Wed, Jun 04, 2025 at 08:03:05AM -0700, Lucas De Marchi wrote:
>In case the BO is in iomem, we can't simply take the vaddr and write to
>it. Instead, prepare a separate buffer that is later copied into io
>memory. Right now it's just a few words that could be using
>xe_map_write32(), but the intention is to grow the WA BB for other
>uses.
>
>Fixes: 82b98cadb01f ("drm/xe: Add WA BB to capture active context utilization")
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_lrc.c | 24 ++++++++++++++++++++----
> 1 file changed, 20 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 63d74e27f54cf..bf7c3981897de 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -941,11 +941,18 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  * store it in the PPHSWP.
>  */
> #define CONTEXT_ACTIVE 1ULL
>-static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>+static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
> {
>-	u32 *cmd;
>+	u32 *cmd, *buf = NULL;
>
>-	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>+	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>+		buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
>+		if (!buf)
>+			return -ENOMEM;
>+		cmd = buf;
>+	} else {
>+		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>+	}
>
> 	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> 	*cmd++ = ENGINE_ID(0).addr;
>@@ -966,9 +973,16 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>
> 	*cmd++ = MI_BATCH_BUFFER_END;
>
>+	if (buf) {
>+		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
>+				 buf, (cmd - buf) * sizeof(*cmd));
>+		kfree(buf);
>+	}
>+
> 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>
>+	return 0;
> }
>
> #define PVC_CTX_ASID		(0x2e + 1)
>@@ -1125,7 +1139,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	map = __xe_lrc_start_seqno_map(lrc);
> 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>
>-	xe_lrc_setup_utilization(lrc);
>+	err = xe_lrc_setup_utilization(lrc);
>+	if (err)
>+		goto err_lrc_finish;
>
> 	return 0;
>
>
>-- 
>2.49.0
>
