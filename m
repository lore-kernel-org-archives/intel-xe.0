Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB37D7789E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 17:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CE710EB86;
	Fri, 23 Jan 2026 17:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RafC8Gp2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469C010EB78
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 17:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769190893; x=1800726893;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=585sVKFERcm69iLVeHFOi7D3zT0h9LCQR/eIA8bKxJk=;
 b=RafC8Gp2K3yMxZQMpCo1eZ2XOpGm4RhrMvWZEM8fqPxm3nOo5kGHjIxG
 m0xxtYndruJV9sU2MQygRCxmqKT1TxnAHDV09O2yh5WIfMXPu+CEB80qA
 HL8EIk3uPqOIPir911t07w84AXqaHONJm2W1NMsa0M4jUnCutff8o23V5
 xuhASQ7ebbZpHZtk8HGHIVjl0dm1gfKT0C0CMrDU+ceiIDQIf/QCt5dz/
 xH4lulaISqCZCttirvmYY8G5Eg3MbjoLUp7yCidv4y006k8dpwzeRxlz+
 IiydgIxK4CTW4+lYZQZMl0NSUvBT2Dnk+SqffcribQ3QsTJN6mTjhZ/2Q Q==;
X-CSE-ConnectionGUID: snP179hQSqGsNkI/1R2mMw==
X-CSE-MsgGUID: Bv+vsrSeRtunU2zDoPvq7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70535913"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70535913"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:54:52 -0800
X-CSE-ConnectionGUID: 6kRlQEQ4SDqF70w2ch+ceA==
X-CSE-MsgGUID: TNP7vA6rQ7+33aBat/GpJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206892841"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:54:52 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 09:54:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 09:54:51 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 09:54:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLY81xYamLyWd+dK2T5BphGVHO4mWcRtljUu7JUoUPNt85Oa1aGM1ABfr5CAzQ9k2daKaAxDi4Z+iY1TcpEkRBt5Obw5kJ8NhpnIaMdRpczeig07QkL/yQQxeW0pLZLhcnTkBQ5hqX0Q77NxlBoR+5QyHc8ZYAkZsJbLLfA3avSn4b2YHPeD9Pmje9LuYPBX7JZ3qPBhMUEBdtU6njk+JLerGEQALFl3Q5XmO8H6YCjDudb88W16vBPUGjtioxy6RiHxlGmsgvp8CyfhNeUThQVe3JIqYRxUPawnuBr6Yv9MEpcxdHyTnLBS/EdvyqpHttiDipcav1xPPIxGPOYQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gICqqnBH2K9NGsELNnSCVOXgzoINgkMIFGFFYWdopE=;
 b=zSeYWCuP+aOo1pthOdnWKhIOy5BstWsYMMcP8HUpOiS85aUK9QxCSBXx1gyrlHdog/aRvjSUD0Qlvs0CPxW0kICwKgxpi9iYs60xq57ZFxsNIwgYONl4qonVS1xTVNcbZZ0hZjvUkKy8pEmqbekMDq5I8Nlauy0AheJgV7khREmdUWtClmpgYHp02XdBm9UNarZF/8m0lmxFvXcLQiki7YgINRxpkpA73JK2hZ72WH3K5Vs3KJwGF5UCNnyse8IkOViLFM+O+ytuojvWeW4HB+pPIEiEEY87tgM6SyBDd6DTeJsWQXYijqPCCrFtMvGQQgG45t2WapIVhaoGkwZsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 17:54:43 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 17:54:43 +0000
Message-ID: <847f9254-6712-4fc0-8bac-48c91aa2d0a7@intel.com>
Date: Fri, 23 Jan 2026 23:24:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260116103451.304716-4-sk.anirban@intel.com>
 <20260116103451.304716-6-sk.anirban@intel.com>
 <5d9b546a-421d-4006-98ea-a2e930f935fe@intel.com>
 <73520ae2-967e-453a-a7ec-dfa0b2d6a080@intel.com>
 <800a6f03-62ea-41c7-ae7b-d25606ccb708@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <800a6f03-62ea-41c7-ae7b-d25606ccb708@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0045.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::11) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CO1PR11MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: eb526b18-6efb-41ed-f795-08de5aa87d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUNVUlZ6SXpYbXVnK2dUOFJwcWtkOGNWK05FL0xkcFNHQ01BSmdPbWlzU0U5?=
 =?utf-8?B?blBIU1NWV2V6ZHhBQThYYW44YnJKUmJHVGV5SDRLNk8vbEJsZ0hjdEdJeHg5?=
 =?utf-8?B?WUk0VURhUkZKdjF2d2lBd285NHRLR1hsRENBdVJQdzRESnhiajR2YWpyVysr?=
 =?utf-8?B?bi9FMVppRU1wd05wN0M4SEs4M3FFODkwczY5bk9NSjgrZkREZjk2ZXZBYndE?=
 =?utf-8?B?SmtaSEFIbHJKK1BvQlBqTkJQUlNmSDE0M05kaUtYYnNiUEw1OUdsU2lvWGRB?=
 =?utf-8?B?cjhBcTZ4bmRJVmlFTzZiTTdiYnlKZUhIZC9aSmRHay92anFsY1hucnh3NFUw?=
 =?utf-8?B?SnNqY3cxaGEwZEgwNnd3ME1tWDZTb1JRdEZZUDdKME9LKzZERzVKSTgwME1u?=
 =?utf-8?B?UGR2Nm5Vd29HN24xdTRoZ0V1UEd6NTE3c3FkeHE2TkVhQTFSRCtRNmorQkQ3?=
 =?utf-8?B?S1NhNnV3cVZJNW9ZWk9SUzAva1JIRUROR3FTSFR1TjNFM1cyMlZUbncwbGt1?=
 =?utf-8?B?UU5FbTZhUDZRcW03YmNoSFlySWFSck5kTTltaEIraEh3bkRDN3Z3amhuallF?=
 =?utf-8?B?cWVmNEJvcjN3NU5QdzdCUFJZbTd3YktJd25McU14OTl4U2h5d29RVDRySlpr?=
 =?utf-8?B?ZHRWWnU3eFN0OHpWaGlteGpzMUl2NThrU2kvODdjR2thR0xQT1pkdWoyUGlx?=
 =?utf-8?B?eEpoTkdVMHo0NS83MUJHRUh1RHdoOU9rZk9xNWVXTHQ0R3VpbktwaU5GTGg2?=
 =?utf-8?B?S0JKL2VRMzc4R1VxR0c2cFNXQ1NoY0R1c08zaERSWGRqRXRHLzJZWlVzeVZq?=
 =?utf-8?B?bHVtaDUvT201VDRGTFJHa3Y1UmZ3RU9jZDZJMy9HaC9FcVdaVW53cnd4dmFz?=
 =?utf-8?B?ZUx4aVlMVUYyQjROUURPY3V6alFPUGs3RnYyVlVwRUNzdGtiamluNS91cDZS?=
 =?utf-8?B?VG1kUVFZWlFnZERpcVlzY0tyMG9CSU9QdUJ2NDNGVm9qcDlvSDlCNVVTblFo?=
 =?utf-8?B?ZmZiV2hhN1RybFNtczFKTG5zRGUyZjRaUEZYeEJ3TFQ3UDhNU3pwUDFyeEVG?=
 =?utf-8?B?Z1RXbW9pUHcrQjJCNmw3L2Zybk5DSmZXOWxrRjJDVlBWejV6bERUc0tLd1Rp?=
 =?utf-8?B?UXp4WDFYL2p2bjJCL1pLc0MvR294UW10ZTVWUFRlQU8yMk5rakFiTkRRMzhT?=
 =?utf-8?B?dHdvL1FielhJbkJqTWVrSGFiT3dWY25ramk5ZjhleVYvTVFFZXRlcXlxVDVT?=
 =?utf-8?B?WHl1S080Yld3ZlJrUnk0RlJ1SEFrdmd3dVJ0dGs3ak4yRXpPUUxuQ1ROZjd5?=
 =?utf-8?B?TXhYZVN3Z2hveml1REVSaFBGWDFUQWUxaU81NXRUcTZUcnpSOTN6S25JQ2lF?=
 =?utf-8?B?Wml0S1cyL2V5OTdyRTB1Tzlya0kvbWprZU53M1d2WVI4b2plZWlnMFg0bkNL?=
 =?utf-8?B?RFFKSU1EdFlGcVU1OGVmTzJ5UVRiWmp0bVJMNElwaUhhM0J5T2JuTTRWSnVB?=
 =?utf-8?B?dldETXJGb2NMQXpmKzg2THYrQjFUak9ZYUdBSUZoRm04L2dKbUFiOXg1eXQr?=
 =?utf-8?B?NG14Y08wd2laL2NZdkZMeDFLd09icS9UQmgxRzZtT2ZwY0RiS3NnRWFtTmpJ?=
 =?utf-8?B?NFNKMkgrNGpoKzAxTHJIYTV1YU5OTGZkY2N1SFV4d2xud2kya3QyM25PdFA5?=
 =?utf-8?B?RG5qVlNJRHQ1QStheW1vYm1oTDRqNCthdkk3SVFaRzlLeDVyNmlLTE9sWXJL?=
 =?utf-8?B?TXNnTWlmRmhBTGZHSk5LcXhKbHlINFVPWCtwaWcwZnRqekdkMExOcnJVSzVO?=
 =?utf-8?B?SXNRYngrNC9KNVZzZHU5ckxsYk54SGJaL2pPZXNRUHQ0RkUrdDN1Zm1QNHQ5?=
 =?utf-8?B?ZVBuUzB6czFmRHdXYlZMNlpoVnVYTHRPYWkxZmpGLy9teEZHcUdRSlhkUlk3?=
 =?utf-8?B?UmRkTkZGcXZ0dzVKdjh2a0FqS0duWnFZYnRvUmEyM0hxeUZqNHYwNXc1NXQ4?=
 =?utf-8?B?eS94REQyaEhYTHQzekJuZWZSS0Y1ZG9SV2M3Z25FY0pVVUVnN29WeXVZVmhT?=
 =?utf-8?B?alMzRjd6aUltTVBwR2pSbWd3a3puMXN0Z2JuMmE2ZW5uTTFOQi9IMlVSbnRx?=
 =?utf-8?Q?A1KI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlFTVmVKOWhocUpXZHhCTTVORlA1SU5yTUVHSWpVNU1KYTJyM3oxZTAyTTRw?=
 =?utf-8?B?MDYyMnFTdVJxOXAzeS82OW5XbXM0YkJRRDhITVVKRHlkb2wvWkhveVNMbVA5?=
 =?utf-8?B?bFIwWHc5WFIrYndFaTE1dGV6YjBpTkxNODRjem91MHpJZmVqc2xaTUdyTHE0?=
 =?utf-8?B?UEhBajFtakFFcnlmdG8vRGpjZmRJK05NRzdCQnhJZFM2VkozM09DeDJDck0y?=
 =?utf-8?B?c01kMTVXTXBDRWVpc21YSjFkVE5NRmE4eG1JQjRMMXNsVDVZVXM5TmgvVFM4?=
 =?utf-8?B?NnpzTUJqOWErb1laOUF0NkdFcjc0Z3pVc0hUbEFqc1krdjZZZXFoWFRHZHZ3?=
 =?utf-8?B?dlBGMnRzUUpEUDRWbE5BYnZFdmY1RkhqaEZmQWk0c0w4TVhKUWM4ZXdzdEw2?=
 =?utf-8?B?dmNCWjBCVGU1SmVTNFQ3TTVFTG9JeW1HK1JyNmpNS05WVXcyNC9vLzkxVTJT?=
 =?utf-8?B?L3B0SWhMb3pwNUlqVUlsOXlDclI0Um8rdy95N3RXcHAySm05RldxM3ZIeXBp?=
 =?utf-8?B?dC95TjR0NmFVekRyWUoyWGxsOVBhTkVadG93ZC9mRXZZNllna2xvTHUwTWVQ?=
 =?utf-8?B?UFFUZjZvakJFU2lmeUVReEp1azZ2dGxvK3RzenJiSUlwTVNObGtoK1l3NEVQ?=
 =?utf-8?B?YkhjbnN2VWozak91U1lUMUdRTjZ5SlE2bSs1Q1hqWGUvQm94MDZHK09KNGti?=
 =?utf-8?B?RDQ1VTg5UmFKaEgvZ3FDaENnaTlKQVVTSG1oR1hOSkhLaUhJTlFQVFVSMkcx?=
 =?utf-8?B?NnBvRVBST2NMMG5hSUJSTFZMdUpSTG9wdEZNbVNFM0kzQWdaT1NMQWhaa2Zs?=
 =?utf-8?B?bEI0aFNyQjZQTlBJcVl6WnpPQmNTd3JrYmZzcldUSlRvcWE5c29VQnNCcFdQ?=
 =?utf-8?B?OGVxRStvNTdSSnBPOTljZE1MNjhPWUxIRVV6TVNndFZmR3JrWUwvUGIvMkw3?=
 =?utf-8?B?SXdmWFF6NTNkUzJFZEdxMythZU1VMlAybDVKMzZGWVBJazZRd3BIbmNGRjZV?=
 =?utf-8?B?NlF6Zy9YRnpkcUJIZGhLQlFHNTBnRXVZajZMZDA5RURSNnllWWR0QTl6aXlO?=
 =?utf-8?B?dWVCYWlzOS80ZmVkMUl0YjFOcmtPdWxqWUU0S3huNHRubkh4T20wbGZKMkR0?=
 =?utf-8?B?aGNSUzY5Q2NqcjlBRGZ2Q0VYeUJlVjkxa0FJcC80VXR1Q2hONW1iR3V6ZlJx?=
 =?utf-8?B?WXpMUFFHQW04OVQ2Yys2Vnp2c3k2S0ZHT0JrMVJ2cXdEbk9IazBJSko0alZI?=
 =?utf-8?B?Uy96SUYvV2JYM3lxazVHMFduY0hJWEtjV3N1NnUzaC90WGphMlljNVZIK2JY?=
 =?utf-8?B?cGplR1dFdlgxaFQ3UnZYNEVOdFUrQ2t4QnNYUmc2OWp6N2FvYlJ1R0thaFBN?=
 =?utf-8?B?UmcvYmhDays0WC92ay9uaFBSeEUxUVBTdmEyZXRGUlFpUUFJMnRzN1UrU21j?=
 =?utf-8?B?UENyY3ZVbEJoWmM3RVNsd28wV3pyVWZkUzZJeEtkSzZsRnpabEtEUFlWQXYw?=
 =?utf-8?B?d0hDWXMyZHFVSGs3eXMyS0o4cVorZmExS1drbG1vTWVRenkzM20zRy9ZWWRR?=
 =?utf-8?B?RktjV3FkQVNoMHJZamQxM3p5THNrOE1SOHRNVkdZcFBta01ML0s0RkpxNExN?=
 =?utf-8?B?YzhXeW9FdWd2cDBYZkV5bVpLaUpqVFlOQk9nVmNVZktOSHU1T3dpa2lMNFp2?=
 =?utf-8?B?OWgweFV0cmV3TTBIalZzUUs4RUE5ZzMxM1VTbkhRL3B5b2tjZi9hd1hwN29q?=
 =?utf-8?B?VElnSjlDRnhIa2t0aStZWWJaVENxWVB3V29tN2ZpaUJsWHdmenpPWVBsencz?=
 =?utf-8?B?bEIyK044N1J2NHlSb01DSWpKdWM5U3FHU2ZUQkJIcHdwQ3VOVGpPbDlEaVpS?=
 =?utf-8?B?YVZpbWR2R2hxb2NIQVFyM1JlcE1rV2dLcG5CVTlXRTZVQlBmVW5zOGpGMkdJ?=
 =?utf-8?B?Zy9ZWXF2NmlFMXBETWo1VkpNS2txK1NOR1huekRuK2paZmh3dVh6U0xGcW5s?=
 =?utf-8?B?cW9XRXBIUU9WMi8zVC9RTnpTUHlkZE90QmlJZkFMdHNRMHlSRCsvSDRpRmRV?=
 =?utf-8?B?Z2xzY0NaMWRUTTA1b3JZZXZBM0p6UnlFMnBjZUZSVXNEL3dkWU9HVTdQOVFr?=
 =?utf-8?B?bStob1gwVktoUllCVDhDRlQwUXhCMUtrT2Q2eGovS1grUThmLzIyWUd6bG5Y?=
 =?utf-8?B?Z0swb2o1LzJpMW5HWWpCMVpmbCtkaER2SFZ4aU5kK1kwMWJ1dEN3Y1N5SXVV?=
 =?utf-8?B?ZkEvSmZSRXJpbkhOZ3U2ODJkTmwzcDZUQ2Y0MGY4bGVmdVVFQ2JFZ3dDN3BR?=
 =?utf-8?B?OGJLNXB3d1lRU2ZmZlpwNkFzVEVPQ2cvYUNHUVJZVExRSTlDRWZlZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb526b18-6efb-41ed-f795-08de5aa87d46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:54:43.7625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DH1YInwq37iH8yu9wzdB4hnO51WHJ0YAhX0lrHBRbrh2fCiokF+lcIe4Rc7bnOX6Ap75SAZ9KJ4ntxZ8gwCwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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

Hi,

On 23-01-2026 10:58 pm, Daniele Ceraolo Spurio wrote:
>
>
> On 1/23/2026 9:12 AM, Anirban, Sk wrote:
>> Hi,
>>
>> On 23-01-2026 03:12 am, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>> On 1/16/2026 2:34 AM, Sk Anirban wrote:
>>>> Prevent GuC firmware DMA failures during GuC-only reset by disabling
>>>> idle flow and verifying SRAM handling completion. Without this, reset
>>>> can be issued while SRAM handler is copying WOPCM to SRAM,
>>>> causing GuC HW to get stuck.
>>>>
>>>> v2: Modify error message (Badal)
>>>>      Rename reg bit name (Daniele)
>>>>      Update WA skip condition (Daniele)
>>>>      Update SRAM handling logic (Daniele)
>>>>
>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +++++++
>>>>   drivers/gpu/drm/xe/xe_guc.c           | 30 
>>>> +++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 ++++++++
>>>>   3 files changed, 47 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> index 87984713dd12..c9cb02f32f5a 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> @@ -40,6 +40,9 @@
>>>>   #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 
>>>> 0x76)
>>>>   #define   GS_MIA_IN_RESET            REG_BIT(0)
>>>>   +#define GUC_HASH_BOOT_CHECK            XE_REG(0xc010)
>>>> +#define   GUC_BOOT_UKERNEL_VALID        REG_BIT(31)
>>>> +
>>>>   #define GUC_HEADER_INFO                XE_REG(0xc014)
>>>>     #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>> @@ -83,7 +86,12 @@
>>>>   #define   GUC_WOPCM_OFFSET_MASK            REG_GENMASK(31, 
>>>> GUC_WOPCM_OFFSET_SHIFT)
>>>>   #define   HUC_LOADING_AGENT_GUC            REG_BIT(1)
>>>>   #define   GUC_WOPCM_OFFSET_VALID        REG_BIT(0)
>>>> +
>>>> +#define GUC_SRAM_STATUS                XE_REG(0xc398)
>>>> +#define   GUC_SRAM_HANDLING_MASK        REG_GENMASK(8, 7)
>>>> +
>>>>   #define GUC_MAX_IDLE_COUNT            XE_REG(0xc3e4)
>>>> +#define   GUC_IDLE_FLOW_DISABLE            REG_BIT(31)
>>>>   #define GUC_PMTIMESTAMP_LO            XE_REG(0xc3e8)
>>>>   #define GUC_PMTIMESTAMP_HI            XE_REG(0xc3ec)
>>>>   diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>>> b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 44360437beeb..42658a409556 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -900,6 +900,33 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>>>       return xe_guc_submit_enable(guc);
>>>>   }
>>>>   +/*
>>>> + * Wa_14025883347: Prevent GuC firmware DMA failures during 
>>>> GuC-only reset by ensuring
>>>> + * SRAM save/restore operations are complete before reset.
>>>> + */
>>>> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
>>>> +{
>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>> +    u32 boot_hash_chk, guc_status, sram_status;
>>>> +    int ret;
>>>> +
>>>> +    guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>>>> +    if (guc_status & GS_MIA_IN_RESET)
>>>> +        return;
>>>> +
>>>> +    boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
>>>> +    if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
>>>> +        return;
>>>> +
>>>> +    xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, 
>>>> GUC_IDLE_FLOW_DISABLE);
>>>> +
>>>
>>> The WA says that we also need to wait for the status to be "ready" 
>>> after setting GUC_IDLE_FLOW_DISABLE.
>>>
>>> Daniele
>>>
>> As discussed, a GuC reset can occur without firmware interaction, and 
>> during RC6 exit the GuC load status may transition, meaning it will 
>> not always be INTEL_GUC_LOAD_STATUS_READY.
>>
>> So we’re checking GS_MIA_IN_RESET instead. I just want to confirm 
>> that this is enough to ensure FW is present before applying the WA.
>
> The GS_MIA_IN_RESET check + boot_hash_chk are enough to determine if 
> the FW is present. However, waiting for the ready state is not about 
> confirming if it is present, it is about waiting for the FW 
> initialization to complete after we've confirmed that it is indeed 
> present. Basically the WA is saying that we can't do a GuC reset while 
> GuC init is still in progress.
>
> Daniele

Understood. In that scenario, a timeout check on GUC_STATUS[15:8] = 0xF0 
should be adequate to verify that the status is ready. I will add the 
code block for this.

Thanks,

Anirban

>
>>
>> Thanks,
>>
>> Anirban
>>
>>>> +    ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, 
>>>> GUC_SRAM_HANDLING_MASK,
>>>> +                 0, 5000, &sram_status, false);
>>>> +    if (ret)
>>>> +        xe_gt_warn(gt, "SRAM handling not complete 
>>>> (GUC_SRAM_STATUS: 0x%x)\n",
>>>> +               sram_status);
>>>> +}
>>>> +
>>>>   int xe_guc_reset(struct xe_guc *guc)
>>>>   {
>>>>       struct xe_gt *gt = guc_to_gt(guc);
>>>> @@ -909,6 +936,9 @@ int xe_guc_reset(struct xe_guc *guc)
>>>>         xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>>>   +    if (XE_GT_WA(gt, 14025883347))
>>>> +        guc_prevent_fw_dma_failure_on_reset(guc);
>>>> +
>>>>       if (IS_SRIOV_VF(gt_to_xe(gt)))
>>>>           return xe_gt_sriov_vf_bootstrap(gt);
>>>>   diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>>>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>>> @@ -73,3 +73,12 @@
>>>>   15015404425_disable    PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, 
>>>> FOREVER)
>>>>   16026007364    MEDIA_VERSION(3000)
>>>>   14020316580    MEDIA_VERSION(1301)
>>>> +
>>>> +14025883347    MEDIA_VERSION(1301)
>>>> +        MEDIA_VERSION(2000)
>>>> +        MEDIA_VERSION(3000)
>>>> +        MEDIA_VERSION(3002)
>>>> +        MEDIA_VERSION(3500)
>>>> +        MEDIA_VERSION(3503)
>>>> +        GRAPHICS_VERSION_RANGE(3000, 3001)
>>>> +        GRAPHICS_VERSION_RANGE(3003, 3005)
>>>
>
