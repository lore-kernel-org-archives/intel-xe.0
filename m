Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB80C25B74
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4EF10F0A8;
	Thu,  9 May 2024 19:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gi8XDWwV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94E310F090
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282231; x=1746818231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=179bi8vcs6IN1InH5fj9nwfk/g+tn8Vmh5S0Tvzzbd8=;
 b=Gi8XDWwV7zGgsCUt+8YnxsMUQ3x0VgqWbZ3mVpsSfoOoOahhJUOKEfCu
 wVyevKfC/SgfZhcWZJi2SToJTO9fiG03EyaWA7mjMBm3LEpmXTDPnoRQe
 aAbxuGygvYPiDn5HW3x4l835Q+IqNQmNRuLqQ/YF4v/d2IIQXkkExqf0j
 AHsdGL5C3wyySSlPOtRHPb8I3t9iIaON1tNUGGuFG6+C2OMjcmxbWHgbk
 ZWieNf+aOw7TMpiV998SKChoIj2nUbAghgpQOWIVD8iJvVU+ixQJz9fXk
 Yimdcbf68GC87xyotUrvdN6oyG4w/wn2tvV+e6wKeH6I5KXDPb2zXXMYc A==;
X-CSE-ConnectionGUID: u0FzkXqVS/+cK6u9lfpLWQ==
X-CSE-MsgGUID: /NMnwIrURXuBTwqqY/HBRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15038460"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="15038460"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:17:11 -0700
X-CSE-ConnectionGUID: ukzXj8MGSeWQ49FkR5ISrA==
X-CSE-MsgGUID: 5QldHjv8QvClOYzenIYFWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33879276"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:17:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:17:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaVfodA3L6xeuDhIxDAG81YBlsvX2+/TVkZI7M3HHnbLO64sNiplduLrD0McjYi/o8GtGF8k5XrkSFyDcbiRlfOVC5Qf+VVE3UFRwzdHSs0+IhplXqgqQQhIhrj0Jmaj/LuOJ4ZxNN0IXILHSWfz2UggT1NjS0oRxjb/e1uRmYmKeCoWNZEaagoibBFKGmcltWs6cAnLxClB/W6tLJvQ+93eldtSCDszwGHoCUE0eW7X/0TDD8YPn2hDLCq2srmlJDUuMnjztO/q679wIUORw70RIZMKq9PuhVZ/li++lv19uQ/kUYge2WQGcVj8PDdh1sj9iGQLuLL6VKoDTSl7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1v/o6RSnwxnxnTZl6rKMxcIrelWe9/sHaOFjjEJ1yJE=;
 b=DUxit2Gnjc0RJ4bUkGuK4vMPZkQb32w+jAjQcHlfiwHY6kYSmUDwGLx4cEPwKWtX206xMHn0Tx5gxFqQxrpb8osU1y6793WsN7XMmMjBn/cLWVYPq1N4eG4O2LzaONTJTwsdFINhz2MOqioxRU+rEHEPw2IbOTVBy+B2aAKT166tumZ7b6Vrk0T7DslnGcQBCOtsKT0hOYS7608lXX0/n9spULIfIE1SnR0Ydz2/w/Oiz/zFURKegTNQ/G/cj+gsISNDuwcR+hBresT7l7oq9BGUcSh7oYHXk4CpKlEYTELMt0ArDLP7v1x3CsDsugYMy4OkoW6v3XuSOhvUr4BObg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 19:17:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:17:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/7] drm/xe: Relax runtime pm protection during execution
Date: Thu, 9 May 2024 15:16:53 -0400
Message-ID: <20240509191657.504300-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509191657.504300-1-rodrigo.vivi@intel.com>
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:303:8e::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c54a99-b902-416f-f581-08dc705c9ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkhhYmNVTFRKWlEybTgwV0ZESkYvS1ZTQXgwQ1lUMXh4QWRoQzdjMk9yV3NX?=
 =?utf-8?B?amJYeU9iamliTEo0NVpQSkh3bjZPWmF1TytlOXVmckRaNDNhUUs2RDRjMlVK?=
 =?utf-8?B?TVhRaUxnWnJxUE5EU05JL1V0cDJwd0F0ZzZSZU9XV3NGUExQa0JidmEwemZU?=
 =?utf-8?B?YThGNXhqNnlGcnBqaUdBMCtsNUptZk5qOEZ0aSt4L282SFQzU2VoWjRUQUt0?=
 =?utf-8?B?R1Qzb3IrRnNLcnJMYS92THVUR0FYL0JNekZhcnorUENlWk8zZGZQMEM1S2dj?=
 =?utf-8?B?R1JHbFg5NFRHWTdPNGhxa2huU2pKZnE1OHFia3ZJQ2J1SEh5TzZ4UlBnMWJP?=
 =?utf-8?B?eXZ2eVVzRkhxVmdOK0M0Sm5DajA0VHNNUkF1K01hT1drVVoxVUdpaGdqUEli?=
 =?utf-8?B?TUVRWlFiVFh0ekRKZUlMMFM0dEZqSUViWEpybDFubDZocjhFNmM4ak1NcnZt?=
 =?utf-8?B?bVBCTERZVSt0bUhqaUd5ODJuZjVmM0JDd2d1cUoxbXRGL0JqUE5hQ1VZajZj?=
 =?utf-8?B?Qkp3YXFHbm9HdldYT20za0hFOXJRcVZ5UTNLUHlPRHZCS0swNEhhZmdxelBu?=
 =?utf-8?B?Mm1HMDkwT2EzcDRRM3BJaU5KVGI3S1MwQVhYNFZLRUl0YTB2NVgrQ293UElv?=
 =?utf-8?B?azF5TDVGOS84OGtRTEtzaDlUQ0d6b1NFYW9CajVSN3gxTDZWOG1XbUU0eE1w?=
 =?utf-8?B?dGx6SzRjbjVkSXYvVWVxZzNSQmJJOU00MEZIK0lhOTRZc0ZUQjlnendpNmRL?=
 =?utf-8?B?eWQ5dTVhakRYZGI2L0t6azhXMno2Wm50QURWaTNuM3JEWDF2QVJNTFVFZFU2?=
 =?utf-8?B?Yk53S2tsUmRxSzVoY25KTlE4clhTdEg3OEJIa2ZLcE00U3NnU3RWOXVvQ0lr?=
 =?utf-8?B?cVBCTGVaUlZ5ZnpxK1dXL21XNWduMHkwTDgvZmZGOWxoNGt0eG8wNEtGQ0t0?=
 =?utf-8?B?UWtKMFlJaUFjeDNhQUtYdVp5cU9nQmNNYVdpdW5oQ1JPa3BmRlpHNnlBUWpP?=
 =?utf-8?B?QzRkRVhzb21IN1BaVHlvUE05V0F5YTdScDlBMmdUNEFBWlRlaEJSU09VbDh2?=
 =?utf-8?B?UnhlOHIxdFN2OWZvUHBRQ1dNVEJ5RkpueDBKYVU3WHZWWEJWTC9rWXNMQ2JT?=
 =?utf-8?B?aC9GTG93VTVmN3pGQnhISVhmRUxMVHk0MXkycFdjWlFaUFVXUzFsakIzMEUv?=
 =?utf-8?B?L2diVVNUUGJmQS84WFpBcU1UL2sxbDZzMk8wN3dOOFRNbCtpRGs0TUZtTmJa?=
 =?utf-8?B?U2lzaGVlWDh6ZUlidzV1K0k4c0pSaWNwK2VtVWg1bUlJanhJUXMxTVFTU2R1?=
 =?utf-8?B?blBhZlhuYm1DWlJzYk1vQkFkR254T2NnWWx2eW9VRjhBRnNubFRCSzdiaWh3?=
 =?utf-8?B?U3RqWXdDZUtLQ2UyMzVpQWVqbVhFbExoT1V2WE12R3hxVktpamtEQXphYjZw?=
 =?utf-8?B?cThxT0w3bkhDYkpGMGNHcTc2SkU0UUtpcVI3anJpSzJVNElCelZlSXBFdjNv?=
 =?utf-8?B?N25adG9JOUtCTDNZMnR3Rk91MExGTzZ0dnNQR1paN2poSzQ0Y2RnNzZhMVQx?=
 =?utf-8?B?a0cxQ24yNmtRY3haUFhZTzB3emdVWmJmRG80Q2l3M0txekNDNWdWajRkdE1p?=
 =?utf-8?B?Q3lMQ0RoRE5Xa1JwNUp4bklUVHNxeGtIZTJoYm54MkVwVC9XSDRFeStoM1Az?=
 =?utf-8?B?OHFlcU9mZkF3RnJuN2l4b0RGcCtKS2JOT3RVaUVHamtXeGNpZktDeGxBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS9EMnAwNkxYYytzZGVvcWZJckRnMDRvazFBU2k1MEl4Nm9HQW1rc2pXVVhV?=
 =?utf-8?B?bnFSd2JqTHQ4YUY3L0c3YUlkd3hNRkpoMTNUa0ZqamNsM0IrTktiMk4yazFx?=
 =?utf-8?B?cE8yRVlpWVAyTGZib094ZXBQTzEwMWl0bE02L1psazdNMGhjelgwS1gwWHFO?=
 =?utf-8?B?SlJvcldIOEF3MTltdXNsNXBGZGZiNDJMdllpUkwzajZHNW9hZmdheEt3UXJP?=
 =?utf-8?B?Q3FXSVN5TVU2QTVJR3BNbGVMVi80QVpQbUFrQzd6SUN4WFRJendKVmx3SzVV?=
 =?utf-8?B?WHZPSmpielE4Q3UwekJpYkpySDhTbXBqQ3NKb1c3VjNGMmFrV3JkYmhVUTlu?=
 =?utf-8?B?a0FpNFkrNW40dlF3N2xtU2FVcG1nTUQxU2VIVnVNOWduaHR5aFZDdDdBb0kz?=
 =?utf-8?B?cmFiZXJrTmNyYldQa2orSXduNHRBNHJMRVlEMDZIK0g5QWpDOHFZQXdXa1lY?=
 =?utf-8?B?a2RLQVM4NFp4N3RoZHJIOWhJemd4bjVlM3RPa01ZS25OTDJiaFNrL1VhaFV4?=
 =?utf-8?B?SGpWNFNtOHhIRFRQSEtPOVhiTnlXczRQeTZFR3Q4dSsraFZSUmoxbUIvQ1BH?=
 =?utf-8?B?d2gvcCt3Q0lMTWY2RWZUOUJYeDVZNU1jU1ZlU2ZSeXlHMTM0YWw4UGRZR3Fj?=
 =?utf-8?B?TU5yRTg1ZlFQRzNQZFBXY21Qa3owUmh5QzdTZ3dlWTdCVUpjNmV5bGVWS2c4?=
 =?utf-8?B?d2kzNkVNTTZYQzhJSVNHS1B1ckNoNTB1ZzljUXcySjRPVWxRME9MSEZHRkw3?=
 =?utf-8?B?UWsyZ0JwMUd5YWMzZ1lpcENuM2hWTU52anFLcHJKcnNVb3BhdnF0cU0rVm5x?=
 =?utf-8?B?NkFHalF2UXkvd1UwcFBDdDF4a0lUcXRTWit4MWQrVms5ZzR5dDR4VHRsODN5?=
 =?utf-8?B?U29GVklzUGd3MEgrYWNjVFdCQmRvc2gzWElxOUVjOTF1RncvdEJwblQ2MFdY?=
 =?utf-8?B?eFNsMHpkZVdkMlBYOEc2YW9MWTI5c0FGVnBmcStKL2NBcitDOHluZVI3VGZH?=
 =?utf-8?B?Q3FYaHQwYnhQamZOYlVpZFdtaHZFb2VqRnpoOUFWK3pFTlIya1phcklvU1Bj?=
 =?utf-8?B?ZzhzMEt2ZlFKLytvWHZ3SFNZR2l5ZFNMQkNjSEE5RENjcjEvVmwrR0xNTUJi?=
 =?utf-8?B?c3k1c1h2aUJnQ1dTYUVWdUZlcFRzOHZPci90VjZhM3NveXYwZFd4eE1xZDll?=
 =?utf-8?B?RHBXM1c2K0NUQ1Z5cHR1SXNmYzJ2QnFmd3pBcUtxdUpsd3pNaWc0WlRyK255?=
 =?utf-8?B?ejNQWmFlMTRpaTVVRnA3NW5YdmZnUDRmQ1hIZ1E5MTFtYmpRSUdMQ3g2VjZm?=
 =?utf-8?B?Ty95cUViWlhIcTBoM21MMU13ZGZkTHVZSHVSaW9PV1NVK1c1allCcVRMcXNk?=
 =?utf-8?B?SlRXNDhEK1VsbjE1YlFVNy82YmluTnpqMlZleEE5cUNsQ2ZSN0RyTVhYV0dt?=
 =?utf-8?B?QlN6TVNKekJnZlV5WWI1Y1pYOEpkWHFqSDVnUHROQ2lkSDhjQkVlQ09pQUpI?=
 =?utf-8?B?SzJEMk5mQklhQTd3NjlXYkhsTSswYTM4TUFYVmc0VkN3YXc0NnJJd3Y2Mjkr?=
 =?utf-8?B?OXNrQkVlSFpBcW1hUVJETzJpckZYVWVwRG0ya2QyVmFvTWJNcXFjSFhNcGw0?=
 =?utf-8?B?aFJZcS9wNGF5SnQrNVRhQjNOaDhKTWt5eUFwOE1HbDM5Q2dNa0FJU3J0YmJ3?=
 =?utf-8?B?RHUyYXRWVTVQaUFXY3VRcmV4NnVsdHRyOFd5UDJtOXlOWnVuOUJ6ZWpzWWFK?=
 =?utf-8?B?Z09PMUxHODZNVnFGc3Y4SzVTT2E3QWFoZ3E0K2t6MGNnTGhrbmUxa2QvODQ1?=
 =?utf-8?B?UW1JbjNzRjFJRmZRdVNpb0lIRGNVWG9ERXVpVDg5VU1KTjl6QkR3UHJMNlo2?=
 =?utf-8?B?TFB4Ni9lRW0xU2ExaGpSc2VxZnNrU3p0NmMreFlyOEgwdHhuT0xJZTd4WHh5?=
 =?utf-8?B?bTZpcGdTN3JERVNoSHJrU2QyVFIxMi9NUnFMMzM3ZThsVThPTm96eWdraWIw?=
 =?utf-8?B?RUM4VHQwSWo0SS8xbm9PV3NwT1BaZVpyN2MrcWVCZHVKMmxXQlRKUzc3eXdt?=
 =?utf-8?B?ZHRNUTkxelo2T2YvUHhCMHRqak55T1UrQ3NJQ1k2Tzl2KzRDMmZsczZqMk03?=
 =?utf-8?B?Vm5MU2NDTjY4VmtrT3JQL2xTay94VzYyT3ovNzRIZzRQQ2d3ak45NWxqcUxQ?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c54a99-b902-416f-f581-08dc705c9ea1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:17:08.3366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OcUUEfa9vployktGhwpq9tIZKZJF47hPbf5FFV8ermDJXXY3EOYuTRdtLmatVei5MEFEx96IMIh4zDNzvoDiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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

Limit the protection only during moments of actual job execution,
and introduce protection for guc submit fini, which is currently
unprotected due to the absence of exec_queue life protection.

In the regular use case scenario, user space will create an
exec queue, and keep it alive to reuse that until it is done
with that kind of workload.

For the regular desktop cases, it means that the exec_queue
is alive even on idle scenarios where display goes off. This
is unacceptable since this would entirely block runtime PM
indefinitely, blocking deeper Package-C state. This would be
a waste drainage of power.

Cc: Matthew Brost <matthew.brost@intel.com>
Tested-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 14 --------------
 drivers/gpu/drm/xe/xe_guc_submit.c |  3 +++
 drivers/gpu/drm/xe/xe_sched_job.c  | 10 +++-------
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 395de93579fa..33b03605a1d1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -106,7 +106,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
-	struct xe_device *xe = gt_to_xe(q->gt);
 	int i, err;
 
 	for (i = 0; i < q->width; ++i) {
@@ -119,17 +118,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	if (err)
 		goto err_lrc;
 
-	/*
-	 * Normally the user vm holds an rpm ref to keep the device
-	 * awake, and the context holds a ref for the vm, however for
-	 * some engines we use the kernels migrate vm underneath which offers no
-	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
-	 * can perform GuC CT actions when needed. Caller is expected to have
-	 * already grabbed the rpm ref outside any sensitive locks.
-	 */
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_pm_runtime_get_noresume(xe);
-
 	return 0;
 
 err_lrc:
@@ -216,8 +204,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_pm_runtime_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index fde527d34f58..4f70498b65d3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,6 +35,7 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_pm.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -1073,6 +1074,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
+	xe_pm_runtime_get(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
 	if (xe_exec_queue_is_lr(q))
@@ -1083,6 +1085,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 	kfree(ge);
 	xe_exec_queue_fini(q);
+	xe_pm_runtime_put(guc_to_xe(guc));
 }
 
 static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cd8a2fba5438..a4e030f5e019 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -158,11 +158,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	for (i = 0; i < width; ++i)
 		job->batch_addr[i] = batch_addr[i];
 
-	/* All other jobs require a VM to be open which has a ref */
-	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_pm_runtime_get_noresume(job_to_xe(job));
-	xe_device_assert_mem_access(job_to_xe(job));
-
+	xe_pm_runtime_get_noresume(job_to_xe(job));
 	trace_xe_sched_job_create(job);
 	return job;
 
@@ -191,13 +187,13 @@ void xe_sched_job_destroy(struct kref *ref)
 {
 	struct xe_sched_job *job =
 		container_of(ref, struct xe_sched_job, refcount);
+	struct xe_device *xe = job_to_xe(job);
 
-	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_pm_runtime_put(job_to_xe(job));
 	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
 	job_free(job);
+	xe_pm_runtime_put(xe);
 }
 
 void xe_sched_job_set_error(struct xe_sched_job *job, int error)
-- 
2.44.0

