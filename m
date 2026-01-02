Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59C6FA374B
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jan 2026 14:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7241210E12A;
	Fri,  2 Jan 2026 14:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFM/25o8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901B910E12A
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jan 2026 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767365836; x=1798901836;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2K7SyYITp8Z9s1H9jyOHulVIDNq1Pl0aK6RNXTIAzlw=;
 b=MFM/25o8yzU3rx4esrtTnU2eo5TCS/nsJQp+ulvTK6hkdvaiE4QQDHUO
 AuoQ/ajY+v7fW++pNw5cP/+PVYsIZCsNedxU39eSyZ+JRBcocl1tvOOJu
 8Qhh/O1SV0svqunA/APAXgEH9VsweL+teLxtMCR/J+8XfjruqkticKQG0
 OrUAi8gxaDNBuOo/Dbd8Zu/c4OwN9d8coGMIHAvZ+WgbW0xoV2PcGRzHN
 QIyEOMUbLxXuoWF23QNo2kjgHJ8QxpvBXbHqaBj70VjgxWn+ajKvx3Bc8
 cWUn39HL+mu1PWyAFQ6EuO6Qw+RvTxiv98UNo6PwSRCr7uJq1Qxwflsdj w==;
X-CSE-ConnectionGUID: 4No1136MSo++o4Vm0W3Bzg==
X-CSE-MsgGUID: eD9bvZRaQgiQCdJgNto5Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68764230"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; d="scan'208";a="68764230"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 06:57:16 -0800
X-CSE-ConnectionGUID: 5653Rjs+St2sOgW0KeflPg==
X-CSE-MsgGUID: MJ4cw6hiQ/mtbriMnDu9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; d="scan'208";a="201826673"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 06:57:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 2 Jan 2026 06:57:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 2 Jan 2026 06:57:15 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 2 Jan 2026 06:57:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpF9hst7913NuDrrXiAw89PQ08ku3ofERkP09KqkqiKJ8RDl1nFkuAMy1H1OpXJbRs46czVzS4rm+3YwijBrs84gIY03mhEAwbOEyFJWB9L9QvKYITUWBXHPSceh2duMy5m8r/J/SgHMjHV+OT8Z/DgrEx8dcgc079fVXE4S3o/lQakG4+CCGYwnJ/QqM5kL+xGnzYjC0IeCA/pVTe2063d0+Us3oaqrD8biQJhsNDNKjGC7E/66TZPm17D9UCLXj13bAXlIPDFHUmeD8JjpM+V0VOrgYvO05KjcZ67irECK6+Y1kdMCA1TCeS1TJSbiOOiowX6zI/eDNuwYdgYVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFMpqSHgOEgTNh+J9yQCb3X/mg9e7xpGeLEzBSwb8U4=;
 b=wwLJncqxq1PMzkO6geMwrnpx6Dmy6biwKNR4HcyJBUdcGv+RH/+94zT1vkbftppxjZI8V38XDYBClYW3zAPvSriAyaO1vrUUf4KNbPnwFa3A7kte9FFcBOtthKnRsNHFaspdxiwK709Y6e1H/JEd5R1Re4Rzv0Lva6o4gal8kcy9C4SiOwKcKC+4rX+ypNggsuu8Wg8x40dWFPmg2BkypV4uuhmVEnuj2r0JMcOtXg9gylzSCNds8M/8pUrnxBVQC2JzHuLtx0TtuJ4+bF3ErFE9Wv4vNwm2rw3LBZF6bjfKAAJ/mSuHjI22qJj6ZmhP+dTqQjQ80PID+RvlzjsYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPF263E38237.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::81a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 14:57:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 14:57:09 +0000
Message-ID: <af33cc10-3b5e-44a3-8a51-8e5ae71091cc@intel.com>
Date: Fri, 2 Jan 2026 20:27:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: select CONFIGFS_FS dependency
To: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>
References: <20251219080513.848072-2-riana.tauro@intel.com>
 <aUV3dk3wUpf7U6tP@intel.com>
 <a4928fe2e89de39161f8b794e798998a3fbebdd1@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <a4928fe2e89de39161f8b794e798998a3fbebdd1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPF263E38237:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f83f95-f598-482d-ebf6-08de4a0f33df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1plWjBHalp4UFZJS1BTeEN4eW9ncWNETW9iYkdyMXdUeU4zZ1h2UGpZYis4?=
 =?utf-8?B?UjIxSGhDUFIyWFJnZ09TcTFxY1Q0eXV1MEdwd1hhUk9XYWdiblVxMmpkZk1N?=
 =?utf-8?B?VXFZWEJnUjFRai9wSnNZQXlKV2djYjI4VGhBNnFabkZ0ZjZFVHk4OHdKb0hU?=
 =?utf-8?B?NldzdTIyYnVObi92bitYL0pUN0o4RkVzbFFGRDVMdWtJaWZzWG9XWS9MbE5r?=
 =?utf-8?B?Ym55bFVrQ2xhVjN1R1BuWEJldU1SV2VSQ2h2WUZyMm9lRWNjcWN1NFQ1c3VO?=
 =?utf-8?B?VXk5aU9DSU4wN2hPVGZ0SnVKQ3dTQndNdG4vR3VsTkJvaERzaTdlUkdIMmxn?=
 =?utf-8?B?QzBlaHlweHR1Qk1oMkJZSGhKQVJJdHhDdWUzSCtSVy9pU0dqSU1pSGRqeFIr?=
 =?utf-8?B?aGI4VllZZWNiR0RXdFFKWlJGcmY2TWg5SS90TU5KN3NNQ3k2aUlXVkM3OERk?=
 =?utf-8?B?V3h2cjNVYktwdVJqdjQyRHMwU01mVUdxTnRuSDNnL1Zlc0xxSlQxdDFicDFo?=
 =?utf-8?B?SkY0ZjhGRUltSlp5NHd5VGIranIvZ252RncyMkk0WWNFNzV0QXlIamFkV1NJ?=
 =?utf-8?B?TUpXeVhXYWk0eTlDM2RXdUlVTUtFYXBYYTE5WVpxSjhTa2lGNjdBQVhMNXp6?=
 =?utf-8?B?NXZWUjJPY1V0SnhMaUN1TyswdXBvYllhWUpXRDBFMVdMdWpEOFdHZng2K2wv?=
 =?utf-8?B?RmM4ZXFLb0RCSkJ5ZVE2aWU1bHVnNHdrZGpiMXRjaUoyYjd2WHI2UkdCTFNE?=
 =?utf-8?B?MmFTbW5ORHVtTWYxWXJjZVVVMC9pM2YxaGN3UjdhOFByQW9HZCtJWjN4V2p0?=
 =?utf-8?B?TjIvMFhuemJ4UWlFWjZ2WHV2QVZBd1dJc0NnMm1JeTZwenBRWXNqTktpazRi?=
 =?utf-8?B?eThPWUNsaVloUFFFVHRTK0FENzBHUml6NjZkcnl3QUFLS1ZJZkkyNXlWQlE5?=
 =?utf-8?B?ckRtTm9QMU9oUzBYR3lEUHorckRIak5pYjl0TlZJdXptS1pWV2xXNHk5ZEsz?=
 =?utf-8?B?RjZjRldKb0dnZkZGL05zcjlSUjBGYjR4by9lY2c1NmVOc0J6b0ZTY1pCcVFx?=
 =?utf-8?B?ZElhTHdRalY5dE02ZU5YbEZ3dzg4RFJkSXR5Z3lVSEVJTzk3TlZrK1FMWG9M?=
 =?utf-8?B?b1Bka1pxL1RzUEI0d0ZQcFZXQ0I1UkNpMFh5SmFQblIrRmkxYlJ2MXYyME5k?=
 =?utf-8?B?Zk44UUZTVWZKSUl2cTlrWHB2a1YxeEVzVnJCNERrclNkbW96YjNmRUtyZVFL?=
 =?utf-8?B?c0FpN3BTNTcyUzZsRnZJV3hVVWlMblh6N1drKzlwcDB4NnVRNGd2ejRjOGpX?=
 =?utf-8?B?TkVXMktwRzdaR3VwYUtmNkpNTzZ2YkYwOGtOM3RFUmwyMk4xRElRWWxrNkxH?=
 =?utf-8?B?OE1LS2w3Kzh1V0puZWRIL1VQeUhoZDlEVm9DRjFxaFZVQjdGY1JXKzFwRy8y?=
 =?utf-8?B?OFpZR0RUUkR3NmJpWG8yTGgwYWtZamc3NG1mdDNzZ0lJU0NDQXhyMkdLa3A0?=
 =?utf-8?B?aEhmZjRkRENsL2lySCtjc0sxSFhqSm9WeG5nSTc0WUMvSmUzZjhXSXZmZlNo?=
 =?utf-8?B?d1pwNDRWSG50U3ZHdHZVK2Mza0hNMUg0NWVtNUNhM2tpcXJ3dXl1VDI0dk82?=
 =?utf-8?B?TlVLdUJBUFRCSUpOUDluY0t2Szh4dXJpU1lFSkZtNmw2aDMwbitKaVdUZnRh?=
 =?utf-8?B?Ynl3TFJ5dm1rN3daWUFGd2thc0lTeTZOODlUdGdNbDdoRUY1YlRHS2pRdXdy?=
 =?utf-8?B?cmpEQ0RaT3FpUVhaalJsWDZVbVhjK05sVG5yN2xCSnFjUGJ4SWtsdVNINjk5?=
 =?utf-8?B?YTl4VnpCLzJqbmpiNjZ5YTZLQlFqc0s3TFBnRzV3NjNQTlBuT1FQOEZ2MDZ6?=
 =?utf-8?B?L2tLOERGL25ZT3lmODNEa0hDajNXRWVaYU5EUHNPUTQxdWlWR3ZOUGI5bHlt?=
 =?utf-8?B?L0FiNmRVMXk3RWJNNTlOY0RUK2cva0FqKzQ5dTlIVm1zNmIvOUkvTVBVOU9C?=
 =?utf-8?B?aURqM0owdGJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmZqYkFBRTVlaENYR0hBS3JhWURsdUJnY3VpcmVWN0E5Qk1JWDRab1hYOS9P?=
 =?utf-8?B?eWZZVUZKMzhaVVNaVUhuVnFDVmNNclJFKzFLNmhCOHhPRDRpRUg2MGhHUnhh?=
 =?utf-8?B?bStqck5TVUJXVmFtbFlQMEVyRkszSUR1NmdKcnE1OGdvT3ljS2tFcEFYbWFl?=
 =?utf-8?B?cFYrQUJNRzEzWG1pRTVubGdrY1lXazFkMXJ2ZGVtNFNZOEFNVGVkeDh4MFB2?=
 =?utf-8?B?WnR5bHJPRG5xamVhbXFzMVdWa1hCRllPaUI4Y0lRb2lBNnp4ZUgwSXlMVGgw?=
 =?utf-8?B?cWYxcWNlOGtNT3pxWFhoVmFGdFllSjRIaThabXRZL2xQOG5hSlQyRzNzWVFi?=
 =?utf-8?B?NjJqNzkzakNHQVQrQTRRR2Y4SU1BL1FiT0tSdXFCejdENU9NRlN5YUk0c3hp?=
 =?utf-8?B?cnVxajVMUFU3c0VYTWJOZ1o1Y2pLSUZrNXJHemErUUlHUUFZTzZybWszN1o2?=
 =?utf-8?B?Zm05M2IySmhYd2tIVHc1UURqdFFYN2ZFakZ0ZCs4WTNJODduMFAvTWJ3N3Bk?=
 =?utf-8?B?RExUcmg5MHBHTk1MMmJDa3hZZTUzV29JWlAvZmNwNDlKbEU3Z2dRdmdmYVpL?=
 =?utf-8?B?VFRtbENrb3lYcHMwczM5SWk4SjI2aWQ0V3QrNnJ3dVNzeml3ak1Fb2Rqbjk3?=
 =?utf-8?B?clp0bFdVWVA3U2ZLVG9uOHNHK2NxRnA2Qm11WmJDZGQ3d1VXNmtHeGRMbE9v?=
 =?utf-8?B?ZHJTUkZYa2FwWWVuTWlYVGx0dThFVndobzVoSlJ2ZWZCMUtnZU5NeWc3c3do?=
 =?utf-8?B?SnAyemlLdmRsbFFGck5SRWN1R3FiNGgrNTkzNDR6SGlkSHlmVzc4MjZyYUYx?=
 =?utf-8?B?VDBHWm80SER1aGk5OUdRaTdjYlZ1Zndhb0NZdEhhUGVsTmY4YXA2bUFGMGZ3?=
 =?utf-8?B?eVdnZnNZZzk5WTMyQzVTTUtuZHRsWkx4Yi9ENG9JWngvVTZNNGhCcVBjL1Zn?=
 =?utf-8?B?V0VwZ3hCOUZ2R0IyajRDYUpXVTFsc2p0QWcwLzBwL1UrQjEzamNSNlBtcUQ1?=
 =?utf-8?B?ZDI5NHpBdGp3cFp5ZVNaOHY4TkE3dzgvd2IzOXJUZG8yeGlSYUlrRURwZ0lN?=
 =?utf-8?B?SDNTalFSTFlsOHhYRVp3T3Zka2F5WXlzRTlkdzBOVnNhUHQ2U0pTelhNSW9j?=
 =?utf-8?B?aytnVnRIMWZsWDMxOWNBWm1SZ01UNnNBdjNDSWtTV3liMnR3VFJHSk84UjlK?=
 =?utf-8?B?aWdVL1FBR3A2azRmanpzVUx1U09PeHJyeUFaYnZmQjdGdXNFWWZOVjQrYlRh?=
 =?utf-8?B?YmlTWFZiekJobCs0TWdPVFBsa0VRUTcxZC93NGpibXNYWGNNYStLOCtMWGxS?=
 =?utf-8?B?SkxzdFFab2hFRWEzL0Exa0JWeVZlNjF0Vlp3eVFiZG1NREs5QlRNUm9CWE5J?=
 =?utf-8?B?d1NsWFY1b3NHdkhCNUxlREtNWmlMU3NoTTZUR0FJVlRKUjdvS1MwL2Nnb25x?=
 =?utf-8?B?bXQ0UUN6L29aTGdlRnROdGpVRXNCWHowMnJaNXFiU2p1c0FscEtuTHN5aVJh?=
 =?utf-8?B?ZXFzdnhyWTFIbXg2Z09pNkhmTnkwVUNSUTFzaXF5aVpPdUhFQ3hBSWFPOG9z?=
 =?utf-8?B?QWV5dldhb0ZJMy82U0V0QXRuSXBtQW5vUGMyQ2p0dERMYS9wWkJQeGc5YnNE?=
 =?utf-8?B?OWxGUk5WTnc2U2FMdlFXdGYrYmZ1aUhINXlpVVVCVlRwTVRla2NBZTB1dzFy?=
 =?utf-8?B?Y3hsSHQyQTNXRE9BUVdmOG1FMGlnUnBSanBqaTcvTk9TWnpFR25lSlNraWZQ?=
 =?utf-8?B?UHVheXJIbGNnSmM2TmdoVXZIVEhZUlhOQmI5OEhSeDVEWG1MUkZMNEwwb1RJ?=
 =?utf-8?B?LzVaMmF5VlpTd0xmZEF3cy9uNGdYVzcwZllNckZLNVNNN2J3VXdvOWNSYmdC?=
 =?utf-8?B?VUt5SHdkOUp3d3JPNUtkUUM4LzBHMmNybU16L21MVytCL28rZ1JOenhsNWtz?=
 =?utf-8?B?ZmxSZzlMYXNOSXNzR3JTdkNvelk2MlgxZ21vaFJHOUh0bGZiWVc1aFB1TTlV?=
 =?utf-8?B?d2I4aFZLTnZjcXJmTWJjWkV0SitrOFlzV2JBcmVVWGovSVBydG12NU9zNWdO?=
 =?utf-8?B?bThIYThLRzZNK3drcGhrT0pTeFl1Mm53RVJudERyUk1ibUNUaEwxMVdMbzdn?=
 =?utf-8?B?WlJmRDNhWWNUcE9zUHJ6OFRML3NRYkVRSitNWTlNQnFRSWFqYVF2OTlZTEl0?=
 =?utf-8?B?UmFiT1lMTWFaKzdpZFE3elVFanROYXZ4eGNoUmsvOFpJb1dvMm1ZbEd3MHZq?=
 =?utf-8?B?UzR5TXdzRU04VUVId1pCdjBhR2E4RHVyc3UyMmpWNURHcUZ4b29YWDdGVzhv?=
 =?utf-8?B?QjVWOHVJeG1YUHQyay9qNkNleXQxL1JxWE5yeG14UEorUnRIRmFWUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f83f95-f598-482d-ebf6-08de4a0f33df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 14:57:09.1931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RMw/RvnS9LEo1r1JYrA1I07Viq22fD9khBBWrTiT8u644UhNHugvUWxCteOmp3vJyTEwoo2KLcM47dtaEmMww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF263E38237
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



On 12/22/2025 6:12 PM, Jani Nikula wrote:
> On Fri, 19 Dec 2025, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> On Fri, Dec 19, 2025 at 01:35:14PM +0530, Riana Tauro wrote:
>>> Xe driver uses configfs functions to expose configuration to userspace.
>>> If CONFIGFS_FS is built as module (=m) when Xe is built-in (=y),
>>> undefined reference errors occur.
>>
>> Perhaps we don't need  this middle phrase. Only the first and the last.
>> But anyway, we need the patch in. I just pushed it.
> 
> I think the correct fix to this one would've been
> 
> 	depends on CONFIGFS_FS || CONFIGFS_FS=n
> 

I tried this but it causes Kconfig recursive dependencies because some 
configs select CONFIGFS_FS

error: recursive dependency detected!
         symbol DRM_XE depends on CONFIGFS_FS
         symbol CONFIGFS_FS is selected by NET_9P_USBG
         symbol NET_9P_USBG depends on USB_GADGET
         symbol USB_GADGET is selected by USB_EHCI_TEGRA
         symbol USB_EHCI_TEGRA depends on USB
         symbol USB is selected by MOUSE_APPLETOUCH
         symbol MOUSE_APPLETOUCH depends on INPUT
         symbol INPUT is selected by DRM_XE


Thanks
Riana

> BR,
> Jani.
> 
>>
>> Thanks,
>> Rodrigo.
>>
>>> Add select CONFIGFS_FS to ensure configfs is built at minimum required
>>> level.
>>>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
>>> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Kconfig | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>> index 4b288eb3f5b0..1094c5fc5bdf 100644
>>> --- a/drivers/gpu/drm/xe/Kconfig
>>> +++ b/drivers/gpu/drm/xe/Kconfig
>>> @@ -46,6 +46,7 @@ config DRM_XE
>>>   	select WANT_DEV_COREDUMP
>>>   	select AUXILIARY_BUS
>>>   	select REGMAP if I2C
>>> +	select CONFIGFS_FS
>>>   	help
>>>   	  Driver for Intel Xe2 series GPUs and later. Experimental support
>>>   	  for Xe series is also available.
>>> -- 
>>> 2.47.1
>>>
> 

