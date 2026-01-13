Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88AED30CC1
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 21:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8981710E382;
	Tue, 13 Jan 2026 21:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvVpC+Wc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C682C10E382
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768339486; x=1799875486;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=nh0aWT0VRAWGjRoamfA0E9vXjqqDm8dHW7W7wI1kTt8=;
 b=WvVpC+WcHeoXz9zGMlW6/a6sZhSqpevaW9iy+SXacNukzMaW6Pynb0Bu
 71szkmSxcqVlYSt5buprbwAGxPJmrG/T/bSl3EeQl1VKumVIbgYxdrw/L
 fJYIHBh1umubsHMwe9+J6m8Kw1GzkWVND5M+U076GNMDWeTSXsNd2oA9S
 BR2kqP5lJC+vRu7SpA0ZiH0El1l4z7rB/CThnkNtghBdKuyDv0RX/HgOU
 TN9k1S/FmIHqloB8GfHvAxlvvg1GcEGTWoXcchYA+1FaqvOytdKXdDbEc
 PJ9KMu+NXbDM+dAyoXV1HmA692zBFcVMTJ3jrvAcdWk9rpByFov7iqfQ/ Q==;
X-CSE-ConnectionGUID: iRRhDoqKQUK79KbaXQllVQ==
X-CSE-MsgGUID: 092NlTSZQSOFqJm7/ZV3xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95109184"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="95109184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 13:24:45 -0800
X-CSE-ConnectionGUID: CakyZ5IwRBqhXyJFXY0tkQ==
X-CSE-MsgGUID: Sbp3V4A7Qm6wmg5wmwkpLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="235214204"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 13:24:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 13:24:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 13:24:44 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 13:24:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+sL0U1UDWneqOo+bzMVwPkoM1oi2P8kjIrMkIwHFBOZFY1oLrs7AAeJNNHZDruszWxvbkqLXI4bqqysRnS5WhVEzCDdUp55K/pn7frkcE8sO4taTMsPXotMiK0jmUfzA4TdOKGvx7M8PMwcyMmk/JnVeoLZPBlHn7HJeo9d25jxapoAAWwYA6E6i6nAEJdWA0qE35DWBRAFuL7o5+f6d846yBKXqu/9XrqZBo5O0HvgBqdQSmdh4ZAHzUOzPkUiQ21eQ2o6UtdSJ9zveGbwb6iJcDObpHl04zXjtb/k95YT53XWibmd5D39TJ7VPqTuzKtocew9HJxpwnLyLya+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh0aWT0VRAWGjRoamfA0E9vXjqqDm8dHW7W7wI1kTt8=;
 b=q7sbvxh7fI5okDZeRsQelLqQRGt059Ej3yOgMOjyGr2Ww9GmIFu5412WJMzBY6OL2RjSeqtFasb+z5AOKJPln72GyTHU9iWysWMD/WJc4Dd/XrJRPTHRkLqviiV3uQpLG9LbCZokXN/+NOeLTucibZ/3gy71CXH5zJv+tJ3A+w9KCLu3hH9s7ekr0EhuY9rg6dinru7syUuORorudKiPpB8aTpUAZgpUZcanniUB++D+qI5qNmyYcasX/haGGuBaINf1b805CKLSH809X2ywoym+Ay+TcOUu2YvaXkK194C8bf6mtGh6Z0RQuad6h2SI4I2k+V7XAycwLTaurA+S3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB7383.namprd11.prod.outlook.com (2603:10b6:8:133::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.4; Tue, 13 Jan 2026 21:24:42 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.005; Tue, 13 Jan 2026
 21:24:42 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v4 03/12] drm/xe: Add has_ctx_tlb_inval to device info
Thread-Topic: [PATCH v4 03/12] drm/xe: Add has_ctx_tlb_inval to device info
Thread-Index: AQHchDe02h9eSS39hEmEnQ2LExSXQLVQnZ4A
Date: Tue, 13 Jan 2026 21:24:41 +0000
Message-ID: <436999cdee8094c6c298337ac1a79f4e9220cfc0.camel@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
 <20260113025232.3504648-4-matthew.brost@intel.com>
In-Reply-To: <20260113025232.3504648-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB7383:EE_
x-ms-office365-filtering-correlation-id: 3bd0e4ba-4ad3-43de-f038-08de52ea2a62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dmFBbjY3cEZJSDQ4T0tOeCs2WmxISnVZZUxCbEd0bmNJTHYvZHVpbW1CeTBo?=
 =?utf-8?B?ZzEvdVVmTW9adHdmd1QvTDhIbTcrWEkvTy9iNnc2L3llcW1iNHBVQ0xlNDdp?=
 =?utf-8?B?NUs0QWxlMSs5T0lKNmlJTEs4NFZRS0ZGVDRJcWZ4djhNeFp4NEY0NXlUSmdB?=
 =?utf-8?B?TWd3dEFoelJiRHlPTm54bkV4dXJ0QWxYQ05qNzdVY05Xdm5hM0lRUHNrZ0l6?=
 =?utf-8?B?RmJqRDZybDRmbmFKZ1U0ZHR2MWxpWTdpZEhoY2lmQlpoSFFGaytvQyt6Z3VJ?=
 =?utf-8?B?aGMyaGdHVU9uR0l6Rm5zM2NOL0VyL2Z3MFdRM2pCdzByTEtIQmtxYTYwVTY0?=
 =?utf-8?B?Q3IxNERsV0F3Um1VbDAya1A4Y1Y2dFAvNk95TXJaNGo4NTBUK0xhMkpqZ0tX?=
 =?utf-8?B?ZDFSYU1ZT2ZYNFl6czhuUG0zMGJwWFZlcE52THJyUldvK3NVUnY1eVgwZi9v?=
 =?utf-8?B?TFFIUjBRcjMxOGV4NmIybEVNOTVlQVVwazkwemRhaTV2aklXbkgxRVJUd0JT?=
 =?utf-8?B?SmlGcFd3RnNFSHV2OWhZbjNnQjlCUkRqN1hkOEVzUzBzZXg0NGVGUFdjL09D?=
 =?utf-8?B?bFhyK3BpYWN6REdsTEdjV0Jlbm1aQXVXVVE3YXY4b1Jpbk10NUhiRGlJeHlG?=
 =?utf-8?B?bEtvVTlmUFNHY3hUQmsySWczcEpTaHp2MGtuYVJwTzRJWkp5NEMwSExpR3Bu?=
 =?utf-8?B?RWhaUEhyWlJseXZqNXdPSVBkZ3FvdmQ3YWpidXR2MGxxYjRqaS9FOTNUSUpJ?=
 =?utf-8?B?VnVWRmMzWkpsM0VlMFlvRVlxWUhGZ0ZLSG8zOWdPOWJiREs1aG10U0Y3Yjli?=
 =?utf-8?B?NER1cjhXcHh3U2NJOEs3RUdwNy9YSW15eEdHSnNBNXVLODZMQVd1YWpYSWVj?=
 =?utf-8?B?ZExRWWNmdC9jTmdkWFNGRHlvMGx2VFB4NlEyTTFwM1dXLzNyWDIyaHkrd3Nt?=
 =?utf-8?B?M0xxSWxIOEM5Um1GeFBIMTdVVVZBb1RSc3Zkbm1wRFBFWHY0bXdpa3ZqY2Z4?=
 =?utf-8?B?QlVZdTFZK0ZXUVVkakdzc2dPQklTTEhmM2NTVy9aSFhoQ21talBwMysyR3JG?=
 =?utf-8?B?YWxHaG13OStRQ2o1eGs4aFhZTGZoTGJSUzA4R21FWHFPKzlMdCtZTWxGZGhV?=
 =?utf-8?B?N2RiT25lQkk3L21lVUFHWDhkcE5Nc3paM0VEUVJlWGlHam9yNWF6U1lYRW16?=
 =?utf-8?B?eFJCaVlObXpTQXVBOEFHeEVCcmZ3b1dlNktQckFBT1pOUEJaLzk1dXlGOXEr?=
 =?utf-8?B?alJ3YVdUZTJ2dkNpU0ZycUhSbFlDREFneGFPMEtnNVBLUUJGMzJ4RkdHYWQw?=
 =?utf-8?B?cGZPaTZQTFAxRHllQjNnRHc2U3lhQWI2K0FXOW81V1Y1RUd4TnhKQlA1R1RB?=
 =?utf-8?B?aUM4RW5EQTVCUHJOQUZZeE9HQkZRaEJOMXorTUpzZnhyUlFqS2w2d1Bha3py?=
 =?utf-8?B?YlB4ZTZicVdqRTFWT0E2UVk0UEdPMHpsNnd4NGdEMDg3QWpPY295K0dTdXlI?=
 =?utf-8?B?bGpQcWFGdU51Q0UzOHdqSW5MRGNDWlBqRjBCZTROeGd0K0xsM3BUWUFkbXFQ?=
 =?utf-8?B?ZEswbmdJZEI2NTgySjQrNmpiZTQ1TFpHc1laNlBnZHBrbWFXcVVSMmUyUUFN?=
 =?utf-8?B?R1cxU0NReVVjdEJSa2doVlQ4bG5wMXhMd3RldzhsOEJ4N0w0TGpsMFlRckl6?=
 =?utf-8?B?ZzNLSUNkeWQvcTZ2R0NsKzZwMWEzTjRVSlJCUnpsSnhmQ2NiNk1CS2FnVGd1?=
 =?utf-8?B?UUhDRmJrMzlJSVpSK001STQwK29rT1dla0xpSmpZRldaQlhiUjJIazB2a0pX?=
 =?utf-8?B?MVBOQXVFYW5iaS8renQ0NnpyMGYxdzFLampEZzRFWEJ6ZzQyaWVxWEdQV2hp?=
 =?utf-8?B?dDNZTGQrV2oxbXpUTkFqeDl1VFFwQ1YxNEdkTGdVaFliTUwxQ0dERWNyYTZY?=
 =?utf-8?B?bTNyMHlreGwraWlPV2RkclRJWWhJUkQ1dFhrdklJaXlKUzJuS2I4N0NQTnZp?=
 =?utf-8?B?bG1wRkEzMVN3MFhZK09iM1BtbzhhVm13YmRMb09rTUxwK3RiMzhsQ29iSFh6?=
 =?utf-8?Q?dYYNlo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnNzbzVqTEw4UnNvdkpIbzI3ZzRqS0pwZ3gwMVBoQ1JCTTYrQWFzUjZUZmM5?=
 =?utf-8?B?eDlDRllNN3U0ZU9RNGN3ZEduZSs4R0k5OTJ3UVNSTEZNK3VYVTFRQ24xKzM2?=
 =?utf-8?B?SndxajNHMjNaV2JuM1g4MXpBaDNRZ2JvK29jQWpOVnV1YjhCWGtRSXZZS29y?=
 =?utf-8?B?UjBuL0plT0NnZUdwYkJSVU1pNkI4cVFFTnRRVW5UdXhOUEtiNDN4dzRPYk1E?=
 =?utf-8?B?eTlneDdPdk84a04wa1I2UWl5cFNpdTBxVHlGSkhpbm54YVZubXRydU13SzZ0?=
 =?utf-8?B?Z1BtRUtuL09rSXp5TUNvOU13ZWN1UE8rZVI5eDdLMVJVWERxUHFYcEdVSVB3?=
 =?utf-8?B?SWpJV1FmS0V5NVg5bFJ3ME91TXVVUHFSRXJ3N1RUSXNVN0hsZzVsWDZHcEhm?=
 =?utf-8?B?am9ZOHZoRmg1OVdQcnNMd052WDZ1bTE3QnpCakNrVERnb01sN3QzRU1MS2E4?=
 =?utf-8?B?SUxiMEdYOWhKbVhwTkt5TUozQnpTSkdQd0pmOTFuMzhYMG5JNjZkbUlkb0ZG?=
 =?utf-8?B?OTdkSm9YMndZWnV3RVhEQmhZbXVDWGdVRmtLOTJNUWdmZVR0NnkvcThZTkRU?=
 =?utf-8?B?b1BHakxBaHZyVysrcWMyTTVFUXp2SFNHSld3M25WbXprYituUnJDejVaWlVT?=
 =?utf-8?B?TnkraGI2c1EyTCtVLzJvQXc2Tk9IeUxXektHQkFCWmRNazQzOUlxL3RvaHls?=
 =?utf-8?B?Nk1jK2EwLzd2RHUwUW15U1psZUdSdTJyeDg2d0xGR0MyRHlPcnEyVFFobkkz?=
 =?utf-8?B?VVdnYUVmOTRIcnl3WEJQSDVyeFBSamtUeXQ0c204SmsrYTU0cHNwQWlWb0Zy?=
 =?utf-8?B?cWdvbytIOWpqMVM4MDQrWnZCNFZLN1V4cmo1QVQ2VThQaXBHYnd3YUJHN01k?=
 =?utf-8?B?VndwMDJPZXFwUWw5VEVzczBzSW56QUREZWFjRGJvbWJSbTVIY1d6STJQZHBZ?=
 =?utf-8?B?U0VWN1RhbEFMOG5xMW4rTGZzeW1WQlhmbEVoMjlTTXl4UWh0TlEzR0FJN3RY?=
 =?utf-8?B?ajM1VG9PN282clMzY2NkMy9MaGQ5YjVwdElnTUtWZnMwM2UwM1dPV052OEcr?=
 =?utf-8?B?QThrSkZzT0t0VE02WWZzajl4dnJsMGdWUmNKQmtaMndxVmRyRFllbktKQnZJ?=
 =?utf-8?B?VDhJT2s3QXFZVVdya3NQMHR4SFZyZzVFV00xUDBzV0Z1TkxFclZpYUNXek9h?=
 =?utf-8?B?SFFleldEY1N3N3ZQUXhxeDQyQkRoczdJem9ONDdLUzBpK2xpWVlGWDZJQkpZ?=
 =?utf-8?B?alBJUGtEcWZiZHpaN2U2QnZMNloxLzlKYUtmTml1VWJtODQrUFgvWHpRSTNO?=
 =?utf-8?B?RmJ4V01MaWhhb21nRXhTU1lJOWUyMm1ySW14cjhIWnNwTXkxN1A3Ym5Ic25w?=
 =?utf-8?B?YUJ5ZTB0ME9ZL0ZTTUdobjlVemR6ZDNlak94VXU3K2I2QnV0OFRFSUlXQXd4?=
 =?utf-8?B?MjA4N2NrcE5CSXBBWmJKRlJMSFRYdWNzTWsrOG1LTWc0QnpyN2ExNTd3RERy?=
 =?utf-8?B?WmptMnFhRWhPd0NZNUFNWnAwOWs0ZWhUMUxML3lEbVkybzhMdmQxUjNaS0lP?=
 =?utf-8?B?S0twVTlLNEF5WmpveEJHSzhpTjM4S3ZvWjlRcXhITjY4Y3NoNFdvSVFBL3lk?=
 =?utf-8?B?cldoVFlmWjJNdHhBM2xyMnIvSUVSbldlVmlyMUsvdWl3ZFgrQVg1VDRFS2k1?=
 =?utf-8?B?dGl5ZWU2aHlJdnVUaElkY0cwUWczSDg2RDFiVFRoTFM2K1JTalRvSnRlNTl2?=
 =?utf-8?B?M0psR2ZxamlLbnk0SkRNek5BYjNPK01SWHJ1Sis3MEZzdVNwWXR1dW93cmgr?=
 =?utf-8?B?WHIxRVhKc0d5NktwdytIbmhkaEdXVGREb2xSK2VVK3JqVlZwUWFvMVFpbmFB?=
 =?utf-8?B?UGw1OHdpMUlibjlYK0wrN29QZlBVMmhDd2xNbG1xTUxlL0oyYnR1R1VIVTZl?=
 =?utf-8?B?eFI0d1JtaGkvbXQ1L3kvMkdNZW1vbStwWDdZTVFlTy9qVDNiZ2tFQXdBSnJu?=
 =?utf-8?B?Z1FqWTR5WFdicStpdVMzSklyTUkzT2dSWVVZeWxGOStVS2tmeFVPN2EzOHUz?=
 =?utf-8?B?R044NVVOT1Q2dDh1OFpVd3k0MVVZWmR1bGxsOG1qeHN0QWxTU1VyekUzdWdI?=
 =?utf-8?B?Q1h3QUM1RG9NMnlra1hOTld5dmxKZ1hDSVd3Y25iTVNjY2dsVGhDQ1dtTGhn?=
 =?utf-8?B?Z1Z2SkhrZjQ1WmEyKzcwMEtyT2N2b251NmNnMXBMbXNlOTZvajJQalVDN3Zl?=
 =?utf-8?B?Z1RrZU9PMkIzYXIzQkxNa3RXNVZOakpBbnI3UTZ6OVdtenhkZjQ0Mit1TURy?=
 =?utf-8?B?OWt6UkRoU1V3N3E2Nmh1cmtnaENaSmcra3NIdXoyMkp3WWxac2gyeGtlbmxF?=
 =?utf-8?Q?y4CuyDZhJAoTsWsY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8CA3A247896EE42BA5FB20002B3B064@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd0e4ba-4ad3-43de-f038-08de52ea2a62
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 21:24:41.9083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YtITQm8Efdlzrkix3EEMyHO0ouu87v3ZkokkLPBBEwtKK6nRuzj6a3Lr/NfJ5pSZB0hyXt52AMLYI25gOP4oRZzBKjJ0+xeKzzbSay0cb3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7383
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

T24gTW9uLCAyMDI2LTAxLTEyIGF0IDE4OjUyIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEFkZCBoYXNfY3R4X3RsYl9pbnZhbCB0byBkZXZpY2UgaW5mbyBpbmRpY2F0aW5nIGEgZGV2aWNl
IGhhcyBjb250ZXh0Cj4gYmFzZCBUTEIgaW52YWxpZGF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFN0
dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+IC0tLQo+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHwgMiArKwo+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BjaS5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfcGNpX3R5cGVzLmjCoMKgwqAgfCAxICsKPiDCoDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vf
dHlwZXMuaAo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gaW5kZXgg
NGRhYjMwNTdmNThkLi41N2NiNTUzMzY3OWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZV90eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rldmlj
ZV90eXBlcy5oCj4gQEAgLTM1MSw2ICszNTEsOCBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IGhhc19wcmVfcHJvZF93YToxOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEBpbmZvLmhhc19weHA6IERldmljZSBoYXMg
UFhQIHN1cHBvcnQgKi8KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IGhhc19w
eHA6MTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEBpbmZvLmhhc19jdHhf
dGxiX2ludmFsOiBIYXMgY29udGV4dCBiYXNlZCBUTEIKPiBpbnZhbGlkYXRpb25zICovCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IGhhc19jdHhfdGxiX2ludmFsOjE7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQGluZm8uaGFzX3JhbmdlX3RsYl9pbnZh
bDogSGFzIHJhbmdlIGJhc2VkIFRMQgo+IGludmFsaWRhdGlvbnMgKi8KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHU4IGhhc19yYW5nZV90bGJfaW52YWw6MTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAaW5mby5oYXNfc29jX3JlbWFwcGVyX3N5c2N0cmw6
IEhhcyBTb0MgcmVtYXBwZXIKPiBzeXN0ZW0gY29udHJvbGxlciAqLwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2ku
Ywo+IGluZGV4IDkxZTA1NTNhODE2My4uNmVhMTE5OWY3MDNlIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wY2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2ku
Ywo+IEBAIC04ODksNiArODg5LDcgQEAgc3RhdGljIGludCB4ZV9pbmZvX2luaXQoc3RydWN0IHhl
X2RldmljZSAqeGUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5o
YXNfZGV2aWNlX2F0b21pY3Nfb25fc21lbSA9IDE7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgeGUt
PmluZm8uaGFzX3JhbmdlX3RsYl9pbnZhbCA9IGdyYXBoaWNzX2Rlc2MtCj4gPmhhc19yYW5nZV90
bGJfaW52YWw7Cj4gK8KgwqDCoMKgwqDCoMKgeGUtPmluZm8uaGFzX2N0eF90bGJfaW52YWwgPSBn
cmFwaGljc19kZXNjLQo+ID5oYXNfY3R4X3RsYl9pbnZhbDsKPiDCoMKgwqDCoMKgwqDCoMKgeGUt
PmluZm8uaGFzX3VzbSA9IGdyYXBoaWNzX2Rlc2MtPmhhc191c207Cj4gwqDCoMKgwqDCoMKgwqDC
oHhlLT5pbmZvLmhhc182NGJpdF90aW1lc3RhbXAgPSBncmFwaGljc19kZXNjLQo+ID5oYXNfNjRi
aXRfdGltZXN0YW1wOwo+IMKgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
Y2lfdHlwZXMuaAo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oCj4gaW5kZXgg
NWYyMGY1NjU3MWQxLi4wMDBiNTRjYmNkMGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BjaV90eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBl
cy5oCj4gQEAgLTcxLDYgKzcxLDcgQEAgc3RydWN0IHhlX2dyYXBoaWNzX2Rlc2Mgewo+IMKgwqDC
oMKgwqDCoMKgwqB1OCBoYXNfYXRvbWljX2VuYWJsZV9wdGVfYml0OjE7Cj4gwqDCoMKgwqDCoMKg
wqDCoHU4IGhhc19pbmRpcmVjdF9yaW5nX3N0YXRlOjE7Cj4gwqDCoMKgwqDCoMKgwqDCoHU4IGhh
c19yYW5nZV90bGJfaW52YWw6MTsKPiArwqDCoMKgwqDCoMKgwqB1OCBoYXNfY3R4X3RsYl9pbnZh
bDoxOwo+IMKgwqDCoMKgwqDCoMKgwqB1OCBoYXNfdXNtOjE7Cj4gwqDCoMKgwqDCoMKgwqDCoHU4
IGhhc182NGJpdF90aW1lc3RhbXA6MTsKPiDCoH07Cgo=
