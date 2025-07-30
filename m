Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8762DC83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 13:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502A210E69F;
	Wed, 30 Jul 2025 13:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRujXu+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BDD10E69F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 13:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753880933; x=1785416933;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7kdsbJ7tuwMidKMm5jg3F78ohpZX/iABj3EJGpsFGgM=;
 b=bRujXu+EnxR+fKOaSmEPmGgggK5xAZe645GUlp1rusyoGB3OC6mcAAhH
 L1jA+cTscksCWFpU057BRrHdmK/olj928aHKJWSgVZKnurtyEgoGFnwqj
 gHIQomRWJpx4frSfFbpCpGPcM2dfQxGiKSeUNZ+JDiJuCOOrxPTYhhQ/s
 ck4hStzc5vz/ciTzZI8k0CApRNPV4CyNJcZI2L4Pnec4eTcguosyoTBbd
 G95c2UhmNXB7pTRl2xl3e/8TGJ/BBW8DeQcqOHjWaKPVVpl1k09NjNXVB
 dSLTXAHRuDcxjIm++mWfaeguS0e7pHJRqs1w9B2HEjDpfnrTVPFzmyKR0 g==;
X-CSE-ConnectionGUID: FReadw03QQ+CEnfFgs0Sjw==
X-CSE-MsgGUID: yGYovUS1Rb+4OO7ms8zd7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67537213"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67537213"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:08:53 -0700
X-CSE-ConnectionGUID: K4ioHF/qSwi9ICwn3iIF6A==
X-CSE-MsgGUID: mIgzACyRSkGz+5ANc3A62Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="168285484"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:08:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 06:08:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 06:08:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.88) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 06:08:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IB2VPdWbIBFQFkrsYcNFZcwtqkrg8tduJUY0njcNgsFvPq7NURVriR21TsqHNyUNBVGPoOacUwTJZeClFepAdhaNAtCWXNP8OYlEAHH8Jvumw0oTvh+Izudp1XgXh5J0nOYFTlD4bPVHwzVSTmKu3Xnrycn29P5B0OXhvCu6G4x/dsCwVM8OvJhI2mhOeatv3Y/R09KFSYI0NZNsLJ3CtWUFT/P9A4Qbbw1QhhSZONvhVxTuU6jlVtmH/CoFz3T+btNlyopNwgRFtzH6N8+vIKRyEqIczkSh8gKldnnzgm7c9DDtJhg3ltr5yzck6n+mQpbBUIiyK/1TaKmcE+QGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alTyGZTc3wqzNQ48F3uJwR2Yq+i3LfFOGDuhdZnS14Y=;
 b=Zdz22EuAaTFs0wDO0QRg5r02SKKYoN3INrsuOONsmp9v7hcNkoL31VHQIDozwKajexsKgzWiAx4ghpGzOsYViK01OJ1izFF3B35g4nDj8DkFSHj7GCZvHq/sUZBEYR0zWW2TmshF/8yCwUfmVuZSB9flfWNCYZGprpHSq1Wts7HnlYPoj5iZXH+O74nzROXAkTFp61UisZahPf+FmuFV2WgjoBx8CoAv8iWeSDyCc4D5eDXBzu91zMaQUGI9boRkvHMXruFgPYN6IFLNIYTXoEBlsJMgH6wVDaNmEZuZDOaYxP1AUwyTn6bC8OAeUPWP6omKlPqSwwEw6j2ggZL2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA4PR11MB9203.namprd11.prod.outlook.com (2603:10b6:208:55d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Wed, 30 Jul
 2025 13:08:50 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 13:08:50 +0000
Message-ID: <e1dd1213-fe6b-417a-8146-e5007d6b50e2@intel.com>
Date: Wed, 30 Jul 2025 15:08:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/xe: Don't update wedged mode in case of an
 error
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, John Harrison <john.c.harrison@intel.com>
CC: <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
References: <20250521122511.5760-1-lukasz.laguna@intel.com>
 <20250521122511.5760-3-lukasz.laguna@intel.com>
 <6783b88c-cdac-4730-be80-716ffdfd675a@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <6783b88c-cdac-4730-be80-716ffdfd675a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0019.eurprd08.prod.outlook.com
 (2603:10a6:803:104::32) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA4PR11MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a4278e-f7ff-4e30-b195-08ddcf6a39f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2phSnpSdTFBekNkQlVpRUd0RytkY3BPQStIZEtJbDdKNWZmcUczby80eWNq?=
 =?utf-8?B?TDg5SUE2ZkZ4bXVIVWY0RVoxekZ5TmxrcVoreFh3NTV5eG9Yb3dza2FDU0hs?=
 =?utf-8?B?Kzc5Z2R1RHdEUHFTVFVoQU55ZktyM0M5ZDBzcGhKV2V0akIyVkJOYXdyOUxC?=
 =?utf-8?B?eGYrVCtCSGpLSTNQS3lZc1JLc09RaWtJKzNjSE1JUUx3QWpXLzJlazl5OTI3?=
 =?utf-8?B?MGlrVzZ5SkVsa3pmUVo4WFhwSyszYmdKejBpNkhYZkJ0d1hWS3dsQkhmc09F?=
 =?utf-8?B?UVU4dVp0eThvcTJ3SXlITUk0NFcreVhSUUVsbHNlL2RuNUh6dkpXQzBBdkFw?=
 =?utf-8?B?cGIzWG1aY0p5VG5IQUFlS3RuUnAzeVVkRDdINkc3cXVodVdpOWt0eDQ3am5K?=
 =?utf-8?B?ZnlwNlhRbU5LeDg3U251c1RRTjNPVkkvYTl3VE9nUHhrdEFiOVMwZzhLNGFn?=
 =?utf-8?B?QzFzZDJaQXp5anpoZ01ZZTZUYXZBZzBxbSs5Yzk1R3JDeWJIeTJwcThjeEMr?=
 =?utf-8?B?bklCVGFNVzFESkk0RndJWnBBc0tCR3FORGZrY3dzYk5vZ0FJaUlsb2FnZFIw?=
 =?utf-8?B?cG9LaUJ3aEE4YVA4aTg5cjY1U0Q3VTg1N3JkZGpROWVKbWo4RjBzUHAwT05i?=
 =?utf-8?B?T1RueDhJWGhzSkpMc2pxU3NXRHJVNTdNVG9CS2FGalRjVXU3NUpVRDNpN0kv?=
 =?utf-8?B?UVlnZjcyYXJRUjl4QkhiU25qVDF3UktVTlczUGFDd205VmdQckxJR0dPOTFh?=
 =?utf-8?B?bWxTcVlSaFVRV1BYSjh5WThQMytwZjA4TXN1RUd6OCtSL2RJWE5mdFBHZHA3?=
 =?utf-8?B?SjdXdGNudkZwM0NCQnhqYzBBQU1WL1hacDRoYnZaQVhnWHdwNnlvTDBMQ3BI?=
 =?utf-8?B?QlBlWUVNSG5TQ0I5QStVVkRlQk9CcnlHa2VuZE5ZZFg5WDF4cXVxc092dkFS?=
 =?utf-8?B?UFExaGVYcG9nbk1HQ0d0aWJPRjZ1TFp3amlyRkJjMEFMcUh3M1BmYVRqelBx?=
 =?utf-8?B?SFROamJRYkw1K3d5OElXVEFrUWlLQWE5Z3JXeVppeitldXJaem45NVVObCta?=
 =?utf-8?B?OEUrQ3A0em4wbGI5SzE2aGxlVjl5T2xDWk5aeTNXUit4N3k2RzVpUWd4UEgw?=
 =?utf-8?B?dmxGejhReXlTVVhTR0tYN1IvbXYwLzBQNENMdFdDVG5RbXIwNHhvZDdGdVpO?=
 =?utf-8?B?Z3MxcFdJM2NkL3BpcExvNGlCMXZIREJPR3ByTGFSb1F6SGRtZ3NDSFV1QXFO?=
 =?utf-8?B?NWJBQXR2eVg1ZFpneDc1eFdCSllobnQ3SFJLMjlkS0FIUnQrQVF4TnF5dmhY?=
 =?utf-8?B?UHh1K3d0NHRLa21GNDE0M1FRY2Jab09IaFRSb0JQN0dDS1IrR0wyeDFXd28z?=
 =?utf-8?B?UzJOeUgvRXVVL1lBQ01xV04zcHlwNGxCZTluZGFSSS81cUY5eFNrYnJPQ2d1?=
 =?utf-8?B?VUhCdGVCai9HN2pIcmZSM0UzNWdIWnVLVzR5M3lBQTR1bUtmczg3bzNnOG5w?=
 =?utf-8?B?K0dDWFV1K280MlpmdERUUWJ3cTd6M1lNUkwvUzI4UXpBTVcvWHFKYnlQRU9F?=
 =?utf-8?B?eDJhS3NmTi9DNkdSV0RuNlY0TEV5UjRVY3d2YmM5MjAxTjBBMUt0MnZwcW1t?=
 =?utf-8?B?OHF1UXdRM3NXejIxdE9iYlUyYUdHMEJ6VGdyK2grQ3VPTFVlazRyVk8zUXNN?=
 =?utf-8?B?amord1FzdDlNaWtIZElDS3RZSFFmblpETERGaUdIRmFRL3BqK1lnbzNqelFQ?=
 =?utf-8?B?TDh1SmswNGlSbE02bDhhMjdVRnRraktMcE4rRENvUEY3T0RLT2tGcE40N2M3?=
 =?utf-8?B?NkRpbmJWS3VsdTBhWE9acmx4eWh4TjRvRUJHa2NYbFM0dkdTTno1NUMxMzZF?=
 =?utf-8?B?Y0NmaFVrdDdJYUZ2ZCtFbmMzb01NTmJZbGl6MW5hYXlVUDdZYXZHaGJ3WEw3?=
 =?utf-8?Q?C6hMhwwM944=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE1VaG52aXFCcTJqOHBtd3BvRnZZczFVbWNHOXliblBOaWtwcWQzVHNsMDRY?=
 =?utf-8?B?a1VGYUlJOW80RFMwVW9WMStLSnJkR2NBaUhvUkgyWUFVcHFPVENhcjBIcW12?=
 =?utf-8?B?cWlVNGx3ekpLK0JBZWZQeFBoMm9aRDlsT0t3eWRnYVJ1czA0cUZqQkJWaVlT?=
 =?utf-8?B?Qkx0VzE5TTN5RVZuaWkyUmV5YnNtNE1ieDdKN293ZWpBVnZici9DcWx4ME9E?=
 =?utf-8?B?MTZDMGFwZFJvM1FBR1MzMXVKZkNoenNoNW1PR3JUZDJ5UjdVZGNPWjF1S0Q2?=
 =?utf-8?B?Njl1dndtZnJpcTJUZEpsQXNVT2x6QVB5NGJRem9lZHVkUGtKWGdzNmFRUFY2?=
 =?utf-8?B?ZXJIcW5XeUtsdmxrY0NBVllyQmhrZktzWXY4d1ZvWG1SUHdoR2kxT2FROUNl?=
 =?utf-8?B?bWp4d3pzMVFpMVJGcTlKZDdpbGlOTzlWSXcybkM4V0lyVDFLKzdlOGZkZjF5?=
 =?utf-8?B?L3BXejBFQUhzamNxTTBnSWJLYTEzalNPQldpYjJiOEt2Mm1FSUNNRUs1K1dD?=
 =?utf-8?B?SnlFVkVSNkswR0lKNll5SS9JNU1ZTEJuT25nWTRGa0xKdlBxTVBLRm9ZY2hB?=
 =?utf-8?B?anhOeVZRcFR6WFZqNDZER0xzUXhabkFwaVJRM21ONDdjQk1WSnRiZW1ndzFE?=
 =?utf-8?B?endud2hXK2cxQkQrcUliSDgzV2JvREIrUk5hS3oxSks5L2NkdzJ0WERiYmpG?=
 =?utf-8?B?ZlB0RGpzYzYvbDVOWVVvT0FhVVUxQlMzZFJQMW5rUzFmQTJWYVJ3aGplM2hJ?=
 =?utf-8?B?R0hkQURFbHh4OU0vKzY2STlPelBRaEo3SXlDYlJRa1ZqRlA0RWs1S1VVWllp?=
 =?utf-8?B?cW5JUi96anBXZ0daMFhWbWRuR2FkRjVzK2t6SmRqNXVOeWhaa3lYSFdyaGRY?=
 =?utf-8?B?UTBvb0FuRXpRQUszdGVkTERiYS9mVEJTbWFaQnl2OXIzZ1lrTmZkeWQrN1lK?=
 =?utf-8?B?c09vSjhJU0lCTXVoeS9JZ1J6OUFCazRRdkZTRCtkdWpSMDNCVTFHd2h4RldO?=
 =?utf-8?B?YnNYM082VkFZaHZKZ0J4Yys4bjk2dkxPNHp2bUV1cjZOR1RIbE50c3FuZk9w?=
 =?utf-8?B?WWpnejJrZE1FR1VxSTFFODhrY2hBNjdOclZGWTNMUXp2RjhINUxhbFdQUUk5?=
 =?utf-8?B?aTZKalgvM3RmalhsaDZ5ekI2czZPVXdDb0RrLzRLV1ZTKytPRERKdUtBbVNH?=
 =?utf-8?B?TGhkR1pQb0hIVWNtdnBRRzBFbHQwVyt3aUh4WWRGMTRJUmhxU3VjenRLeHNB?=
 =?utf-8?B?ckkzWXJaOFM0V2h3SjhKeGo3WHM3MkhUaVFwS3RyUVJ4a09BYXh1S3FGNmJL?=
 =?utf-8?B?N25VME03R1p4S2p4RzM3ZytxeXJwcmptSENzT2JLdENMZ2xrNzI5WlFUWS9K?=
 =?utf-8?B?b1VsNGw2SnVnWWgvZ2hpUzU4RTlyVmVveHJjQ2dWR0lqakw2ei92bVJhNDNR?=
 =?utf-8?B?VGpnd1cveHBJYnZEMVN3a0dQTmdqQ2M1UmQ4dW5VeVhpMi9DRmNaMmNJMjFD?=
 =?utf-8?B?dE5HTnhUUXJTc1dNRm1nVkdsOXA5SDdUOW4xeVRmdVZBejZSdzNqZWdra1B5?=
 =?utf-8?B?RlRoZlRLMGNJS0dvQnQ4Qk92ZFZtYlVKSVBBOU9sblo0a3VDbzBTM05kWmlQ?=
 =?utf-8?B?d0YwMDdqWHhsV0RzNExOdDhuRWY3S0tZUkhxTytnekFhR3FoNHA3V1A4cEFH?=
 =?utf-8?B?NVJhU1VFYzBMS3NubTRMSEsrTzlsRGd6ZjdNK1gyMW1HQTl5SXVXK0lnb09H?=
 =?utf-8?B?U1UrWFJrN0FNL05XZFFTWmtGTHhpZnF6TWhTSGd5MkF2OGwxYVk5QlI5VGZR?=
 =?utf-8?B?dGRiaWVHdUFYUDhqeEoxMmJGMHlGSnRnZVMxTzRmTUN4bzZvcldiSE5tblVv?=
 =?utf-8?B?SDZZeEJSWUt4bnU1RXp6UnR1QlNnK2drZVpkY1ozSzNub2ZrdjkzcFpLQjJm?=
 =?utf-8?B?V09ZOUQwN2JVNy91U3BBYTZMTWI0cDlhZTRjRDRaY1VyOXRwelJyc01Hb3J4?=
 =?utf-8?B?cE5KREE1SCtFTXFrYTVOSG9MS2lURHNUd2l6MmlGNkc4RVJBQmhMU1VuTDMz?=
 =?utf-8?B?eGVWZzhVejdJN2JESlArN1ZkTXc3cGUzQ0JLejBnSmpsWnVJOEQ2ZXViR1ZL?=
 =?utf-8?B?SVBxMVI2VVl2QXZUTEIvVnBtaXZJMmc3R29VeUQ5V2J3UkliQWE4SDhoWHhX?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a4278e-f7ff-4e30-b195-08ddcf6a39f0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 13:08:50.4173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMnKoUUxPRWtUVngnFBQLIp8zusuttuNNcrjUnKYOKNrQEtc+HHVdD993lQYnx6eieV36I/zx/Ae09yGfaU+jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9203
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

On 5/28/2025 11:17, Michal Wajdeczko wrote:
>
> On 21.05.2025 14:25, Lukasz Laguna wrote:
>> Update driver's internal wedged.mode state only in case of a success or
>> set it to "misconfigured" in case of inconsistent reset policy state
>> between GTs.
>>
>> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c      | 34 ++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_device.c       |  2 ++
>>   drivers/gpu/drm/xe/xe_device_types.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_ads.c      | 12 +++++-----
>>   drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +++-
>>   5 files changed, 41 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 5dd0ad3f9bae..5bc4fe5aa9a2 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -150,6 +150,25 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>>   	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>>   }
>>   
>> +static int wedged_mode_set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int ret;
>> +
>> +	if ((xe->wedged.mode == XE_WEDGED_MODE_NEVER &&
>> +	     mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR) ||
>> +	    (xe->wedged.mode == XE_WEDGED_MODE_UPON_CRITICAL_ERROR &&
>> +	     mode == XE_WEDGED_MODE_NEVER))
>> +		return 0;
> this could be a separate helper:
>
> 	bool need_policy_change(old_mode, new_mode)
>
> and might be called before we enter the for_each_gt loop

good point

>> +
>> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
>> +						       !(mode == XE_WEDGED_MODE_UPON_ANY_HANG));
>> +	if (ret)
>> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
>> +
>> +	return ret;
>> +}
>> +
>>   static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>   			       size_t size, loff_t *pos)
>>   {
>> @@ -170,19 +189,24 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>   	if (xe->wedged.mode == wedged_mode)
>>   		return size;
>>   
>> -	xe->wedged.mode = wedged_mode;
>> -
>>   	xe_pm_runtime_get(xe);
>>   	for_each_gt(gt, xe, id) {
>> -		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
>> +		ret = wedged_mode_set_reset_policy(gt, wedged_mode);
>>   		if (ret) {
>> -			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
>> +			if (id > 0) {
>> +				xe->wedged.mode = XE_WEDGED_MODE_MISCONFIGURED;
> hmm, I'm not sure that the rest of the driver code will properly handle
> this new unexpected state - do we really need this? can't we just try to
> revert recent change where it was accepted? and if it fails there it
> still not the end of the world
>
> alternatively we can try to track GuC reset policy settings per-GuC, so
> we will know where it was left inconsistent with global 'wedge' mode
>
> or just wait until next mode update or GT reset where likely we will be
> able to restore the consistency
>
> IMO it should be fine just to report inconsistency, and then let the
> user decide what to do next

OK. I'll remove this extra state and will just report the inconsistency.

>
>> +				drm_err(&xe->drm, "Inconsistent reset policy state between GTs, setting wedged mode: (%u) %s\n",
>> +					xe->wedged.mode,
>> +					xe_device_wedged_mode_to_string(xe->wedged.mode));
> this new state is not the one exposed in modparam description, user
> might be confused what it means
>
>> +			}
>>   			xe_pm_runtime_put(xe);
>> -			return -EIO;
>> +			return ret;
>>   		}
>>   	}
>>   	xe_pm_runtime_put(xe);
>>   
>> +	xe->wedged.mode = wedged_mode;
>> +
>>   	return size;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index fa4f1a3ac1f2..0aea87994541 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1206,6 +1206,8 @@ const char *xe_device_wedged_mode_to_string(enum xe_wedged_mode mode)
>>   		return "upon-critical-error";
>>   	case XE_WEDGED_MODE_UPON_ANY_HANG:
>>   		return "upon-any-hang";
>> +	case XE_WEDGED_MODE_MISCONFIGURED:
>> +		return "misconfigured";
>>   	default:
>>   		return "<invalid>";
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index a8dfacb951c1..8ec1d891a2ab 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -562,6 +562,7 @@ struct xe_device {
>>   			XE_WEDGED_MODE_NEVER = 0,
>>   			XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
>>   			XE_WEDGED_MODE_UPON_ANY_HANG = 2,
>> +			XE_WEDGED_MODE_MISCONFIGURED = 3,
>>   			XE_WEDGED_MODE_DEFAULT = XE_WEDGED_MODE_UPON_CRITICAL_ERROR,
>>   		} mode;
>>   	} wedged;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index ca8bdb0ec08d..f2c4c4e292f6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -1008,14 +1008,14 @@ static int guc_ads_update_policies(struct xe_guc_ads *ads, const struct guc_poli
>>   /**
>>    * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>>    * @ads: Additional data structures object
>> + * @enable: true to enable engine resets, false otherwise
>>    *
>> - * This function update the GuC's engine reset policy based on wedged.mode.
>> + * This function update the GuC's engine reset policy.
>>    *
>>    * Return: 0 on success, and negative error code otherwise.
>>    */
>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable)
>>   {
>> -	struct xe_device *xe = ads_to_xe(ads);
>>   	struct guc_policies *policies;
>>   	int ret;
>>   
>> @@ -1026,10 +1026,10 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>>   	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>>   	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>>   	policies->is_valid = 1;
>> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>> -		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> -	else
>> +	if (enable)
>>   		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> +	else
>> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> btw, do we correctly update policies stored in ADS that likely will be
> used again by the GuC on the subsequent reset ?
>
> adding @John

I've just checked - xe_guc_ads_populate() is called on reset. Then, 
inside guc_policies_init() ADS reset policy is configured based on the 
xe->wedged.mode.

>>   
>>   	ret = guc_ads_update_policies(ads, policies);
>>   	kfree(policies);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
>> index 2e6674c760ff..9879aadd22d6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _XE_GUC_ADS_H_
>>   #define _XE_GUC_ADS_H_
>>   
>> +#include <linux/types.h>
>> +
>>   struct xe_guc_ads;
>>   
>>   int xe_guc_ads_init(struct xe_guc_ads *ads);
>> @@ -13,6 +15,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable);
>>   
>>   #endif
