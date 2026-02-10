Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4FBEA810D
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 13:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC13010E573;
	Tue, 10 Feb 2026 13:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iF0JU70s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B5110E573
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770728562; x=1802264562;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WNqnBv3WsFH+tGsPfQ+AS2PP/D40EPwThxZ4GjNtFb0=;
 b=iF0JU70sMshqvwP/93xmKZrerB9tZFtmyCbtt+tOP3mZGxAO66M4XXke
 oYquMNC9wwd+pTEf0cyxUqs0RTWEvLD+2Fnsrwcy7y1zq+SXz8SP/dwas
 yJrJHjk1yc5R1lKkUwYSoDu8Z3buM39JR17Q68pi5+/PLc1UlkO0/cQ4V
 c6v28HcK2qlK+h+t+yDqMALaCCAT21URpKm9yaMg7d/kWpBqGjti2gk4H
 ucoPeK2pvoQG7fqExixHpjugEzPhC1RutCgnrOwu6lQ7doxy6oY9WyB9V
 Vuqm37hVfWUVkl0kPKOg7yawy3Pdp1uw764a1QxYuAOiE+nl3j9IubOrP A==;
X-CSE-ConnectionGUID: qQ7LwHMESWmzqA21dubXrA==
X-CSE-MsgGUID: ODNRNm5OSg2H/+Ia3oVUaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83293713"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="83293713"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 05:02:42 -0800
X-CSE-ConnectionGUID: av51i1K3S/y5cwVEBcS9qQ==
X-CSE-MsgGUID: oz3SrLzESxC/aA0Mf228Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="241881501"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 05:02:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 05:02:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 05:02:40 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 05:02:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHjfKP2Xf2XZ1uI90jgSEKFeUpTNgML92pYUMaLjgrF3eeVdKQxcZm8oLCUO9WOgogiNPlKiNKaTgNffTk3hRRXAARaIA1dRMVyKBl7itHOy/uFw7NLN3FOm7eianoxBVUdOI/PFY8VGTLtG9Z1hMXKt1zmQzzsW+ccURuSZy7oacqcNDXgnEiyVJgJvzLntSIkVPmcHW40JRQGQUbsQ8C2xhDFRKl80audaNqjYVVNH3NlLg+D2+NU5FKDrC/RJGNidjytMkKVzk9IYwIHJ9a08/cIkSoN3Y9qDvKtPN1VdIjdLB9t2hy3IFJJdCyD2TUkDBIYFvoGvMW4UdUUSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXfVdUQpCd9BwAw7/XVEyw4eiB7KeVwgGKiFb7EoRdc=;
 b=xgex79LafmDnXzf5RyM8BGNuKgoJ+wKSR3U7FXV051IO6Izr5O6VfOHQ1JVrD5DGkn4/QGy55ay47JVKHHUiehkxuVP1jgK3i/g6xAt9XOZ7n/Uruaq+/hcyOwit/TkhbqBxVBAThobkoqnCnr76tN6QGJOEUgHpEAvrmC6RbfLx50ZafFhUD0ADoWCuk6HXzf9DwysxscsVsZyIKlo6m/RxlxsCd2JfGz0ZMFpMye6bhJDL7K/e2eMCDedQ2OgCO1BhQDVTKlFgGOqAdqYXdpp56CcH9yuDCCk/TBiy4cEmq3Frrs9xlC2NOfpIjTyAO156GViZY4taHkZ9EX/Qpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB9279.namprd11.prod.outlook.com (2603:10b6:208:561::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 13:02:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9587.013; Tue, 10 Feb 2026
 13:02:37 +0000
Message-ID: <dfb761f4-eb4a-4a86-9856-b5da35f16d94@intel.com>
Date: Tue, 10 Feb 2026 14:02:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
 <20260210105929.4089794-7-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260210105929.4089794-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB3PR06CA0007.eurprd06.prod.outlook.com (2603:10a6:8:1::20)
 To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 068af302-6124-40c9-860d-08de68a4aa3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWpLZHE2SE9pQ3dCL2NoUkQ2amtvQ2ZoVWFONUtDdkR4S2hUQy82bURJcm1j?=
 =?utf-8?B?aE9PNlowblhJTUJuSXJudnRWRUl3MXdzcE1PeXRDNUhkL0doZE9KSkl5U0dW?=
 =?utf-8?B?NDF0OWxQYzVGRjhEREJ2b083NU04cWZ2Rncxekp1dHBuOHFFa0NtOUlPYUVv?=
 =?utf-8?B?bXk1ZXFLTi9QSUpwUlJlNWF2cUFRL2xLMEdZTEVpYmxtNmFscng3Ym1ha09q?=
 =?utf-8?B?K1d1aWFucU9VTm1rUGNNVUY4Y0xQNWtlTzFSS2lUMXExaFoyQWJWMHVLdnNn?=
 =?utf-8?B?dXVHSmwva0VjeHYwNjgzcHlybmpteGVSMmxXKzluOGZQYkRZcHA2RUhDaTkz?=
 =?utf-8?B?T0RLYSt2bjBselFtMkp4SXlmbVJjM0NPSXFidUFvSll6VGVsZ05RNDE5eTln?=
 =?utf-8?B?VmtRYzRBOHNMYU1Ob0JvWEtwL0E5WThPOUlsVVpxLzZIL1pObTA2bzBXWEdi?=
 =?utf-8?B?WHVwWnhtOEFsT29DamorUmx1WGR5dUd2YU9md3MzTm4rUXRxN041WHJWTDlm?=
 =?utf-8?B?M3prRGNNcEhhcWNYcldmNllrQ0VTNFBLSjJyWWhCWFdDQnp2YTQ3dGRDdk1x?=
 =?utf-8?B?SzdDcmtnZVcrWFFLNW5UUHV6cmF3RVBNSDcrdUNGWnFJMnRnUVVCK2Iram5S?=
 =?utf-8?B?ZHA3RnJXRU9LWHpGbnpLVHk2ZTU2UjlnTHlHQ3QvODMzbUlRRk9TZ3NqR1Jy?=
 =?utf-8?B?WmdSNVFESkFXN3hLUmwyWUEyRFdEeUQ3cmtuekpzNnRsa2lmaFFYUmFEWWQw?=
 =?utf-8?B?dzJmSUhWMnhmclNrdnFqWVNxRFlOZTlPZ2N4NVZEYUZpTzE2d0pSOVFXcmpI?=
 =?utf-8?B?d2xiTWM4UnZKenBzS3Z5STJ0VXp2Z1hNc0xPSEtCRUtwTVdsbFI0UlhoZmhT?=
 =?utf-8?B?N0doa1lQZExHcVdRK3BWVEZuQ1VESFFmNldvMEprRXdjYjhwcjVkZHVLemlQ?=
 =?utf-8?B?Ym5Vd1FQZjBRVUIzZS9xSU1qTnBQckN6dnRxd0ZkUWd2R0Z0V2NFdk85WDN3?=
 =?utf-8?B?ZzBLYVFmRWF4RnMrakxzMmJobUZlRGdOYXExWnRkb1JiVVo2K1JBNFIwdC9E?=
 =?utf-8?B?S3pXYU5kd3RVSWtXODg0d01OVW5EVlJoSjFyWHZDTlE5WkJ3dXJMekdnQTZn?=
 =?utf-8?B?cU91Y09IbkU2S25UaWdSNU82bHBSTWgxcTM2OENTbTQ0ZWZoNngxb1E5Zytx?=
 =?utf-8?B?OUcxZG9WWjVqT2dBNHZiZExVc2FFTGNraU9VWHJCQ3N2TFZhakZuZlY0Zkxt?=
 =?utf-8?B?UXp2bXJSS1I2QVRuOHI5OE5QTDhCQmZ4NHZaMjlnNEhPTWJsR2FIdkE0UTQv?=
 =?utf-8?B?YnFkbmdPR0F1VWpadHdScFZZZW5FSjh1SjRHblBodndtLzdNUUpDaHhDVmRY?=
 =?utf-8?B?b3huRk1ZZkhFRTFyQ001dHFWN3dEa0dyeVQ2Smc1YnphTTc2YlVLKytLUFd2?=
 =?utf-8?B?RHdhL3kwMmVxSnFOWWFMVlJxa05ENlVueFpLdUcxaVZYZTFIMDJUQWlLWHQr?=
 =?utf-8?B?NmhpYkJrR1VpY0ZBUE9XUlNBaUpibmcva2k2MER0aFhhbG5YdlkvcG1meEhr?=
 =?utf-8?B?ck5lNUVhcVFwUE1kVUNoV3BFZ0F3SFFBL2xNcndXUk13OUZwV3UrV2o1WlNo?=
 =?utf-8?B?WmtYUmwrK2VOMVRWamQxTGtCbTFadTYzcDVwZ1MxQmUweE05VGk2WngwcE9m?=
 =?utf-8?B?RnRYSTVtVXNHU2lLcWNkL1JaY25qbWRPdTJ3dFR5Sll0M09iem1jK1lIY1VL?=
 =?utf-8?B?ZklQZWVNcDA5VXdYbk94Y0lzT1ZGc0dMMjBoQm1BQm96eEFOK0hhZzRMMkpP?=
 =?utf-8?B?TXBVSFlYY2F1TEhKZlRTM1VwTGt5UzJBUzYxWTRUWDdtRHF0N2x5MEViTFF2?=
 =?utf-8?B?SWw5YmNsRFcxY09IZCtQdkJ1clFCWUhRazNuVTFEVEYrU3RDSUxVVWFmYnU3?=
 =?utf-8?B?ZTBzNGM4ZTZMWjhRNlMxZEFUbnpYL2l5Q0kvaFM0T3RWZVBnaHRBdVJXSnQx?=
 =?utf-8?B?WngvVzNIdkZ1U0NMV2NDRjNCeWtWZUtuS3JNSnMvb01nN3FvRUhuWnNNWTZh?=
 =?utf-8?B?QjlGU2dLbHhXZUhuWS9ZQTQzZEM3YUZwajZSMENDdm15N3RUYkoxVzVTNTFw?=
 =?utf-8?Q?RdQg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkJMTUcySDNVRS9CdnZEWTdObkJGN2sxQkpudTcxUE1laXNqUWJ6U2ZsK3la?=
 =?utf-8?B?OUIyQXhZSUdLK1ZYc29IajZnd2U3ZDFydUV4NisvUDNId1I2MnZUSUVFZmNt?=
 =?utf-8?B?K3V3N0xkVUoxTjk5aFQvei9waHM3UG9ndldTUk9OR1ROWEFkeGJHQTJHdjRy?=
 =?utf-8?B?T0pZa1J1dXhSRWlnZy9nek1EUUtDaUtlb1c1bmEwTWlxZDc5L1dnaFJzNnk1?=
 =?utf-8?B?WVNhTmYxWk5lbFZFYTJqMk83bURDTUVwcEllZUpXKzdGNmYzM3VML0dUYmI2?=
 =?utf-8?B?aWdjaTVTVzN1M0FBQW9aSG5FNG04UmxlTlZKc1cxZGFFei93TjJGT3dmUGdT?=
 =?utf-8?B?Uno5R2RVOUFuNWJLSDFrcWJyRGk2UmNvSGhGSTZyK3V1VnBYM0xabW4rLzJj?=
 =?utf-8?B?RW9aWXZCOGZwYnN3NnBFS3g1NHNpSU9yenp0Yno0SHlpcnBKaDV5ZElSU2lk?=
 =?utf-8?B?eE5KT0tJYWhxSjBpYUVUT3d4N2ZmQ1h3WTJ4YW0yWEZZWGQxM1pLcVR4RlF0?=
 =?utf-8?B?QWUwL3pMUkxpbXdKSHB4UFNpZFZwZDVOUlQ1U3ZCMktQS1pTMFF1VUxKRmI3?=
 =?utf-8?B?OG0vY29qcGN0TFR3bXErSUhzZk8yMUwycXZnMGVITHFxeHBSY0RhQ1dDY1VM?=
 =?utf-8?B?UVhYNEtuS29JMFozcmMrV1VFS3NRcThubkNNVUN3TUtodFJDWW13ZTdiMUw0?=
 =?utf-8?B?ZnorWW5Pdyt5czdGVVJGWlVhdjRxRmpOSUZJc1E1MUZDb0ZzUHRFNWtYKzkz?=
 =?utf-8?B?bXpMbmVnY1FucEZTNm1UaDg3V0lGOHNyY2pCaWF3S1JtdjZxSEN6cEk4Mzhi?=
 =?utf-8?B?K2YyNXBvRnlnZktEMGRtRlhQaEtQVHpEbnZoTmcxTUhIVkRiay9BZUdBU3FD?=
 =?utf-8?B?Rk5jdHo0aW1qUGFjSTBxdWlEU1RwSGRqWnhZRlJhTVc5VnNQSmtvUnMwQjBM?=
 =?utf-8?B?WGpFc0hDRTcvczBLeFBONHFveVZRa1JQNmplWG5oWk41T0RncVFWSXFaaHVD?=
 =?utf-8?B?Q2lxTkJNNWdzK2Y1QmxSUzZ1SUFKU3k3YWNWaUgreVdFYXY5RGF2TDluUTRa?=
 =?utf-8?B?a05sZVhzUTgxYUFvME9EbUllSkZERTZ5TkFUa3dRV3VxcUtxMElHY0NLS0tM?=
 =?utf-8?B?ZzNQVWNCU25zL2NKdWYzbFF1RmxsdTdmNEFmNHpnVFlGRWJMNkw5UnVTUkli?=
 =?utf-8?B?citkeVBGU2pISTNoeVBGbk5nN0VrNzVOMmlwa1VFUmp3MGVLMllWMUtkTWcw?=
 =?utf-8?B?bFhuZ2ZyMVhZcjJnTUdMdzl2Y1BuQUJYRm5NNjM4b0NHY3VwKzZaVkNreTlU?=
 =?utf-8?B?N3M4YkRDZC9hQkJlZjNGV0JqN1UvWjJVaTgyem1ybWpIQ0laeTJ5WkJTQytU?=
 =?utf-8?B?TVBlNjNWNlNaRittWmZ1dHB4UmRPcVdnYXJOU1E3LzRhbFBkV2tZZjFITER3?=
 =?utf-8?B?aWV5dEhnenViOUZqUC85aVF5MWJiSW1LZlVHTEVna0dTWGdxajRvdXJlOFU1?=
 =?utf-8?B?djBNem01cklZMXB1L3VQakQ4NGk4MUg0YWFGLzZqZTBLZGRNVUgzUlpxSGdZ?=
 =?utf-8?B?NVRtWFNrZGxZUnlxa0l0UmUyZllhSkM3SythUzJzcFVtNGVuN0RLODB0MXYy?=
 =?utf-8?B?cjhrQ29QVHFacjdzQ3ZuSXlrSzRNWWlyWmJLU2MwMURQRDZtUlZSM2psQjV3?=
 =?utf-8?B?UGhMTU1CT2NueEp6WENaOEhxMUh0MkFpTkFYVjNYMFU5YnhFVnlJNlpmTmZz?=
 =?utf-8?B?bEZ1UnJlcmRMVkhvdlhacmIyWXI1WHo5d214M0VPNlhldklJS0Z2VnR6c3dC?=
 =?utf-8?B?Nkd6NFNrd3lMWlRicGpEZ2d0RkJIbFZzZEltMTRQREg2cGh4bGEwQXdHNVBV?=
 =?utf-8?B?QmNHRllJK1cwbVJmSTRNZFlISFd6clBWZEppOG1GUnpkY0RMZDNkMTFhUm5a?=
 =?utf-8?B?TXpkT2ZxZkljZ1IzcUtWTFF1VGNRdlFyU2hCcjNUY1dPZUd1eTFRK3NJZThV?=
 =?utf-8?B?dG9oOUlSYU9UcEk5T2dtTldjejY5S0hmREoxcWh5WmRrNmhTeVJtVXBnbk5v?=
 =?utf-8?B?a3JZaVd6WnU4YmlFN1hOeSs0QlVycEg4LzhCOVZvMXVMV3gwZFo4QkgzdGwx?=
 =?utf-8?B?a1hzTXk1anZheC8yeWVqeXNkMS9KSGo4NzUvWVlzaW55VlkzTFNmNVZKQ0o1?=
 =?utf-8?B?dzBJSUs2MmpiZkVWVXI5bnJycUs5OTlkVU1RTmY2ZWZjZTRXQnNaSHdvcUdN?=
 =?utf-8?B?YXlkM2xNR28vaWlkVEhZSGtHVVV3aU4vQ21xUVk3eUFUL1dQYnhCVDZCVXA1?=
 =?utf-8?B?ZDZkcUlpcWVqTkJIUmRDSlZVdUJNNXAzeEhXNFpicU1UUEF5b1FEU0txbGhq?=
 =?utf-8?Q?kX/w/0ptnsj3iMPw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 068af302-6124-40c9-860d-08de68a4aa3c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 13:02:37.4716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KW0V5ff1uqcgvDZ2L/w4dm0YnTqDDI1iFVWi2aWtgSg/++9bilU+Zilgg3p4Th5afEfOcXYJ7XR4RBJHt7p8Rycv28lOdFCA3x5HHV2A7aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9279
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



On 2/10/2026 11:59 AM, Satyanarayana K V P wrote:
> CCS save/restore batch buffers are attached during BO allocation and
> detached during BO teardown. The shrinker triggers xe_bo_move(), which is
> used for both allocation and deletion paths.
> 
> When BO allocation and shrinking occur concurrently, a circular locking
> dependency involving fs_reclaim and swap_guard can occur, leading to a
> deadlock such as:
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> ------------------------------------------------------
> 
>       CPU0                    CPU1
>       ----                    ----
>  lock(fs_reclaim);
>                               lock(&sa_manager->swap_guard);
>                               lock(fs_reclaim);
>  lock(&sa_manager->swap_guard);
> 
>  *** DEADLOCK ***
> =====================================================
> 
> To avoid this, the BB pointer and SA are allocated using xe_bb_alloc()
> before taking lock and SA is initialized using xe_bb_init() preventing
> reclaim from being invoked in this context.
> 
> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> ---
> V2 -> V3:
> - Created new functions xe_sa_bo_alloc(), xe_sa_bo_release() and
> xe_sa_bo_init(). (Thomas)
> - Created new functions xe_bb_alloc(), xe_bb_release and
> xe_bb_init(). (Thomas)
> - Updated guard() to scoped_guard() in xe_migrate_ccs_rw_copy(). (Thomas)
> 
> V1 -> V2:
> - Used drm_suballoc_alloc() and drm_suballoc_init() for BB allocation
> (Thomas).
> ---
>  drivers/gpu/drm/xe/xe_bb.c      | 49 +++++++++++------
>  drivers/gpu/drm/xe/xe_bb.h      |  7 ++-
>  drivers/gpu/drm/xe/xe_migrate.c | 96 ++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_sa.c      | 40 ++++++++++++++
>  drivers/gpu/drm/xe/xe_sa.h      |  3 ++
>  5 files changed, 135 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 8b678297aaa2..631ae564e719 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -59,16 +59,43 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	return ERR_PTR(err);
>  }
>  
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)

shouldn't we add kernel-doc for all new/updated public functions?

> +struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
>  {
>  	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
>  	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_sa_manager *bb_pool;
>  	int err;
>  
>  	if (!bb)
>  		return ERR_PTR(-ENOMEM);
> +
> +	bb->bo = xe_sa_bo_alloc(GFP_KERNEL);
> +	if (IS_ERR(bb->bo)) {
> +		drm_err(&xe->drm, "Sub-allocator memory allocation failed with %ld\n",

nit: there is xe_err(xe, ...)

nit: we try to print errors using %pe, which here is even more appropriate

nit: maybe "Failed to allocate SA object for BO (%pe)\n" ?

nit: or maybe any error message should be in xe_sa_bo_alloc()

> +			PTR_ERR(bb->bo));
> +		err = PTR_ERR(bb->bo);
> +		goto err;
> +	}
> +
> +	return bb;
> +
> +err:
> +	kfree(bb);
> +	return ERR_PTR(err);
> +}
> +

kernel-doc

> +void xe_bb_release(struct xe_bb *bb)
> +{
> +	if (bb->bo)

do we need this?
in xe_bb_alloc() we guarantee that bb will either have valid .bo or no bb at all

> +		xe_sa_bo_release(bb->bo);
> +
> +	kfree(bb);
> +}
> +

kernel-doc

> +int xe_bb_init(struct xe_gt *gt, struct xe_bb *bb,

as this is xe_bb function, it should take xe_bb as first param

> +	       struct xe_sa_manager *bb_pool, u32 dwords)
> +{
> +	int err;
> +
>  	/*
>  	 * We need to allocate space for the requested number of dwords &
>  	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
> @@ -76,22 +103,14 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>  	 * is not over written when the last chunk of SA is allocated for BB.
>  	 * So, this extra DW acts as a guard here.
>  	 */
> -
> -	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> -	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> -
> -	if (IS_ERR(bb->bo)) {
> -		err = PTR_ERR(bb->bo);
> -		goto err;
> -	}
> +	err = xe_sa_bo_init(bb_pool, bb->bo, 4 * (dwords + 1));
> +	if (err)
> +		return err;
>  
>  	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
>  	bb->len = 0;
>  
> -	return bb;
> -err:
> -	kfree(bb);
> -	return ERR_PTR(err);
> +	return 0;
>  }
>  
>  static struct xe_sched_job *
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index 2a8adc9a6dee..3eb80925bfd1 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -13,11 +13,14 @@ struct dma_fence;
>  struct xe_gt;
>  struct xe_exec_queue;
>  struct xe_sched_job;
> +struct xe_sa_manager;

wrong order

>  enum xe_sriov_vf_ccs_rw_ctxs;
>  
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm);
> -struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> -			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> +struct xe_bb *xe_bb_alloc(struct xe_gt *gt);
> +void xe_bb_release(struct xe_bb *bb);
> +int xe_bb_init(struct xe_gt *gt, struct xe_bb *bb,
> +	       struct xe_sa_manager *bb_pool, u32 dwords);
>  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  				      struct xe_bb *bb);
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 078a9bc2821d..c858eaa70e3e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1148,65 +1148,75 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size -= src_L0;
>  	}
>  
> -	bb_pool = ctx->mem.ccs_bb_pool;
> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> -	xe_sa_bo_swap_shadow(bb_pool);
> -
> -	bb = xe_bb_ccs_new(gt, batch_size, read_write);
> +	bb = xe_bb_alloc(gt);
>  	if (IS_ERR(bb)) {
> -		drm_err(&xe->drm, "BB allocation failed.\n");
>  		err = PTR_ERR(bb);
>  		return err;

nit: this could be

		return PTR_ERR(bb);

>  	}
>  
> -	batch_size_allocated = batch_size;
> -	size = xe_bo_size(src_bo);
> -	batch_size = 0;
> +	bb_pool = ctx->mem.ccs_bb_pool;
> +	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
> +		xe_sa_bo_swap_shadow(bb_pool);
> +
> +		err = xe_bb_init(gt, bb, bb_pool, batch_size);
> +		if (err) {
> +			drm_err(&xe->drm, "BB allocation failed.\n");

nit: there is xe_err() but since there is a gt maybe it should be xe_gt_err() ?

nit: or maybe move that message to xe_bb_init() ?

> +			xe_bb_release(bb);
> +			return err;
> +		}
>  
> -	/*
> -	 * Emit PTE and copy commands here.
> -	 * The CCS copy command can only support limited size. If the size to be
> -	 * copied is more than the limit, divide copy into chunks. So, calculate
> -	 * sizes here again before copy command is emitted.
> -	 */
> -	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> -		u32 flush_flags = 0;
> -		u64 ccs_ofs, ccs_size;
> -		u32 ccs_pt;
> +		batch_size_allocated = batch_size;
> +		size = xe_bo_size(src_bo);
> +		batch_size = 0;
>  
> -		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +		/*
> +		 * Emit PTE and copy commands here.
> +		 * The CCS copy command can only support limited size. If the size to be
> +		 * copied is more than the limit, divide copy into chunks. So, calculate
> +		 * sizes here again before copy command is emitted.
> +		 */
>  
> -		src_L0 = xe_migrate_res_sizes(m, &src_it);
> +		while (size) {
> +			batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +			u32 flush_flags = 0;
> +			u64 ccs_ofs, ccs_size;
> +			u32 ccs_pt;
>  
> -		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> -					      &src_L0_ofs, &src_L0_pt, 0, 0,
> -					      avail_pts);
> +			u32 avail_pts = max_mem_transfer_per_pass(xe) /
> +					LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>  
> -		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> -		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> -					      &ccs_pt, 0, avail_pts, avail_pts);
> -		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> -		batch_size += EMIT_COPY_CCS_DW;
> +			src_L0 = xe_migrate_res_sizes(m, &src_it);
> +
> +			batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> +						      &src_L0_ofs, &src_L0_pt, 0, 0,
> +						      avail_pts);
> +
> +			ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> +						      &ccs_pt, 0, avail_pts, avail_pts);
> +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +			batch_size += EMIT_COPY_CCS_DW;
>  
> -		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> +			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
>  
> -		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> -		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> -						  src_L0_ofs, dst_is_pltt,
> -						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> +							  src_L0_ofs, dst_is_pltt,
> +							  src_L0, ccs_ofs, true);
> +			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>  
> -		size -= src_L0;
> -	}
> +			size -= src_L0;
> +		}
>  
> -	xe_assert(xe, (batch_size_allocated == bb->len));
> -	src_bo->bb_ccs[read_write] = bb;
> +		xe_assert(xe, (batch_size_allocated == bb->len));
> +		src_bo->bb_ccs[read_write] = bb;
> +
> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +		xe_sa_bo_sync_shadow(bb->bo);
> +	}
>  
> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> -	xe_sa_bo_sync_shadow(bb->bo);
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index b738102575d4..59d0187b3e82 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -175,6 +175,46 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
>  	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
>  }
>  
> +/**
> + * xe_sa_bo_alloc - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended usage is
> + * allocate memory for suballoc object outside of a reclaim tainted context
> + * and then be initialized at a later time in a reclaim tainted context.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
> + */
> +

extra \n

> +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp)
> +{
> +	return drm_suballoc_alloc(gfp);
> +}
> +
> +/**
> + * xe_sa_bo_release - Release memory for suballocation.

nit: add () to function name

    * xe_sa_bo_release() - ...


> + * @sa: The struct drm_suballoc.
> + */
> +void xe_sa_bo_release(struct drm_suballoc *sa)
> +{
> +	drm_suballoc_release(sa);
> +}
> +
> +/**
> + * xe_sa_bo_init - Initialize a suballocation.

ditto

> + * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
> + * @size: number of bytes we want to suballocate.
> + *
> + * Try to make a suballocation on a pre-allocated suballoc object of size @size.
> + *
> + * Return: zero on success, errno on failure.
> + */
> +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, u32 size)

why size is u32 ? drm_suballoc_init() takes size_t

> +{
> +	return drm_suballoc_init(&sa_manager->base, sa, size, true, 0);
> +}
> +
>  /**
>   * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
>   * @sa_bo: the &drm_suballoc to flush
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 05e9a4e00e78..19d4b698a7d7 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -38,6 +38,9 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
>  	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
>  }
>  
> +struct drm_suballoc *xe_sa_bo_alloc(gfp_t gfp);
> +void xe_sa_bo_release(struct drm_suballoc *sa);
> +int xe_sa_bo_init(struct xe_sa_manager *sa_manager, struct drm_suballoc *sa, u32 size);
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);

