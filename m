Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52519CF58D4
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 19:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091B110E665;
	Wed, 19 Nov 2025 19:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXk76FA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4D610E665
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763582156; x=1795118156;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Hgnn9KWgzN6Xt3PfeW/h812FFAMs6kmrSax2AI5/aoc=;
 b=HXk76FA0XNaO7lUB503Dki2XeSvIMp6Xw9QgDhJNHaAHGFSyeqWjxJrW
 do409NSWKRGyOzwEV7iuiWN8/+CAIs1XeSF7ul/WM1FI6o6mULa/hR5eG
 G3ukA9aZgYx0+jNIHir74Gh7mQ1HkTLNKwf5FS0ZbmLAwUYUK3Ty/MTOV
 gMKO8Pnp8WY6q8RftpGLTKT2AIV4z3PCnaoJVloO6RuW6mIbvruGrDp0F
 E/ONERW8BrfAZlgoANDafusaRlu7Xfd9xiZSYzIqBU3YkX2+o1k/MemMG
 omLS9a/i9UjBo6KuuCEzcwGCig2lhx/As+gXhlOXHJPVo9dDE0plRTCIv w==;
X-CSE-ConnectionGUID: AbEOrxi2Sq+dQ5JnXPPc8g==
X-CSE-MsgGUID: LStjHadXSJOSAMDc1Nb3fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69254938"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="69254938"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 11:55:56 -0800
X-CSE-ConnectionGUID: UHbIgR7bQtS2oqRooPN2HQ==
X-CSE-MsgGUID: DHpXIuH/Ts+BITQKBSxdnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="195460749"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 11:55:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 11:55:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 11:55:55 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 11:55:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ft3T8Z7CeAskgB0XL5BJIcnD88KDvWnhNecDsA69pXC8utqiThZRYFHU8+2SkjDCadX6FhYd3txAiwTQ2PF25CYhG6iBxCzq6K+tKOKOQPUswbAI5qglr6mhrKFiV8ZX8oUniBg+ywjBoygPaFfkp2wmzRjMZ/SmfxyQWEsKDSA3j/AYpadyXEG5TcdqBeSSdpkheuYj6aKMc0S8jXBJV63zhNoKDmCiEJtivw9INZRxxRQXckgQ9S4BrAoyNFbJEgk5su/4vY5zGx2IEMZ8uePi08Qo3xwYyQfUGIxVmiAF+OKzQ1jLti7630GYpjspPLAM+Ks9vXsJNi+DlxO1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aURZ6aNHcpHE5i4wdoCwWD8GtpU4qnVsl77xbHnJSY=;
 b=MLPU8JsCADcj1ue0Kk8iAKFZOLFwL+WL2QljjQHIg0AKT47V6emsdXvdJ8p9qCh/xN6fkGTWCZRtap04sfzvNh+oWEswALRACmXLAUpxht8dBPli9+JdMu2PnqO6Fx0mTaNlWuA+5p0LN1gQCb5dinMtx31Q+Vhm61Q/TTFEvLdxRWa//kXosG2VKnr+R7xVzyXbPdX0a+knseErFYQiVplFCFJa3emBS1O40KDwwndaIb7EfhQD3q4zr4qrpvUFUpyECz39EBLlJWI1OSU4lxP2NSpzNktjAc/ATI1Q8qDpa/XmTL0r9lH9j7R4Jv56+N8oOFg3vjk0Hmgt9A8pIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB8825.namprd11.prod.outlook.com (2603:10b6:8:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:55:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:55:51 +0000
Date: Wed, 19 Nov 2025 11:55:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/vf: Start re-emission from first unsignaled
 job during VF migration
Message-ID: <aR4gxSx9WSzqX+xD@lstrano-desk.jf.intel.com>
References: <20251031201345.3015516-1-matthew.brost@intel.com>
 <9c179328-bc36-49c6-9147-869b9ce2f77b@intel.com>
 <aQ2kVCs94QjLECVQ@lstrano-desk.jf.intel.com>
 <28f6a7e1-469a-4f83-8492-94cf9396c58a@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28f6a7e1-469a-4f83-8492-94cf9396c58a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: da56218d-0d9d-40c2-9cfe-08de27a5a44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUF4RGRaRlorallGT3ozbVhZMXBTR3JQT0JNa2VueWxtbisrOVZYeEpGd3dm?=
 =?utf-8?B?b0NyVjhHRi8yS04wVjFkaG5rZXFKYzlWUmFlT2tQa1FjYjh5WWNJRzEwNE1n?=
 =?utf-8?B?eEZwbGpYNDYyK2VkcG5tVjhLRzh5bURkbUQ2NnYrTnJQaHRkZjA4d01jT0U0?=
 =?utf-8?B?aEtSaGIzaHc1dUZNUnhSWis5OHordzFFMlJEVVpSajNORkxNODVmWlNOZURh?=
 =?utf-8?B?TUZHWThTek5uOFYyQ2RmbnEwN3BXTkZYQlNtQ05BUS81dUhETVl1aVl1UTZ5?=
 =?utf-8?B?WThSeWZndDFlUEhHejUxd0p4ZlVBYnp2T2pMbkNUQmFOelhPcFNsSEVJVGJI?=
 =?utf-8?B?UzBnYWVuNVM1Uk5UQmt3SFFCT1ZFRWRqOUs4aEFGNHphU2JZMDBUNVp3Tjh0?=
 =?utf-8?B?Y0VRazB5Z2pwZTUySnNrNmtGTGJuYWFHL05HT3RXb2NOWElwRi9iWDJFbE9B?=
 =?utf-8?B?b1VpV2pMZGFBbmtWQitkWlZuRi9SbmJQUGxKbEdTejZ2NmxDckp6a3lYaDY2?=
 =?utf-8?B?THl2TXZRMjNuRFpJQml6Y1h1M1dpVUt5VE9jekVFekNaNGM1aFhQSE9sdndS?=
 =?utf-8?B?d0twc3R4R1dGMm96bkJVZGV0Tm1KL0NuSGVJbGRCei9DdExodWJ2MmJDcW9E?=
 =?utf-8?B?bTZ2dGNRd1plbHhhU3ZrNW4rUk8xUlZFOUZ0Qlc1UlFOUkVQNWExRGpCT01V?=
 =?utf-8?B?ckppazBzZThMaDR0S1dxNXk0R2V0Ym4vcFdhYm1Id1RrS3QwTUZwWWxnQ0l2?=
 =?utf-8?B?VVYwVFZZTWYrNkxTVGtoQUtDRmN5MmJ2cWhwUlRQSUZoNGE1ajFGeFpwWldO?=
 =?utf-8?B?YmY0MFZLT3Rqc1dVK1ZVMlhtdlZOT3hLUnVUUkVraTZmKzA1cjRnMnhmMlJK?=
 =?utf-8?B?MzU5NlJZUnFVMW1vWGl2WW1UTW1reGc1NktoZUZwVmcyOWMzVUdhRUkrOENa?=
 =?utf-8?B?a1pRSFNaWVpmdDFCR3kxaFdHNkpkbkJWRmk2bVkwVXlRS04yazZnRDdPNitK?=
 =?utf-8?B?Ykl2djBwVWNvcGQ3UjVvb2NuT2pJVnRnS3EwQXZ6cFZ6Q2ltOWt1WWEvSm9J?=
 =?utf-8?B?ck02RUxEUnhpRFZQTjExMkxkNXN1c1JvVThEeHJzUGg4L3h4YktsZVl1b1R4?=
 =?utf-8?B?MXh5NFVpdHg2c2VhaUFsLzhxQ1BXdjBwNDZWdnhlaCtTWHUwTEkxMjI0cnBk?=
 =?utf-8?B?RFR5QXRTK1hRMUU4aWV3RnN6OFVkTXFtS0N1OTErUlJ6WmdOVkoyQlNHcHlt?=
 =?utf-8?B?STVzcTNDS242d2tVR05tcjJOQnBRaDRPaktzeDJvQllheTNsS3RwV3h5VXlC?=
 =?utf-8?B?WitOT3hBU28ya2QyWSt3ZHZRQWQ4b2lOZ0lPeTB5YnM4SWZMYWdOSlZTNzE2?=
 =?utf-8?B?TjBVeUN0OEZPZU9RYUNNOTV6b2MrN2J3bk82dktxVXRkSFA0ZzlYc1NZK0s3?=
 =?utf-8?B?emFrb2x0eXd1UGZXYlk3a2p0WFhETndBM0RQRkR0bWN5ZGs2dG9RUVFMNVJG?=
 =?utf-8?B?dmRGbTdDKzJ6K3JTVERRcWRIZnNXdEFCUkZic2trMUJjWXFaRm5JOG55L2Iy?=
 =?utf-8?B?YmtIY2tieTkzU0NMa2lDVFNBeTg1Qlo2S2Uvekk0ZmRydHRaWmk3YlI3N041?=
 =?utf-8?B?TzlWaUtadHRoNGVoQ1RCcEhJcUhHOUN5L1NIcnFYZDlsRStva2pQUVZmNWI0?=
 =?utf-8?B?V0thcW0yVDRxQlJseWZqdWlHN3BqTUFiRlhCTXd2RWQzQVlyL05mbHQrOTlZ?=
 =?utf-8?B?T0pmaUJQTFlzM3pXSTF6ZjRjWnFwN0R2UTlpajRvMG45STV1TDVNdktYWWtR?=
 =?utf-8?B?VmZHYzAzT3JJMURpS3RWZ0FVNlNnbVdqT29BQ0FzY29vYi8veGdhMXNlMFl4?=
 =?utf-8?B?UldMWHpocGltYWp4V0NYa1ZISmlvK1F4QTlEM292MlZsaGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm94WUJhWk4xU2Fzd0FKNVhJeWNrVmYzV2Z6RFRzdnhqdnhnUWRQOGcrNGVM?=
 =?utf-8?B?MHE0NklzTnFZZjV2cThTUVJTNWhqa0NJWlc3bGVQRkdQWU1pbytHNDhUdjMr?=
 =?utf-8?B?UUdKRVBXSFNWZnBHMVphck5mVWRsU1dFU0NoMnNlVVhUZkkvc0Y5MEJmM3h2?=
 =?utf-8?B?ZWhzSGV3dmF1ak55K0V0Rit3QzVjN1R6NUwyb3phalFNYkJha2p2QlNYN1pM?=
 =?utf-8?B?Uy9pWkppTHBDeWRIRXNYNTZGOXhhTE9SeHlaNkRENTNCbjVQRTRwQS9QbHJu?=
 =?utf-8?B?aEZZTmJpTnkzcmRwMnM2bW80Q0lXRzdJR2c0WjZOVno4cGx3RTlOcHlqeHR5?=
 =?utf-8?B?T1A3U3RkWVVoWGxwcjkrL3hrOGtCWFVXbUVwNFR0UVJOZFdoSnpaN0I4SWh1?=
 =?utf-8?B?aXl5TUdDb2xJbm12c3h5bUJSck1wRzhrT2MxMGVxUEhqSWV5c2VNWGpkZ1FD?=
 =?utf-8?B?RmRkZ2IvZW5hTzN0Rms3M3dDSXpwdnoyWjhzcjQya1JBYVRuaXRvWTZ0bVFT?=
 =?utf-8?B?SGs4UWtRcjZ2dkFNdVExVFQvNWYxTU5zQ2dacGxzbXc1a3pBSnR5aDhVeUtz?=
 =?utf-8?B?ZkRLMjlmS1VaaGJSaVVYTnpKK0hPd0l4ckU4U01yRjdqd2VIbDhRNXNvZmRa?=
 =?utf-8?B?VmdCUzJvd1BZV0k0MjhUUnFEbGpVN2dvZ1dSSUVpV3J2aWIyVkJYcFRIeUR6?=
 =?utf-8?B?TEtvbzZVNjlYYlNKNnRNWDV0RTdOeWZBTnNVV005bDBYc2pWMG8wYXVzeFZB?=
 =?utf-8?B?V1RQMXZjaDByWGxpa0lZSGl0RTB6dlg0dVhzYVhmT0dIRU9LY0hYQjVvdENr?=
 =?utf-8?B?OS9IMnlYZjVISUg2clluU2V4VUhIUVlwa1BCTFUxaXZBZmZqUFl5RjBqbUhG?=
 =?utf-8?B?ZWlkUGZ4Z25Ed2Y5cUY0dHJLWmN4VHBZUExWWklNVzUvY3NadUswNm1FTkx4?=
 =?utf-8?B?UDRUZ09yMm5URDdkUUNRZnVmaGRDV3ZvU3BJNVBVSHZiaEdVQ0poYVYxbmM3?=
 =?utf-8?B?cFJsVDE5U0FYQkFJYlBOZEtOTG45OEJrTHh6TTY0UmtuT1dwRnY3ckdqZVFV?=
 =?utf-8?B?WlZBS2kzQXZrSXltS0pwdE4zYjRER3JoeFlUOXNTenZwdG1yZGIzcSs1djhY?=
 =?utf-8?B?b2t2MGNPR1UrVEFTVXdRd3NHYVoyOHExS3VDb1VWMVhhVElLRk5qOWVtVUZV?=
 =?utf-8?B?dkZMb2Jlc0NnMFdQbHhLRUtVQ05IUFppMVMxK1BWZDN5VTIxNWExLzlIcWZN?=
 =?utf-8?B?aDRxaW4yME94R1Z2L003UTIvWWxlcnZ2ZU5NczlhU0tMcU5lM2xJVnBtcC96?=
 =?utf-8?B?QjVlSzVoUVdsNjlJR1Myd0JlY0prZzRjb0I4cFVBbG5mMVJEZjBkaFZMUGoy?=
 =?utf-8?B?UXFGYUd0ZDhiZitHRy9ZR2k0Zi9Vczdtc1hYTmdpbmVxSzhVWGM1REFTd1JC?=
 =?utf-8?B?ZS9pQUJrUHNxRzVnNGE3eW1lZWNMK1RtVVN5NUQzR1NjTDQ3d3UxOUxqRE15?=
 =?utf-8?B?N0UyNTBpTEFFUW9CdTlaUlo5V1h0RVNRWGRJdGFMb3huY2dydTg1QUF6R3NJ?=
 =?utf-8?B?dG9CeUY2anpVaHlqSHVUK0NMc1VFejR5S0xMNk1FQ0lDV2lXeENQZEhwMk52?=
 =?utf-8?B?QWxiRGJjNzdhWDNsVCt4eitJbkJXU0JEZnlvdnRpVlJRQmJpOEZ2clZYeVlk?=
 =?utf-8?B?YTV6S1ZFK0kzcG5iZFc2VGR5VUhtT3ZJdmJ6SUlzNlo3OGIxNVhEZDJFU1ov?=
 =?utf-8?B?SWUzZE9HYlNwTkZsZG1udHZnQnBtU3hrWW1FZ2NodUhkclNHdzVEek85ZWtF?=
 =?utf-8?B?cXpwckY5cGdsTkkrYTh6blhod0o3QTlQcCtSbXY5cTFJU3oyZjg3dWtoV3hI?=
 =?utf-8?B?ZVhIWGtpRWRzc202R1VlV2dDNUo3R3lJNGxjZ2RsVTZUMjM1R3dDeEFvcUJ5?=
 =?utf-8?B?b0hsbUphYWJoZWtZQzArdzRjSUhSVG9iWXJWM2JoRlZ5enBGYSs1VU5kTnFl?=
 =?utf-8?B?SXZDaDdvc2Urd1o5dkJ3RDJ4Ni9xaXY0d0F1dG5HVDhSYjBZcmN5a0xodWRN?=
 =?utf-8?B?VjRrc3VjQ3RNVWR3QVM5cHJyVVhTeFRsQ1V3SmNtbDgvMG9rcmx1cVNMNHpQ?=
 =?utf-8?B?b2U0UUZIcHpEVDNlRzlHalpkb0xaUmx6Z1Z3Umk0QURCdE1nUFM2ejdDNXpP?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da56218d-0d9d-40c2-9cfe-08de27a5a44c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:55:51.4017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRpvSQe0gE9MaZ2S2sJF3/qHOMCZ/B/DcRMp3VE2KgEDOAs7zQaq+Cp6/Vjbl8WtTYmt1xpWGVP01SHIQTi3uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8825
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

On Wed, Nov 19, 2025 at 03:48:28AM +0100, Lis, Tomasz wrote:
> 
> On 11/7/2025 8:48 AM, Matthew Brost wrote:
> > On Sat, Nov 01, 2025 at 02:33:07AM +0100, Lis, Tomasz wrote:
> > > On 10/31/2025 9:13 PM, Matthew Brost wrote:
> > > > The LRC software ring tail is reset to the first unsignaled pending
> > > > job's head.
> > > > 
> > > > Fix the re-emission logic to begin submitting from the first unsignaled
> > > > job detected, rather than scanning all pending jobs, which can cause
> > > > imbalance.
> > > > 
> > > > v2:
> > > >    - Include missing local changes
> 
> Explanation of previous remarks and a request for a code comment below; but
> other than that:
> 
> Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> 
> > > > Fixes: c25c1010df88 ("drm/xe/vf: Replay GuC submission state on pause / unpause")
> > > > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 +++--
> > > >    drivers/gpu/drm/xe/xe_guc_submit.c    | 19 +++++++++++--------
> > > >    2 files changed, 14 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > index 9955397aaaa9..357afaec68d7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > @@ -54,13 +54,14 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
> > > >    static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> > > >    {
> > > >    	struct drm_sched_job *s_job;
> > > > +	bool skip_emit = false;
> > > >    	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > > >    		struct drm_sched_fence *s_fence = s_job->s_fence;
> > > >    		struct dma_fence *hw_fence = s_fence->parent;
> > > > -		if (to_xe_sched_job(s_job)->skip_emit ||
> > > > -		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
> > > > +		skip_emit |= to_xe_sched_job(s_job)->skip_emit;
> > > > +		if (skip_emit || (hw_fence && !dma_fence_is_signaled(hw_fence)))
> > > This looks ok, but what is the mechanism which could lead to a job after the
> > > first  `skip_emit=1` job to have the `skip_emit` flag lifted?
> > > 
> > This shouldn't be possible with the current code, since we're checking
> > hw_fence. If we were relying on the software fence (i.e., the job's
> > finished fence), the state wouldn't be stable. I think our eventually
> > the is goal is to use the software fence [1] to avoid DRM scheduler's
> > violations, so defensively / future proofed coded here.
> > 
> > [1]https://patchwork.freedesktop.org/series/155314/
> Makes sense.
> > > Wouldn't the only possibility be that jobs were executed out of order?
> > > 
> > > >    			sched->base.ops->run_job(s_job);
> > > >    	}
> > > >    }
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index d4ffdb71ef3d..f25b71aca498 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -2152,6 +2152,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
> > > >    	job = xe_sched_first_pending_job(sched);
> > > >    	if (job) {
> > > > +		job->skip_emit = true;
> > > > +
> > > >    		/*
> > > >    		 * Adjust software tail so jobs submitted overwrite previous
> > > >    		 * position in ring buffer with new GGTT addresses.
> > > > @@ -2241,17 +2243,18 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
> > > >    					   struct xe_exec_queue *q)
> > > >    {
> > > >    	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > > > -	struct drm_sched_job *s_job;
> > > >    	struct xe_sched_job *job = NULL;
> > > > +	bool skip_emit = false;
> > > > -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > > > -		job = to_xe_sched_job(s_job);
> > > > -
> > > > -		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
> > > > -			  q->guc->id, xe_sched_job_seqno(job));
> > > > +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> > > > +		skip_emit |= job->skip_emit;
> > > All emitted jobs have the skip_emit set, unless their EQ got submitted to
> > > GuC which clears it, but if it got unsubmitted without finishing then the
> > > flag is raised again.
> > > 
> > > So this does seem to select unfinished jobs.
> > > 
> > > Though this introduces an assertion that within Command Streamer ring area
> > > of a job, there are no GGTT references between seqno increment and end of
> > > the job commands. Maybe worth commenting in code that we're working on that
> > > assumption? Example issue would be if someone introduces saving some kind of
> > > metrics there.
> > > 
> > > (this assumption was in power before this patch too, but now as we're
> > > skipping fixups for finished jobs still in pending list, it becomes more
> > > important)
> > > 
> > > Also we're emitting jobs which have a flag names "skip_emit" set. This
> > > disconnect needs a comment too.
> > > 
> > I am not following this comment.
> 
> What I described might be non-issue; but regardless, let me try again:
> 
> Every job has an area allocated on the ring buffer; the area contains
> commands, which:
> 
> 1. Jump to the user batch buffer
> 
> 2. Increase seqno (by GGTT write)
> 
> 3. Trigger user interrupt
> 
> 4. Do some finishing commands
> 

Right now (4) is only emit_pipe_control_to_ring_end which doesn't touch
the GGTT. It is odd we even have (4), that kinda looks like a bug to me.
Will check up on that.

> 
> What I tried to describe before is a situation where commands from (1) and
> (2) were
> 
> executed, but then the context got preempted, before reaching end of (4). In
> such
> 
> case, the code with `skip_emit` would consider the job finished and would
> not apply
> 
> any fixups. This could become a problem if during (4) we did some GGTT
> writes.
> 
> Now, it this realistic:
> 
> * Currently we do add some workaround commands to (4), but MMIO writes only.
> 
> But since there is a precedence of placing WAs there, a GGTT write could be
> added
> 
> at some point.

I believe WA are added in the context switching out, which this step is
non-preemptable (i.e., it is part of the preemption process).

> 
> * But the whole premise requires that there will be preemption point between
> end
> 
> of (2)  and end of (4). This is not a case, and I would be very surprised if
> that ever

(3) has a preemption point which is why the case where we have (4) looks
wrong. Writing the seqno + user interrupt should always be the last
thing.

> 
> changed.
> 
> So, the above is not an issue.
> 
> 
> A second remark I had is that we're introducing a code like this:
> 
> if (skip_emit) then do_emit();
> 
> The issue there is that someone reading the code will see it as
> self-contradictory.
> 
> The first thought will be "did they forgot to negate the condition here"?
> 
> The code is ok, but a comment would help to avoid this confusion. Ie.
> 

Let me rename this variable for clarity. How about 'vf_restore_replay'?

Matt

> /*
> 
>  * If emitting will be skipped when re-scheduling the job, then the emitted
> 
>  * commands need to be refreshed now, to keep GGTT references valid.
> 
>  */
> 
> -Tomasz
> 
> > The idea is that in guc_exec_queue_pause, we set skip_emit—this acts as
> > a marker to iterate over and resubmit jobs regardless of other
> > conditions. As I mentioned, if this marker were based on a software
> > fence, the state could change between guc_exec_queue_pause and
> > guc_exec_queue_unpause_prepare. The current code uses the hardware
> > fence, but that could change between pause / unpause too.
> > 
> > We need to keep the iteration consistent because it also affects the KMD
> > software state. Even if a job signals during this flow, there's no issue
> > with the hardware; the key is maintaining a consistent software state
> > throughout the iteration phases: pause, unpause_prepare, and unpause.
> > 
> > Matt
> > 
> > > -Tomasz
> > > 
> > > > +		if (skip_emit) {
> > > > +			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
> > > > +				  q->guc->id, xe_sched_job_seqno(job));
> > > > -		q->ring_ops->emit_job(job);
> > > > -		job->skip_emit = true;
> > > > +			q->ring_ops->emit_job(job);
> > > > +			job->skip_emit = true;
> > > > +		}
> > > >    	}
> > > >    	if (job)
