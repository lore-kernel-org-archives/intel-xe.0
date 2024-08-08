Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B88EC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 22:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2483610E7B9;
	Thu,  8 Aug 2024 22:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSIc6afm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D42C10E7B9
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 22:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723157901; x=1754693901;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=lSV1Eh1twT3vaqliByXMpwZJZ9T5jkorLHMEfplD/l0=;
 b=RSIc6afmSj9GGrzdAF2EFSdKG8YYgg+6pMSuqqhkqiYHKP3zaGHkN2Xj
 xnsWmb7bsUj8YRczoCLmtcO6iiIahfowz42voAuo2itqbL0MKuKvKTj5x
 mkPVhf4XOphqIOvUIRByRYdMfBXiqtXRFUOTsspEWstIwtnanx7nyWgCL
 Aa3c8eN3JqmJmnrUSDDVFkVnN6AftXb534AhgJJVJz3q3fecFNammiIEm
 lWeKQbOxbyU0zhs30revTQpTkWSRFlQsi4G1iGMoB6Irz9f4ZK4kDqln8
 tirT78/Xrf/hOducDCVca1VU17waYy+b9RtsV0kwMqFvZ1C4zYAGjEVpr A==;
X-CSE-ConnectionGUID: m4lYfVznSXev7x3nTltJ/A==
X-CSE-MsgGUID: dZ9mYQldRamUCkaZlF4RhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31988501"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="31988501"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 15:58:20 -0700
X-CSE-ConnectionGUID: qb7KbPqVQzms9gDE5DbTfg==
X-CSE-MsgGUID: VZhOr/9PSa2FSYXOnBnL4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57291316"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 15:58:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 15:58:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 15:58:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 15:58:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 15:58:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9DM57CvyN/GTdQkz2MDT17eVAn8An+Ib9l8h07F+S+LT610lxEIiZDi/goDN8oklPfT2Yqdg7YS/IQC9xernMOGD+BpB8r1yIl7q5rakjHMbupAd/3Y7tcRBcAA5FPfctKfutYnXlkk223w1qTsfS0WYdK1E7zufnh6nmuKJ5bx+oY87zfuJf03ucBRf7PI+w9fzBxwNbgqQICTLlX/fPsXj2DoH48MAmr4YYtrAjemGAnqlxNvArFurLIZev09xxz2r8eyMmRvJJ8iAWmzyoZJLsmojvqxd4veouaE6mxuB8aVDXQNICYLUPMvtL9I15OdkjUkP5fklsi/fEW47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSV1Eh1twT3vaqliByXMpwZJZ9T5jkorLHMEfplD/l0=;
 b=RPZdD0E7nmLB4IoGu9uBWzugnfa2Ra948TclDFug/4IjNVSDF73EQU/yEzPoC5w94E3/rYh+wfZmgtEj2BoSzAxJIo/71Hq49aPmX3lv0UaZ8CE0EEudE9DIcDfEvA1nnnjyPIKmG8rcOvewuQiCKk9WJJYus81wHtj14NfFtz+ggRYSboRlussZ6b2BKwQgxqI7mmX3BTGf0O1Dtod+F4mpOOiPUrT4PgPGU7ontosr1se5JG/kmdnW8AKxU0RiOzG+0bjeCniiOfwUC4vLIlI/D6rDDzxc44mhoN990UvFmYMNG62GPZUU71LG0bFEY3fE+IPmH0YNB+hW+ArukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA1PR11MB6824.namprd11.prod.outlook.com (2603:10b6:806:29e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.21; Thu, 8 Aug 2024 22:58:17 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%3]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 22:58:16 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v15 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Topic: [PATCH v15 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Index: AQHa6BEAVPpjY6ZSR0CgZ1dwvvm0wbId/MMA
Date: Thu, 8 Aug 2024 22:58:16 +0000
Message-ID: <c372106eefd3469dafa39c88cbc25c47358b72dc.camel@intel.com>
References: <20240806145704.165231-1-zhanjun.dong@intel.com>
 <20240806145704.165231-2-zhanjun.dong@intel.com>
In-Reply-To: <20240806145704.165231-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA1PR11MB6824:EE_
x-ms-office365-filtering-correlation-id: 22803cc1-9d4c-4abf-70a8-08dcb7fd9707
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y2Fid3U2amN0ODJkZ01MVVJEeUI1YmkzZ0lFTHR1NDZKZmlJYUl6RFNCUVQr?=
 =?utf-8?B?dldVWHl1S3lSZkt6NDk1emxORFNCSWdROUhmdFZJQ2dBZjBzdzNmREh6SEN6?=
 =?utf-8?B?YWlVOVU2c0k4L24ycXEzWXZnNTVETFdzL2psWFMrTkxTT2tRZ2ZkNDlockQz?=
 =?utf-8?B?eGRiVFNTYUJMQ09MNFlXWmxXQXp0UDBQWkoxQlFoYVdscktLRk5XLzFpUjhH?=
 =?utf-8?B?cTFLMFRxR2d3dkZBclh2TGZkQVozbW40RkNySHR2Nk10d090eHBMdzlLb2l0?=
 =?utf-8?B?YTVoSFRyaUEwZVB3SzVUYUpNVUFjZWlDK01wSWM0bnpnZnZkSnhCR0pEaUVv?=
 =?utf-8?B?RlJjSEtNZkZrUllncktxM0hoSUxuWkNtS3doTmlwWlY2SjZtTWZ3RWs3WEJS?=
 =?utf-8?B?QW5CaWtjanBhQTkrd2tGeFdWRzl5cWlRQ0pGTVdaZ1RBOFVTWDM2akdLZitm?=
 =?utf-8?B?enBZNFhSMDV0Uzg1OFFBTjcrM05ka1RiRG40eVVsTjRzMWFaU3puY1loK3Q1?=
 =?utf-8?B?SkJ0WXlVcnA4Z2tTRFdPT2xTUDJJWHoxYVZqbzVPM1dmS2RDVW1ySjlKRUhu?=
 =?utf-8?B?cDhXKzE1bk51Z0JnZDFVenlnYXE3c0RFWWFUODZPMEZwNnRzNU8rQVBQUlZV?=
 =?utf-8?B?NkZGTFR4TC9ZYVRkdy9adDJOSkpFaVZLQ1R5VnpIdFRCU1NZYTlOd2VVTHd2?=
 =?utf-8?B?OTlrNDhHUlZHVHBwS09EOWRoUGFkK2xwejVxNEY1dzJKQzNrcVZUTjFtWFlo?=
 =?utf-8?B?Um9lZit6bkJJU0pIeHYySkpoWURBOHA0ZXpDR2tIcHViSE92S25YakJUS25G?=
 =?utf-8?B?MmczV1RBdjRBc2tOZ2ZyV21qanlqbDN6czFHZmIwVjNjMFR3cVJWQzhYcEw3?=
 =?utf-8?B?TEVGOWhoWWwvS0I2TVUzNjJIZUEwZ1ZZYXpyb0YvalVHYVljZGxibE9YNkVQ?=
 =?utf-8?B?TVZSelZFVHIwWjUvc1NVRHBQSnpJeEVYNVZSTkd4d0pTQ3RXZzk2QVdjYmJr?=
 =?utf-8?B?UU1mQmx2Nys1ZzBBdFRleUs4bzVpQS9qd1ZDTVYvcXFjc1hqb200eHJBRGR6?=
 =?utf-8?B?Q1hST0IrRnppdm04ZEh4N1dEd3g0WWFyM0ljdWhYRmlsbVpoVDQ4cXNaRWl5?=
 =?utf-8?B?NkM0U2EwUVc3a1Z4Z3BKZ1R0d2htb3VQdXhVbng2eFNUclhoRFp2QWQ2V05I?=
 =?utf-8?B?d2R0djZDcW9DZkl4QlN1Ym9xV0hmSDM3L0YweVI1Y0JiejFlWFdMcXlodnox?=
 =?utf-8?B?N1dIUmF2cWs3YnVoekM4YjRvOGsrdlRkQ1UrRjZYQjdPQ09QMVFqdUZ0Y2NE?=
 =?utf-8?B?Ti9tZzVMNkpsdDk5UzhUTjJMNmRjQ3lwZnYvVjJSMmU3Y29sNFFlU2JScUQw?=
 =?utf-8?B?WUMxSEZSQVE5cE9xQjlwRFovM1hhcUxNSit1eTZpL245cDU3VGxOMjl1VFow?=
 =?utf-8?B?eEFPWlY1MjF3T2pIZ290OUV1YXRuOVhnMGp0aGVESDF4a25qMTBZY0lnMjIw?=
 =?utf-8?B?aWxxTmtYczdlMDhUODZYdDdHVnUvUW9kalk1UzVmcHp4ZGRrdmFjWXFSZ2VQ?=
 =?utf-8?B?SytQTXdUYVU2c3AyMGZJQU1ieXVqMUdxNlR5cjl3U0xWMmozZndEaG1pdFMw?=
 =?utf-8?B?VGJBMUQ5WjlZV2pPYjB6NlptYnZnNmMrWktIR1daN2Z6ZytIaVdCd2JRNkR1?=
 =?utf-8?B?QXZvNFlNUjNCM0hFdTY0WS81eXBiR2RaWm9vMXB3MGNOcmR0OHgzUFJRWFdh?=
 =?utf-8?B?RUVtS3NaVkZpaUcrcmtMV0hqSjF4MVFFeGw2Sk5JempXbmJ6eXI0V3E3Z3pS?=
 =?utf-8?B?TENyRmg5azlzTzd2czNkMDJzakVIV1hkWDlJNUhodUxNN0wwVEhuNXlCRmxL?=
 =?utf-8?B?S3RKaUZJYTZibUdRZkxFVlhaeUxtdFZLV241Zmx2NEx6QUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWY1NVExL3ErYXVNRU5rU05OR3F4c29jOWlyR3ZITVYyblRFL3FsaldSQjY0?=
 =?utf-8?B?T3hmTTN6VUNPNjY2Um54REdXZE4rT2Q2RHVLVjZRYlo0VFpFL3ZIa0ZMbzUy?=
 =?utf-8?B?aEFrWStWRThjelgwcU5PRGRxV1JpVGdXR1dlUDVwWlJXTHpKWXVGaG5ZMVdk?=
 =?utf-8?B?V01pRzJJMkhza1RIYWR6L1FnYjdKeXVHT0dKOWRsb09zYUFTK1ZCdDJoa3lp?=
 =?utf-8?B?R3g1QyswR1MxRnhnK2xpb1Z0SlFWZ295bGcxSmllWnVBWERTMGdacHFYS2dz?=
 =?utf-8?B?U2NCU2E5UUo0TW9YMlJCdDVaaGYrblZLY1BNU0tRQ0tuTWUwZXh3eTR1TUZQ?=
 =?utf-8?B?dVBORDE0M3hQZUh6S2JTd1c4c3VLcVpxQWUrZEZCeVZiOGpDVnZ6N21qRTdC?=
 =?utf-8?B?VU5rTDNQaS9MZHJQR3NZUVZzWmI3R3ByZGRVSHlOTkNIb1N6WXBQRVRpRkcy?=
 =?utf-8?B?dlVLR1VYZ2QwZGZoVXM4bi9RTWdCajQwZG9IaTFtMWZwb1FBaFVWN05qU0pN?=
 =?utf-8?B?aEl5UFVKOHhiQmRuZUZrTi9kVkpBQ1B1YXBJZWJFaXg1R2svY0hPRm1xSnh5?=
 =?utf-8?B?aFVyb2gzdHJEeHEyYWc0U1RxeUNsemQvVUw2K0dnNVdLUUFvVDIvVHZhYnht?=
 =?utf-8?B?bm5Za1IzQTFRcnY3SEkxQ1I3Ykp0Ty83YlNuSlhBNUpzVnNkRmVUN0lrMk9Y?=
 =?utf-8?B?bEU4dVBsKzczWkxYb1hxMnJZTEVmanZDYmJuUnZLZFJ5bWcxZTNTNXJEcHhh?=
 =?utf-8?B?elpaMllvRTgzUjVUalRMS2duWk1IM2R1akkxemNYWjdXRzlLQWNHOW9ib0U4?=
 =?utf-8?B?YW5DRmE3NzB2WGpuSzFHR0tVSVBPNDFvdXBIRVVTRW5XWVl6eU5oMW9wSDN5?=
 =?utf-8?B?MTlvY280RUJVVTRtbUtqMmJoSUQ3VG1yU1dJSG9vWkhRSjB4OG1TOElTbno1?=
 =?utf-8?B?SjVualg1NTN5T0JIMXRCQ0liQlBpSW9sK2RucDdFOXF3SWFmcGNnMWhNakdV?=
 =?utf-8?B?clhZL3M2TGxBNktVNUhBUTVsQVQ4UkU1UDh0cUpERUlmZUlhTFQvMFVDb1BX?=
 =?utf-8?B?d3VpVjFJNTVHd3lGU3MzeFpTRWN4Sk5pcUc3c1JYbm1wWUJ1bW4rYVh5SDFU?=
 =?utf-8?B?QTFpTDhvTmR3STFuNW9rQms3d0ZSK0Z2elVIRVVHY2hzdWoxWXRTbG01YytK?=
 =?utf-8?B?ak0rcUhGVThtSGJlTXhISVdkZ09vTzhIUk5FZ2Y1S2NBa2g2aFlMSTM2VXRU?=
 =?utf-8?B?Y09WSXhNQ3V4dEJHaVpNb2g2TWh3Mkt6NHpJVUxCeEhqMmVncW4zWGExKzNF?=
 =?utf-8?B?bmNaWFpWTENVQVJmakhpZWZ2QmNycXVDWU5CVzhCdmRuWVFnOS9NQkt0TmF3?=
 =?utf-8?B?eUxyQk5sTU5SNlFWbWN0WHl4K01hQ0dzOGpCWnUzYkhoODkwVEw1MTM3WHF1?=
 =?utf-8?B?OW5LYzJoWU93cEY5R2Z2UlZVb3Q3MVVnUFVNVm5RUTBGdGJDRFJINWN6cVpM?=
 =?utf-8?B?WlJUVHlXRHh1UDlsbCtCb2R6ME5Ud0NlU3o3RXVqWWg0QWJFdjkwck52Rk1h?=
 =?utf-8?B?bHBLYWt1ZjkreGtBaGFCWDVOK1FQQWw1b0M3MG9mR0xOUjV4UVBjYURsWHlN?=
 =?utf-8?B?b3RwdWppVkYvSi81N1l4RndydjNzTGx5YmlVRGdoMjQyZUU3SFpKMUpHUHg5?=
 =?utf-8?B?RVB1ZHEycVZtNzRCcVJ5QlJGdXpaOGNhc0lEclNLaWk1WnR4YzFXR1BJWW91?=
 =?utf-8?B?aEE3YzdYSkRzRGZCeHovc2JVTGY0LzNTbVRLZW5zWmxGK1IwaTVLS0dCbE5t?=
 =?utf-8?B?OEJNSDRyZTdGQmsyYkZMbnJPREhXUDgxRldPeVR6TEpJaUQ1VGs5Qi9wbTVW?=
 =?utf-8?B?UHhtUjhOUnJweVNGbFd3cFAzZVN6YXVhVXZXTDh5c3BUekdaL2dBeUVxOGlk?=
 =?utf-8?B?OHVkaFZXOFFzNDRHc0NDMnRvZlhjdVFmWG80YWwyWXdWcmxWcDZpNHBaY1VD?=
 =?utf-8?B?MUdNQm1sQng4ZHhEYnorbzNZS2taZDdvUmwyNTlFak9tbWFIT2NkS1BUQ3Y4?=
 =?utf-8?B?bDRHNEJMZUhGUStUdTFyamRTeStCZ3d2QlRBemhhVXlvN3ExejJiRmF1UTVU?=
 =?utf-8?B?SUZBUncyNFJYaHVnVElOWXd5blRQU0VBY1lKSFU0MHV2N0lESTlOTmFiZnYv?=
 =?utf-8?Q?hpLQ6VLS++I3jj5Y8A4hoC0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FF7306308238344B1CC239C18390D70@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22803cc1-9d4c-4abf-70a8-08dcb7fd9707
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 22:58:16.8088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3odokpuYVHjc0TdXY+qNzZYBKawf9d1TyzwhWpHPgiIfkbqbZVH+CV3m8bKXJq5cJhppSGVflUD+f14LaNXYgiZlWAg62iDYojzF3Bgeml3OvHGNwT3eI+vuVju75hMp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6824
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

T24gVHVlLCAyMDI0LTA4LTA2IGF0IDA3OjU3IC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IEFkZCByZWZlcmVuY2VkIHJlZ2lzdGVycyBkZWZpbmVzIGFuZCBsaXN0IG9mIHJlZ2lzdGVycy4N
Cj4gVXBkYXRlIEd1QyBBRFMgc2l6ZSBhbGxvY2F0aW9uIHRvIGluY2x1ZGUgc3BhY2UgZm9yDQo+
IHRoZSBsaXN0cyBvZiBlcnJvciBzdGF0ZSBjYXB0dXJlIHJlZ2lzdGVyIGRlc2NyaXB0b3JzLg0K
PiANCj4gVGhlbiwgcG9wdWxhdGUgR3VDIEFEUyB3aXRoIHRoZSBsaXN0cyBvZiByZWdpc3RlcnMg
d2Ugd2FudA0KPiBHdUMgdG8gcmVwb3J0IGJhY2sgdG8gaG9zdCBvbiBlbmdpbmUgcmVzZXQgZXZl
bnRzLiBUaGlzIGxpc3QNCj4gc2hvdWxkIGluY2x1ZGUgZ2xvYmFsLCBlbmdpbmUtY2xhc3MgYW5k
IGVuZ2luZS1pbnN0YW5jZQ0KPiByZWdpc3RlcnMgZm9yIGV2ZXJ5IGVuZ2luZS1jbGFzcyB0eXBl
IG9uIHRoZSBjdXJyZW50IGhhcmR3YXJlLg0KPiANCj4gRW5zdXJlIHdlIGFsbG9jYXRlIGEgcGVy
c2lzdGVudCBzdG9yZSBmb3IgdGhlIHJlZ2lzdGVyIGxpc3RzDQo+IHRoYXQgYXJlIHBvcHVsYXRl
ZCBpbnRvIEFEUyBzbyB0aGF0IHdlIGRvbid0IG5lZWQgdG8gYWxsb2NhdGUNCj4gbWVtb3J5IGR1
cmluZyBHVCByZXNldHMgd2hlbiBHdUMgaXMgcmVsb2FkZWQgYW5kIEFEUyBwb3B1bGF0aW9uDQo+
IGhhcHBlbnMgYWdhaW4uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcgPHpoYW5q
dW4uZG9uZ0BpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2
aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4gI3JldjExDQoNCmFsYW46IHRvb2sgYSBsb29rIGF0
IHRoaXMgcGF0Y2ggYWdhaW4gc2luY2Ugc29tZSBjaGFuZ2VzIGNvbWUgaW4gYWZ0ZXIgcmV2MTEN
CmFsbCBMR1RNIGJ1dCBpIGJlbGlldmUgdSBtaXNzZWQgb25lIGNvbW1lbnQgc3lsaW5nIGdhcCB0
aGF0IE1pY2hhbCByZXF1ZXN0ZWQgaW4gcmV2MTIuDQpzZWUgYmVsb3cgLSBpJ2xsIGdpdmUgeW91
IGEgY29uZGl0aW9uYWwgUkIgb25jZSB1IGZpeCB0aGF0Og0KDQpSZXZpZXdlZC1ieTogQWxhbiBQ
cmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQoNCmFsYW46c25pcA0K
DQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZV90eXBl
cy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlX3R5cGVzLmgNCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi44MzkxNDhjOWZhMGYNCj4gLS0t
IC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmVfdHlw
ZXMuaA0KPiBAQCAtMCwwICsxLDU1IEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
TUlUICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjEtMjAyNCBJbnRlbCBDb3Jwb3Jh
dGlvbg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgX1hFX0dVQ19DQVBUVVJFX1RZUEVTX0gNCj4g
KyNkZWZpbmUgX1hFX0dVQ19DQVBUVVJFX1RZUEVTX0gNCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+DQo+ICsjaW5jbHVkZSAicmVncy94ZV9yZWdfZGVmcy5oIg0KPiArDQo+ICtzdHJ1
Y3QgeGVfZ3VjOw0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVjdCBfX2d1Y19tbWlvX3JlZ19kZXNj
ciAtIEd1QyBtbWlvIHJlZ2lzdGVyIGRlc2NyaXB0b3INCj4gKyAqDQo+ICsgKiB4ZV9ndWNfY2Fw
dHVyZSBtb2R1bGUgdXNlcyB0aGVzZSBzdHJ1Y3R1cmVzIHRvIGRlZmluZSBhIHJlZ2lzdGVyDQo+
ICsgKiAob2Zmc2V0cywgbmFtZXMsIGZsYWdzLC4uLikgdGhhdCBhcmUgdXNlZCBhdCB0aGUgQURT
IHJlZ2lzcmF0aW9uDQo+ICsgKiB0aW1lIGFzIHdlbGwgYXMgZHVyaW5nIHJ1bnRpbWUgcHJvY2Vz
c2luZyBhbmQgcmVwb3J0aW5nIG9mIGVycm9yLQ0KPiArICogY2FwdHVyZSBzdGF0ZXMgZ2VuZXJh
dGVkIGJ5IEd1QyBqdXN0IHByaW9yIHRvIGVuZ2luZSByZXNldCBldmVudHMuDQo+ICsgKi8NCj4g
K3N0cnVjdCBfX2d1Y19tbWlvX3JlZ19kZXNjciB7DQo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAcmVn
OiB0aGUgcmVnaXN0ZXIgKi8NCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3JlZyByZWc7DQo+
ICvCoMKgwqDCoMKgwqDCoC8qKiBAZmxhZ3M6IEZsYWdzIGZvciB0aGUgcmVnaXN0ZXIgKi8NCj4g
K8KgwqDCoMKgwqDCoMKgdTMyIGZsYWdzOw0KPiArwqDCoMKgwqDCoMKgwqAvKiogQG1hc2s6IFRo
ZSBtYXNrIHRvIGFwcGx5ICovDQo+ICvCoMKgwqDCoMKgwqDCoHUzMiBtYXNrOw0KPiArwqDCoMKg
wqDCoMKgwqAvKiogQHJlZ25hbWU6IE5hbWUgb2YgdGhlIHJlZ2lzdGVyICovDQo+ICvCoMKgwqDC
oMKgwqDCoGNvbnN0IGNoYXIgKnJlZ25hbWU7DQo+ICt9Ow0KPiArDQo+ICsvKioNCj4gKyAqIHN0
cnVjdCBfX2d1Y19tbWlvX3JlZ19kZXNjcl9ncm91cCAtIFRoZSBncm91cCBvZiByZWdpc3RlciBk
ZXNjcmlwdG9yDQo+ICsgKg0KPiArICogeGVfZ3VjX2NhcHR1cmUgbW9kdWxlIHVzZXMgdGhlc2Ug
c3RydWN0dXJlcyB0byBtYWludGFpbiBzdGF0aWMNCj4gKyAqIHRhYmxlcyAocGVyIHVuaXF1ZSBw
bGF0Zm9ybSkgdGhhdCBjb25zaXN0cyBvZiBsaXN0cyBvZiByZWdpc3RlcnMNCj4gKyAqIChvZmZz
ZXRzLCBuYW1lcywgZmxhZ3MsLi4uKSB0aGF0IGFyZSB1c2VkIGF0IHRoZSBBRFMgcmVnaXNyYXRp
b24NCj4gKyAqIHRpbWUgYXMgd2VsbCBhcyBkdXJpbmcgcnVudGltZSBwcm9jZXNzaW5nIGFuZCBy
ZXBvcnRpbmcgb2YgZXJyb3ItDQo+ICsgKiBjYXB0dXJlIHN0YXRlcyBnZW5lcmF0ZWQgYnkgR3VD
IGp1c3QgcHJpb3IgdG8gZW5naW5lIHJlc2V0IGV2ZW50cy4NCj4gKyAqLw0KPiArc3RydWN0IF9f
Z3VjX21taW9fcmVnX2Rlc2NyX2dyb3VwIHsNCj4gK8KgwqDCoMKgwqDCoMKgLyoqIEBsaXN0OiBU
aGUgcmVnaXN0ZXIgbGlzdCAqLw0KPiArwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3QgX19ndWNf
bW1pb19yZWdfZGVzY3IgKmxpc3Q7DQo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAbnVtX3JlZ3M6IENv
dW50IG9mIHJlZ2lzdGVycyBpbiB0aGUgbGlzdCAqLw0KPiArwqDCoMKgwqDCoMKgwqB1MzIgbnVt
X3JlZ3M7DQo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAb3duZXI6IFBGL1ZGIG93bmVyICovDQo+ICvC
oMKgwqDCoMKgwqDCoHUzMiBvd25lcjsgLyogc2VlIGVudW0gZ3VjX2NhcHR1cmVfbGlzdF9pbmRl
eF90eXBlICovDQo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAdHlwZTogR3VDIGNhcHR1cmUgcmVnaXN0
ZXIgdHlwZSAqLw0KPiArwqDCoMKgwqDCoMKgwqB1MzIgdHlwZTsgLyogc2VlIGVudW0gZ3VjX3N0
YXRlX2NhcHR1cmVfdHlwZSAqLw0KPiArwqDCoMKgwqDCoMKgwqAvKiogQGVuZ2luZTogVGhlIGVu
Z2luZSBjbGFzcyAqLw0KPiArwqDCoMKgwqDCoMKgwqB1MzIgZW5naW5lOyAvKiBzZWUgZW51bSBn
dWNfY2FwdHVyZV9saXN0X2NsYXNzX3R5cGUgKi8NCmFsYW46IGNvbmRpdG9uYWwgcmI6IHJlLXF1
b3RlIGZyb20gTWljaGFsIGluIHJldjEyOiBpeCBjb21tZW50cyAoa2VlcCBpbiBvbmUgYmxvY2sp
DQoodGhlIGxhc3QgMyBhYm92ZSwgb3duZXIsIHR5cGUgYW5kIGVuZ2luZSkuDQoNCmFsYW46c25p
cA0K
