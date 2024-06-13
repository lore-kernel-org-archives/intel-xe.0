Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B473FC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 21:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576B010EBBF;
	Thu, 13 Jun 2024 21:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XObalOBS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0F610EBBF
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718315647; x=1749851647;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=VvWWwVq6VlI2y2DQ4rjyk1WcQgyjavRaWZptSaGSwXo=;
 b=XObalOBSgV1BDHEBfcjU4qN9QCb+QM/hKLBJnm6nzmZr141oiGj6mc+O
 QMjDi2uY/5j8ESVj3SBw4zwtcB2T+pOUW4LGdYxjio/rl6BXqoivoMZA4
 7Zsyk1R2tf0YdXGr0tA0TJGTUT5rIbRZu6m1g0h4h8Ig2NbLTzKRDxEL0
 SJVeMcmm8qA2598/pBlplcuy612ekqs4S9lf1QxKxJZg6gsee16Fze6L0
 BdO94uUP+aQ8EVbVOGUo2Kq3yYXSFJwyBNBlVA2XCAgPpjZDySg1EZpDK
 oa3ZvVWe0pdX8cD1/pMNNZXly6wbT/NdUw/yYn2xrHaWttMB2aVA8HeVR Q==;
X-CSE-ConnectionGUID: oHXDvrEXQ+ewWt1OpxiZ6g==
X-CSE-MsgGUID: U7o/cKEjSiGFqyb9GuYcfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="14909998"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="14909998"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 14:54:05 -0700
X-CSE-ConnectionGUID: wlsCh1eeTbWfB+HG0Y52ew==
X-CSE-MsgGUID: sjtD9dcZRVOH+0c8mBk+0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="45239604"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 14:54:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 14:54:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 14:54:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 14:54:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 14:54:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/BzQG0aOjRUZ4WxTITtygHvyE5HpRvYx9dmjwCfvcNIPHS7hAt80ex43PRPMeeebfEGaWAsgn6lMm5XECRsV1Okif9pjQ2X4a4WxgL27cEkfl1c6s+I/il6ci1vowqNIYRuSR9yjQMT2DHYW80lBoY1oLMMv9K4enoVeXeCyOIg+8F7KuqNMHAvebIHpiGpyXTk6Xv47YUkpqeRdCQz3eoXtUppOTRLnKSnpp2tyBc1I3c92JkdYcGosegtTmIJt53jPtd60vNZfNuaXyAHKdyYsGsz7NOfNKIn8g07ZeGUBQ9OKbb/JmQvWj0FmSLAeAnT8EqL+WhBGVi5dwzwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmU/1PgM0MbwwWPV7DcByOGW0mGzff+APk1NhtVSv54=;
 b=YYO3z4KsHpe0PH8LkyGpjsT9M1406EMssuJOgk27Mx6mn3Y0ItZLMYZkok1k0MD5oSybtV0U/2ZxSrqFmyTl+pD3iihDT5xtnpLJPF18vytFhug5Ur6+gco3sAzFu4nX1qlH3eeytFY07q6nxy5HPjj6kr2DqdIyRERMhdLgR5dd37BDU1lQYK+XESogAvZYaPIomfnMu0TnaTMq77Zg6mwjdY4d6MvzaTq5GFj23Kn8/0z7kEwzTQsmOuFKBCZOJ0q1NTDLbGfjTn69cIHfUEXomTlmocyP6ZqqOP/RomF0NzfskjCgsFCAUBIadqrCt7WFp68FCSaFB9aN/VUNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5863.namprd11.prod.outlook.com (2603:10b6:510:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Thu, 13 Jun
 2024 21:54:01 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 21:54:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Thu, 13 Jun 2024 17:53:57 -0400
Message-ID: <20240613215357.307061-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0041.namprd17.prod.outlook.com
 (2603:10b6:a03:167::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 5336a5cb-42a8-4810-65b7-08dc8bf355b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1lwYWpEQklzclF6ZnBqMno0aE1vaWwvbTQ0eExZdkRNUFdXSnpBdUlDWGlP?=
 =?utf-8?B?NVhCdkticG5IOWplOCs2cUNGZHpZUWlHQmhuWHJzOERsN3Jvb0xOL2l5VGRi?=
 =?utf-8?B?eElnazZDdlJWS01oU0FBSmlPeVBPWGdDN1hOcW84dW1ZL3d5M3RkVmVRaWwz?=
 =?utf-8?B?NEIreW9HcXNaUERwYjRKa1NKd0xsVCszY0d0QkRvMWhOZi80UytWdExDZ05W?=
 =?utf-8?B?U0pyaWxNSTVWSDJEY1ZWejllSmlUOU1WVDdxU3dCVnJqK3g0WWltR0g5b0hn?=
 =?utf-8?B?VFhJS21JVVF3TnU5QzNvRjA1QlRTWUpGdGo5RzBYeHpJT2tNOGxxWDNkT0to?=
 =?utf-8?B?a1kyUFVtLzlXdS9SQlVuZlVLbFNac0xraHk1N2Rwb2FsK1dFS1cvNGdwS1Mz?=
 =?utf-8?B?YUFzeFVsSERXV200bGk3UDZUUGpqSW56bGd2aGxNRDNmcFZraHdjaGlhblN2?=
 =?utf-8?B?YzA1QVR6MU9ITkpxWnBnUG42c0k4TTVTRCttMEQrUDlGWXQwc2lObk1mWXFy?=
 =?utf-8?B?K1dpNUxIUlBvcVB4UnMwL3pUZjF3RVlBMC9zbVBlOVh4a21xWWhUa0xDY2Fs?=
 =?utf-8?B?R0QwZEdIbjZUb2xVenE5NXVlY1p3R1F0QVZ1M2gxVkhEbHgvODdJRjFJUVpo?=
 =?utf-8?B?RWduQmVBc0M3eTdIcjg1MW44N2ZCeHU4ZUhmSUJ3bStqQmw5UkpZYXkxcndB?=
 =?utf-8?B?eGlTZThHK0FRMFc4eGVvVElSaG1pcDVNMW5kWTNPMm0wWmVncmFFekQwV3JR?=
 =?utf-8?B?Z1pjNHBKVlIzcUZYQUZhajhqZGVTNnFra2ZvUmlybmIzN2t4bzF3Ukk2WXdm?=
 =?utf-8?B?dUdwcHBPTlczZW5xSklkMDZFQXlRNHJ5L0lkRVhVL1JkdVYrSGJWdFc3MXJD?=
 =?utf-8?B?Z0N5Q1Z0VnpEVmVRU29qSlVtWEJqa1ZXWHFQQVlROUxWejQ2RXFFK1RuSWZH?=
 =?utf-8?B?ODJuQnBoL1JRdk9xWERQQUpMeVlaYW5rWi9BbnpLRXBVUVhFUDRUam56dE9W?=
 =?utf-8?B?RzBhdEJTVUppVjNOT001OFd2MzdWWVA2Skxkc3h2SUN1ZFNheVEzQUF3LzJG?=
 =?utf-8?B?bi9JbW50UllnLzdhV0ZhZFFHVEZHQURUSEJhSXU1ZmpVSFB1TWhpZDlQcW9G?=
 =?utf-8?B?UXJNMlBpQkc3ZS9nckFUamJ5OEVLNFdhSHVOT0s4cmhrNGtkUGhEUGhlQUJY?=
 =?utf-8?B?TTJNK3JVQWpLVXhkL2xJNis2bUtWM2Z1ZzVTaW5zZCtwaENKZTdtTGUvdHpl?=
 =?utf-8?B?aVlJcFpMNmxTRDhKZ2N6VzdZczd5K1YvcUtvRkl2RnFiZ1BMOHFIbzFoVFpQ?=
 =?utf-8?B?d0dFblFkNjZqYjMwKzlHaHRhTzBYNHhYZTFyV3RIcGdJd3FUaDg5TkNHNjV3?=
 =?utf-8?B?dEoxZXdEc3hJSlh3NHpqSGJOSklnQjh0L2FLTm40Z0daYzc0NVF4dStJVkVP?=
 =?utf-8?B?R2JqN0ZUeEgzT3o0L0JJamN1R2lqNjlpd2ZxMkZQRStGR0ZlVC9TQklQS1Fo?=
 =?utf-8?B?QVRxS2Zad1UzTm40aTZTUlN1c0NudjZPMlNPVnU4V0tGeFdPVDVyMzl0ckkv?=
 =?utf-8?B?U3h2amxZM3I4dmxJZmJOZldtTjNMMFM2WTM2eDFONXF6WlNnQzhza1ZvK255?=
 =?utf-8?B?c1lWbGoxZTM0cTRmZ204bUJoZEdpN1hZcUtlUytzQnRNUjlrQ29jdERZUkNa?=
 =?utf-8?B?RVMvTDExRlNPakNza0xBcVpsY25LbW1VOWg0YS8vSmwzV2dUZ3VydTFpcUZ4?=
 =?utf-8?Q?npTcADTy2wJUO3XJrjAvTtgIxyBrBUwUYNJqhG9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tzd2TjF5S3g0UlRWYU91YXphU2wxUW1pV24wTXlCOGJYVmFYaEc1TExmc1Zh?=
 =?utf-8?B?alY0RU9MQy8vaVlSWldLNlVQaGRaY2czUFlOcmNXNWVDaXd6TFF6bXE4SHZw?=
 =?utf-8?B?R2dCeHJ6Y2dwUHpHdUsrUlAyWWQyeGhjdnQ5YS9mU1dMM2M5eDRUVmdJb0Z2?=
 =?utf-8?B?emszR0FLQzRUSldVWmdBODZxSUFLQ3ZZVXNKYmlCVzl2d3VKclZsbFI0ZHFO?=
 =?utf-8?B?OWR4SitVMnQrejJ5cnN3aFFza3czVG54M3pXTXBOdWFRaUVaT2E5NFdwb1Qr?=
 =?utf-8?B?VHNnKzd5bHNnOFJITGM5dEFTWklxaE44ai8wRFZSQ0g3aEUxbDFXcWlEUUgr?=
 =?utf-8?B?WHE2TUZqN0JBeURtY0N1WHl0YWpLZTcyOTJtWXdWMnpCc3MvZytWaHlabFUr?=
 =?utf-8?B?M29ZQmJRbWhZUmxzUWpXaW53eVJxWmg4ajE4UVJxdjRSekhCeUpHMis2a1V1?=
 =?utf-8?B?Ymp0b0dkNmEwR3AzOWhxaitlOElEOUVWN1NUeVpPZ0thWW9qMUlrTzh0bmYz?=
 =?utf-8?B?QkFLajgxUXlJYjhMWDdNSjJVMHJ2RWdpWGZ2Nlk0TVA4YzBxTXI0TTd6R3lz?=
 =?utf-8?B?VmpzL2dTMVQ2ckhBY3pITEVNQ25NaXBVem9NZjRuRTQ0UnU4OGpTYVk0QVo3?=
 =?utf-8?B?N0JDZGorZERNSWxxQlYyYk5oakpJVURDOWh5bkxiSG9vRC9NK0xDdjFBOTNP?=
 =?utf-8?B?SkdUNUdTVG9SSTRVR3VVQkN1UHR2d3dGQW5JV3FsT25zaFNEb2QyWnhOcWRw?=
 =?utf-8?B?cXVxajk3eEFGR0lKM1NsdDJpeU0yYklyWm82cGNRUlo3RGgzY05FVkJycnlP?=
 =?utf-8?B?bGk0T2E5cmtudW1oaFVSdmNJN0FPU2lSbGZZbHhvZmQwTmg1NHkzdVJOS1NR?=
 =?utf-8?B?TkliT1pvejI3bXJWMGZVbGdwLy92RE9MWGEwN1JtZldpNnFoMjBna1NHdXF3?=
 =?utf-8?B?K0owR1JlUDFxYjRDQllTZ2tjWjJYaWpKYkNuL2Y0ZGczOCtmLzZDMExJSWhF?=
 =?utf-8?B?QUdvU1BiY2R0eVM3S1l1WVpxdmJRUmVnMTNhTUVnQ3FZZm1IanNySFR1dWZ1?=
 =?utf-8?B?b010emZLZ3ZRQTlnSDJVWDAwRjgrZmpXK0lyd0hWS3Jqcko1Q0x6VGZWVlJH?=
 =?utf-8?B?R0NoN2x4SlRlUExqUnhienpzVzN3TDN1a1h4K0NRU09DWXB4VXhwTjAvQ1FO?=
 =?utf-8?B?RmNIaHF6ejhQY3BxZ0J4YzFEenVXS0wvM2xSWTFEbStINVBDYk9FeTVIMVhW?=
 =?utf-8?B?OWYrdlJEelYzWVk0dHdUb3pYTDQvYW1ycytJQm1ERnI5SmRNeVZTNGU1RERq?=
 =?utf-8?B?ZHRtb3dIdXVsV1NTaEloZFJLcllJbkY3RWxvdnFOaTZ1Z2dQc2F6N0RYb0dx?=
 =?utf-8?B?Y0ZRSWZabmNYMk93eE1QM2I0b0RvTFBGNGgvVTJVVVUya05OUm5WSEpET2JY?=
 =?utf-8?B?WFo0RGdvOGxLcjlNd2pBcU5nRWZxcXBnNVBxUXFNZ0ZtT1NMdHZhaEV6azBW?=
 =?utf-8?B?RlJiQ2U5MDY4YXlJZzBGRlFBZFEySGdmNHRkRThFZ254cVZ1SnoySmhhQkYz?=
 =?utf-8?B?M1dncWhqU1FzOXIwZFdxVnJKUkJ6V29YWnZIaEUyWm1CZFZQMmVLK2hnNnhx?=
 =?utf-8?B?RVMvY3hSR0J0QSs0ZUZPKy9EcGNsckljc1hkUWFpcldka0hKWVRoWTlqaVgr?=
 =?utf-8?B?VjN2V3F6bmxtc05yUXVYM3ErVTFzSWNzVitURTY3azZKeFl3ai8yTGtJY3BB?=
 =?utf-8?B?UUlETlNZWGt3aE4wb2VPU0FPVDVZRU9JcjVPRDNiU2tsS0hVT1d5c0s1TmRy?=
 =?utf-8?B?dThsSXJsdVNQWlVmNVYxeTFVcWxQZXlwcnRMQWM0TEd5YkFJQ21wMmRPbU5N?=
 =?utf-8?B?d3REcjNiQzJhY1loV3d2d0x6TEg4TDAzVVZ5Yk1Hd21xV1c4OVFRRFJmM21a?=
 =?utf-8?B?NWJhUWF2S25reDdsdUNSQXE4bFVEcjdONzR4eXA2TmRRaWxKb3lZUWNqaFhu?=
 =?utf-8?B?V2JJRVNOVzZWbnJNL1N4VWNSYUo3U0dvcjlDS2E2c2ZXenlGblpmNzBTWFdT?=
 =?utf-8?B?L0cwTGI5ZWdGQ2FWRmlKdTZDNWVtUm9DVGF5U3UwOGRXRGhFRXQ2MWlod295?=
 =?utf-8?Q?ymowpjrZQSRyLk1NPn8r5T6wH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5336a5cb-42a8-4810-65b7-08dc8bf355b7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 21:54:01.6916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asulhhxKgvVGbNpIjiBu1TrNiG9YD/JVqLgWgByK8VfkmoNc1pNRUSBuKFA7SWz1bHN5gkW6owMMQ4v2R7xQfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5863
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Brost)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.
v5: Actually fill the delayed_removal.invalidate (Brost)
v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
    - Own wq to ensures that the queued works are flushed before
      ggtt_fini (Brost)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  10 +-
 drivers/gpu/drm/xe/xe_bo.c             |   2 +-
 drivers/gpu/drm/xe/xe_bo.h             |   6 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c           | 129 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_ggtt.h           |   1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h     |  23 +++++
 7 files changed, 130 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a2f417209124..b84139b27970 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -153,7 +153,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	}
 
 	vma->dpt = dpt;
-	vma->node = dpt->ggtt_node;
+	vma->node = dpt->ggtt_region->node;
 	return 0;
 }
 
@@ -203,8 +203,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
-		vma->node = bo->ggtt_node;
+	if (bo->ggtt_region->node.size && view->type == I915_GTT_VIEW_NORMAL) {
+		vma->node = bo->ggtt_region->node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
@@ -322,8 +322,8 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.start != vma->node.start)
+	else if (!drm_mm_node_allocated(&vma->bo->ggtt_region->node) ||
+		 vma->bo->ggtt_region->node.start != vma->node.start)
 		xe_ggtt_remove_node(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 74294f1b05bc..0bfd6d1eb0be 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1072,7 +1072,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.size)
+	if (bo->ggtt_region->node.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..aeb1ebc0d3fc 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -194,9 +194,9 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
-	return bo->ggtt_node.start;
+	XE_WARN_ON(bo->ggtt_region->node.size > bo->size);
+	XE_WARN_ON(bo->ggtt_region->node.start + bo->ggtt_region->node.size > (1ull << 32));
+	return bo->ggtt_region->node.start;
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 86422e113d39..f45b1c4bbb6d 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -14,6 +14,8 @@
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
+#include "xe_ggtt_types.h"
+
 struct xe_device;
 struct xe_vm;
 
@@ -38,8 +40,8 @@ struct xe_bo {
 	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
-	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct drm_mm_node ggtt_node;
+	/** @ggtt_region: GGTT region node if this BO is mapped in the GGTT */
+	struct xe_ggtt_region *ggtt_region;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ff91fd1b7c8..d0284f2c7cbc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -101,6 +101,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	destroy_workqueue(ggtt->wq);
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
@@ -191,6 +192,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
@@ -389,7 +392,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start = bo->ggtt_node.start;
+	u64 start = bo->ggtt_region->node.start;
 	u64 offset, pte;
 
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
@@ -398,18 +401,97 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	}
 }
 
+static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			     bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct xe_ggtt_region *ggtt_region = container_of(node,
+							  typeof(*ggtt_region),
+							  node);
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->start, node->size);
+	drm_mm_remove_node(node);
+	node->size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		return;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+	kfree(ggtt_region);
+}
+
+static void ggtt_remove_node_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_region *ggtt_region = container_of(work,
+							  typeof(*ggtt_region),
+							  delayed_removal.work);
+	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_remove_node(ggtt_region->ggtt, &ggtt_region->node,
+			 ggtt_region->delayed_removal.invalidate);
+	xe_pm_runtime_put(xe);
+}
+
+static void ggtt_queue_remove_node(struct drm_mm_node *node, bool invalidate)
+{
+	struct xe_ggtt_region *ggtt_region = container_of(node,
+							  typeof(*ggtt_region),
+							  node);
+
+	queue_work(ggtt_region->ggtt->wq, &ggtt_region->delayed_removal.work);
+}
+
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_remove_node(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		ggtt_queue_remove_node(node, invalidate);
+	}
+}
+
+static struct xe_ggtt_region *ggtt_region_init(struct xe_ggtt *ggtt)
+{
+	struct xe_ggtt_region *ggtt_region = kzalloc(sizeof(*ggtt_region),
+						     GFP_KERNEL);
+
+	if (!ggtt_region)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_WORK(&ggtt_region->delayed_removal.work, ggtt_remove_node_work_func);
+	ggtt_region->ggtt = ggtt;
+
+	return ggtt_region;
+}
+
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end)
 {
 	int err;
 	u64 alignment = XE_PAGE_SIZE;
+	struct xe_ggtt_region *ggtt_region;
 
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.size)) {
+	if (XE_WARN_ON(bo->ggtt_region->node.size)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_region->node.size == bo->size);
 		return 0;
 	}
 
@@ -417,9 +499,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
+	ggtt_region = ggtt_region_init(ggtt);
+	if (IS_ERR(ggtt_region))
+		return PTR_ERR(ggtt_region);
+	bo->ggtt_region = ggtt_region;
+
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_region->node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
@@ -443,43 +530,15 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->start, node->size);
-	drm_mm_remove_node(node);
-	node->size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		return;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-}
-
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.size))
+	if (XE_WARN_ON(!bo->ggtt_region->node.size))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_region->node.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
+	xe_ggtt_remove_node(ggtt, &bo->ggtt_region->node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 4a41a1762358..75511b5f43eb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -30,7 +30,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index d8c584d9a8c3..202d7f3085ba 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -34,6 +34,29 @@ struct xe_ggtt {
 	const struct xe_ggtt_pt_ops *pt_ops;
 
 	struct drm_mm mm;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
+};
+
+/**
+ * struct xe_ggtt_region - GGTT region node
+ * It needs to be initialized before the drm_mm_node insertion in the GGTT.
+ */
+struct xe_ggtt_region {
+	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
+	struct xe_ggtt *ggtt;
+	/** @node: The drm_mm_node itself */
+	struct drm_mm_node node;
+	/**
+	 * @delayed_removal: Information for removal through work thread when
+	 * device runtime_pm is suspended
+	 */
+	struct {
+		/** @delayed_removal.work: The work struct for the delayed removal */
+		struct work_struct work;
+		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
+		bool invalidate;
+	} delayed_removal;
 };
 
 #endif
-- 
2.45.1

