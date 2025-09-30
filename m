Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3871CCCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 17:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB39710E618;
	Tue, 30 Sep 2025 17:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fANeWj1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EF610E618
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 17:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759254399; x=1790790399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wlos+kQO9l6rSPaLcFTVJRIPKcrxzGo+TZcjo/sR6f0=;
 b=fANeWj1nhtgX3/Yf1AyNyZMeHYrt2WIgDfmrZN9NFZzZqOmim0EsQfN5
 lBfGki7dpqRSx2BwM6J8Kuc2alg9DSJCbVEgHplLNPpKKF1AqV5y+BWNn
 jnkh9pb62IpLlNlQKbqTYWpKCtOJ5IENvx5vkbdDg1WEGY0gspF80mZnn
 lB0hxOFnwvnf+5ZfDamJlzLIPWAwhZyrvMEkPE04ukIJB1PI37UHA6TCy
 WAf9+c6QUYJwZREZ3hz6GVc3NCIFROwnA6dTBSs7jxUxYBofgu4S3+7X4
 p750jkMVF/cqfLHFCgC5HCMjOheKunIQl1ds067W5lX9NpmD12OaW30W3 w==;
X-CSE-ConnectionGUID: o0dpWzuDTgCSF/ht3JzJKA==
X-CSE-MsgGUID: 0xYMpH6cQRSWixNMm4AF9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60553938"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="60553938"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 10:46:38 -0700
X-CSE-ConnectionGUID: dR/z2QfBSJuV+nNbtQ/mWQ==
X-CSE-MsgGUID: vmo+aPxMSrWw6Kdu0NZM8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177852981"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 10:46:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 10:46:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 10:46:36 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 10:46:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXJjzRunyhhrN7oMKUpBCo8pcQfraEBsQ7ZdW4eL+Z7IZRAxzMNIeMEHftPs0WTIYzBowNdnLcMAxOHQStTdZ6EgTq4nTZO9x5XaO+cX2o6ldrDTrpj2oM/ETrBOo53hbACq6mmwVUoQH4wmN7Mh2ndbk1iLQSJ0WSUpc62G06qX7DETIAHhWHd0ExdviWneLHESIQLEmrzletwt4zW79AL6ROU1GoQtQqHP0Edt6zin/Z7N+OPPnB7Qa2B+zUMGfB4aNNmEdCLE97TOeJrcHI9RZpmUqD5fETdRa2qcwtTItzQe+PtCP1HjcfmFfmDWUzucQ+6sCcBOz8jG46Zogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMWm9MjZPMaMVvaW5mc6CV0Q2BXphLn1+JNOaXaZJZ0=;
 b=uXPtyZjat8AwZiKDS6xkkP+R2uItPQdW14v/+inwdJG/iFKcQ+DeAetHIWSdX4nE8/sDDRPNEn3DaY8OyzibfKMUU7Nzrs5h8q+DWDlg08G2HNbtvq1cWMv+gU6TsOwt7oVgWBQzimXNxzLfH+4SS7Qeu7kWA0wt4yYyS8MGRWHVuV1DYE7lt4XWMs9AyNnl5f7wXaysdoqA3R6gTtL77LZ1v+rMnBi7GxinMY20bbXDOj4dOtPMeC9CLkhvjtGGVI0jUq79S/Ifs8EQMEf8xxNVaIFOLy6VCT1SyitAoOA13ORq4IOVMzXRr0Z289IIZgYybBPrS9L/Hq/EjfmtEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5151.namprd11.prod.outlook.com (2603:10b6:a03:2ac::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 17:46:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 17:46:33 +0000
Message-ID: <e7814fa2-8244-48e6-bd06-ef3f71540e56@intel.com>
Date: Tue, 30 Sep 2025 19:46:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/debugfs: Update xe_gt_topology_dump signature
To: Raag Jadav <raag.jadav@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-2-michal.wajdeczko@intel.com>
 <275ae979fdbefb5e6f4fbc00bf183eb0b7d336c1@intel.com>
 <cf3dcf02-e213-4339-b356-efa8056f84bb@intel.com>
 <1bdb6f5ad557a144f402c106d80a319248028bbe@intel.com>
 <aNwSDXlttVzutmxp@black.igk.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aNwSDXlttVzutmxp@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0046.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::35) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd944b7-8465-41cb-e299-08de00494b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dS9jUi9QY2tlL0d5ejhlcTlWYW5vVmczMUVtb01PSGN2UDFEajZjWllXQ0ha?=
 =?utf-8?B?S1Z5VnRkQ05OWDlhV0RzdmVaVEE0dGRBT2gwdjFSOGowQ0puc1VhMkJ3ZHBN?=
 =?utf-8?B?aXlGc2dKWldCbVNKSDZBZmppV21GaWQ3THRiY1RmeWEyTGtHMkpTL21lYkRi?=
 =?utf-8?B?amJXdk1Ca1hjS2JLMHF0N0VXUktqVDBDbzdVT2JMRG1GeTNmN2c2UHpyY2s3?=
 =?utf-8?B?SWNSVDZtakZoekh6TUZtYkp6T2U3UUtPTEQ3ZmVFbDVQWGFMTEQ2OXBpYWZG?=
 =?utf-8?B?NjN4SkxpZEprSDNFUGlqbDhBbzlHUnRseHF1Vk9kcEFaVEZlVE9mNS8wcE1D?=
 =?utf-8?B?T0VyTGdrNko2Vmd5TUZyaE5aSXRJK09HOUpnVklsNWdiYkoxRDZBckdicVd4?=
 =?utf-8?B?UnJjVlJhblZDdWZBMytoRkl5QnU1UTJEYzhaV0F5UEJXWkIwNGJrVWpUQmVt?=
 =?utf-8?B?ZlI3WkJDUDcvbmtwWUVxZ3VMbEZFSWYrWFZrR0JiMFlMeE5nRWNjSnl2UXJP?=
 =?utf-8?B?U2Jtb2hhcEo1MzgvZ2IwQkoyTTdXYUd2bmxRUHp3ZEc0ZWFia1dSYVZiTUZZ?=
 =?utf-8?B?L1dCZnhMcDFSdnc1NmQ0ZmV6eUZKR0FvZFB0UG1BMWtSSDRQS3dad2xVemk1?=
 =?utf-8?B?Y05NRWY0NXR1eWNRZWx6eHN4SU95UDRqSS9QT3MyVTQvZDNJTFp6endzT3Bx?=
 =?utf-8?B?SmNGTFdXM1R1NWcxYnZaekJLRjhrY3pzbXE2QUhXU1k0c09URTVueWNhTGts?=
 =?utf-8?B?WlNGUFNPVWJPNVgwOFc5K1RyZnlwWnhWdnRqRXQ4eWhDVS96amk1dW14ZkN0?=
 =?utf-8?B?QXZmR0V1aU9ZTEpPby8vZ2NNS3VMV1ZwWUxCVkU5T0psTkoycEp5cGJ5ZWx6?=
 =?utf-8?B?WkpjWVJTK3NCbEtaVU1JTHR2aEMrZ0h6bG9SVUpyVy9KZDZaeUU3YXg5eUNT?=
 =?utf-8?B?T0hzUTUwR0V5amJXUFY4bGlXZWg2QjJOcy9ST21uR3Vld09hdkFtV09CSTR1?=
 =?utf-8?B?TnZWVGNNL211SzFUY1V4MUdOMm9KbWVFcGpScVVYTVlLVHlPdDRkSjMwNGNK?=
 =?utf-8?B?d1I2YUZBMFI1REdxZ1B5Tkx0ZDFmT1hwR0dOZ2tpTThpTisweGJHWVBielpM?=
 =?utf-8?B?QnRPazgwWXQwUStCS0srajNGQlJrRDhyUXFKMG8vbVhwZ254d3hSQ1dzVVl0?=
 =?utf-8?B?QjhxTjlVWVpxd3ZBODJFK3ErRWxYUVlhdWRGS1U3UHlzcGtaZTVkYTNQa2h3?=
 =?utf-8?B?STNkODF1d2RxYU5tOVJyYkE0eHMwb280Rjh1RHpvM1NCNmtSM0hGbVpjaEdY?=
 =?utf-8?B?R3VEekFNNG03SS84VmhycjZ3UHlJdjZ2bk5mVjM1QnlWWkhXdmREM1U0dDlH?=
 =?utf-8?B?bVFhZmJmangzYnRTUllqV1RtODZFTFJsVmtLbnkzNTVpVnBFZTEvMWdFdTJX?=
 =?utf-8?B?b1hvSkhGYWFhby9XNStRN094TllBS0xlWGJSTnBOb2ZuOUhJVEJvaWhxNU1G?=
 =?utf-8?B?Z3lFS0pjK3BWdGR4VFZRU2ZVMldlWlNGMTk4OHdFdUpWRjlLWTdJaFMwTkZk?=
 =?utf-8?B?QkhVZkt5Zi9IZmVha0t2anlFc09yV285Wi9iSVB5RVBkVUo1dTRZRGVxMEo3?=
 =?utf-8?B?dkRCaHhEcmt1N3NOelNlZW5mK3VJNzRhblR5ZE8xZXR6blhrSEQrcStrQmVv?=
 =?utf-8?B?ZEZ0NUpEdys3dUJUV3FDRVpnNHR5bEQrWkNFdnBDMmtNMGZTRDBOc2xCbVE3?=
 =?utf-8?B?ZlpOaHV3aHdyL0s5UWNUdmcxRUlCOFJEQ1gwWjZUaGg3RytDRFQ3N05zY21v?=
 =?utf-8?B?VEFpSGhCSGRJL3FIWEtmV3RxR1ozTzVvWFpIcXp6QkJmUzFUbmJVQWgzWWNG?=
 =?utf-8?B?MUkzNDZtZmZQcFNjUllEK0dNUnIvTzdxYlFjaGdNVVdkT01kNEVaRi95Unc0?=
 =?utf-8?Q?KdIq0ukGORV0GESF4MG4/pkSrePtsqq+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVN3WmJaRm9JNjQ4Q3F6TFQ5bW12TFdBdU9wQUlNVTBuenp3WERpeUUzdmcy?=
 =?utf-8?B?bTRIU29XUWhINjZFbVNWWWpOUjJXQnBjQ0lBRW8vMUFqTWpCeHQyZUVVbHUv?=
 =?utf-8?B?ZW5nWk55dU9Xb1cwQUsrbnFrckMvSmZiTE1vSHAxakE5bkU3UGttaFBOY2dS?=
 =?utf-8?B?dHhBUjZFMmdFMzFMUHk3NjRkK0tzNXBsM2l3eVRDeGRXL1hLc3NiYVZENVBa?=
 =?utf-8?B?eEM5U3I1Umw3Z1dTakV0UmlpVmwzdnlPYTBnWk5zakhWT0gxZ21Ib0h3VnNT?=
 =?utf-8?B?NnpqcEI0dEhNMU1lOTROT0pIb2ZhWWVGMThLT2JodWJMRHFQZHhSUG5KZFZR?=
 =?utf-8?B?OG5JUnhJNkc2ZVJjNUtESkt0ZDQ4NnM5Z045ejQrK29HVmtaN25pd0daUzh2?=
 =?utf-8?B?NlZqd0Q4R3JmTEEvNjQzbEd5VDY4WndScnl2ek5MbmRLbXVsWXA0dTA5a3BO?=
 =?utf-8?B?RHBXeSs5azVlK3NDMTNxZ0IwQlVOaUJwYUp6OS9waVlGRmVOTWZJTkwxUWNF?=
 =?utf-8?B?Qnd3OS8wSHFpNE9vcGdpSzNrZDBrZ2thMnBFS0RveGp5aXpFZG9hNTF4ME1U?=
 =?utf-8?B?QWhpU25GV0R0ZmxLcnpabkVieFpBa1orYURuMDVSaExPOFJIVHFxS1Bob0tT?=
 =?utf-8?B?WXdvckV2VG92ZFBzRCtGSGtETlpKaUswUURXSXQ0SmkwZGF6aEI1Q1R2VVNy?=
 =?utf-8?B?aERtMG5ZMnRRWGhFc21sM01zdUpoU0ZiQXRMZStxTU1NTEY5eXhTU2NLOGhn?=
 =?utf-8?B?dXJxSUVGTnc5aXZOSHVwMEtUVE4rajNLNWdNODYwelF1TWxybHFQcGFJTEhu?=
 =?utf-8?B?eFFKbEFaa29zN1NNdjhwMU9YK3ZmTndzbDFaeHVab09Gd0lNUGllQmhWSGZ2?=
 =?utf-8?B?TjB6UElvR2thYUUwZFRwZWo4UzBWcVVaS0ZLYmtJTXMvS3cyM2JHOVRtaUxW?=
 =?utf-8?B?STdRS3ZNVkJrR2JEL2x5L1hFYUhpdWdrajhQUVlIZU5nS1FyUmZacFlSK28w?=
 =?utf-8?B?S21OWnc0U21BcnZtK2N6ejVCb1BLLzBjRWVIMnpEOHpIY0o2M0dkOVVUcFpI?=
 =?utf-8?B?NWx1MDBhRnp3WTA4Ym83cDdpMkE3bWFnbmFXcm10dzd6NHJ2WlUzWWFLRHZB?=
 =?utf-8?B?TDJSZnhlRG84aHRab2Q4VTZ2aDV5MHpLbk4yR0lGb05ST1lwUHR6SElUTE5p?=
 =?utf-8?B?T2JOVUhETUtpcURjY2x1Qm96NW1iQ2pZNW9nazhKV1hadk43N2RSNVZGSlJk?=
 =?utf-8?B?L0JwWUI2VEkzazlldElyQ0s1MmY2MDZsNzB2WHJ5ajlOdlVMK0VDamNFNG1V?=
 =?utf-8?B?ejhQOVFzSVJNZ3JaM0UvazB2ckQ0QnRhbTZadkRnMHYyY2cvbXJ0akxPbWNp?=
 =?utf-8?B?VmdwYlRmc0grWElpU0FQZE9CdUtERzIwbGFsZGlhVGpjblFKeDhoUm1BQnYw?=
 =?utf-8?B?bVhJdmNwaWg1N28zZnF5TWFrOXNObkZXSEx0VmEycWpXYzhPZmVQSkV5UU50?=
 =?utf-8?B?WTR6Q29rdG1TR0o3UE00WW0wb1dCeDNiRW9RR1FPbnQzWFd0Q3JpaFdIU1pT?=
 =?utf-8?B?c0xEL2RMbVo0bzJaTmNqTXdIalVoUE9yL2xTRDBzVFJIQjV5NlhqOWJwYmlr?=
 =?utf-8?B?Wk9MUkZqeWxqQUtDMmFyRUNQeUVWR1JpSE0vNGNMNFkzdy9PSUdjRUpLWUE1?=
 =?utf-8?B?MnlwSWt2eHJwUFBiaEhLUmJzb3Y4KzRVQjdTeHdIZGdLMUp4Wjl3QzB4S0pE?=
 =?utf-8?B?NlNYWHpnbDlYVnFBbjcwZWxELzJhKzlFdVI5b3d3WnBYT2RXS3Jkd2ZPckM1?=
 =?utf-8?B?OEU3UGhCWUJYZ0dBQXVMMW5HeEx1WGtZUTBqM1Fsemx5eVRhUnVpbmlRMmhK?=
 =?utf-8?B?eS9IOE01VElaV0MzMkZ3Y1RCcjFOQ1J6N2ZHSTh1S01UWUxMTFlVQWVINld6?=
 =?utf-8?B?V1RUcUVMRlE1OWMxL1puRVplZHNwSjIxNlpEUmRIYXAvOTcrRXZ4cmd0UlUw?=
 =?utf-8?B?NldZdi9IdVBRdUNaWUw0ODVBeFdqcXRucWw5REFKNzNkZmJnNnVJdEUyZVFw?=
 =?utf-8?B?ZElnZHRndGNyNXA3cU9MUE9FZUNSaSswMHJzOFB5ZVUwbGZPMTNTaFdSZ0la?=
 =?utf-8?B?MWF0T0drbitoUkQ3bHRvenpWUjhNaEQxL1RwaXZJcnBtcm5CcWloR2dFM3pL?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd944b7-8465-41cb-e299-08de00494b5d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 17:46:33.2723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyNrs0t6ESkZ92IVaEEkIIphRMEPUJ7c3JhVXG1R11P5HVlxX0zUJSybKZ2YC5f/9vPOwxUrgycaaOi3Kw1ACvEBpjcvN8sHv8ddQ3XQJGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5151
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



On 9/30/2025 7:23 PM, Raag Jadav wrote:
> On Tue, Sep 30, 2025 at 02:43:47PM +0300, Jani Nikula wrote:
>> On Tue, 30 Sep 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>>> On 9/30/2025 10:45 AM, Jani Nikula wrote:
>>>> On Tue, 23 Sep 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>>>>> +/**
>>>>> + * xe_gt_topology_dump() - Dump GT topology into a drm printer.
>>>>> + * @gt: the &xe_gt
>>>>> + * @p: the &drm_printer
>>>>> + *
>>>>> + * Return: always 0.
>>>>> + */
>>>>> +int xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>
>>>> What benefit do the formatted kernel-doc give us? IMO it's just
>>>> boilerplate with pretty much everything being obvious from the function
>>>> name and parameters. And the functions aren't significant enough to be
>>>> made part of the Sphinx build either.
>>>
>>> I'm just following the (unwritten?) rule that in Xe we should document
>>> all public functions, and while in some cases such kernel-doc does not
>>> bring anything new, also like in [1], IMO it's still better than no
>>> documentation at all, as sometimes, like [2], function name isn't
>>> telling you the whole thing
>>
>> I'm not arguing against documentation. I'm arguing against excessive use
>> of kernel-doc formatting for functions that will never be part of the
>> Sphinx documentation build.
>>
>> /**
>>  * xe_gt_topology_dump() - Dump GT topology into a drm printer.
>>  * @gt: the &xe_gt
>>  * @p: the &drm_printer
>>  *
>>  * Return: always 0.
>>  */
>>
>> vs.
>>
>> /* Dump GT topology into a drm printer. Always returns 0. */
>>
>> For non-EXPORT_SYMBOL() driver internal stuff, in most cases the
>> parameter descriptions are self-evident, and repeating the function name
>> is just, well, repeating. The formatting doesn't buy us anything, it
>> just brings overhead and extra maintenance, because the format will be
>> checked.
>>
>> For EXPORT_SYMBOL() and the more important functions, or generally
>> things you might want to include in the Sphinx build, or anything that
>> might benefit from the formatting for readability, sure, use
>> kernel-doc. Otherwise, I wouldn't bother.
> 
> +1. I've always thought kdoc formatting was a general guidance than a hard
> rule, especially when the driver footprint is already quite huge.
> 

I would not mess here with the driver footprint, as this is not the same as LOC

what I'm afraid is that once we decide to relax the documentation rule,
then suddenly all functions will be treated by their authors as "trivial"
and as such do not require *any* doc at all, even the simplified variant

OTOH if adding few lines with @params is too much too much for the author,
then maybe he will reconsider if function really must be public and/or
requires that many parameters, and/or their names makes sense


