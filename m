Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BD5C87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 18:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3802910E13E;
	Thu,  7 Aug 2025 18:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZyljMB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FD510E13E
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 18:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754591362; x=1786127362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7418gwgBAoqRxci7wKzJm1xY3BlVxkpErPdNWvP0Dmc=;
 b=eZyljMB92jbv77ytfwOrhSzJQF2pC+A5ohqPNkyRFEUY6JOaL7ZyONkE
 76pG1fVas1srkHu7gIX6UQ4aw8HdoGs/PM+Yi0usSuiT2bDEcZNlPZ5rE
 kN5OI1LBSSYiYqG/HEGXb4iLd4qn5TcV66Ssep053xlLVIwZ6ncjsT4wS
 fDfht9d+vvQR6rl5t0DBiCv/eEjeaqYvWOGqF1gbtBndAYTpR1H8QvAwe
 yGBqatVpjGNA8t3SSQxenlyHIUTL5F19zl2ZrWHiidUDz5WGSPKjEHVB7
 PcQZ2j1ex2YRVTqqjNKvNmSuidIhMD84tErfEibaCrQK2/isUkqiRIx/T w==;
X-CSE-ConnectionGUID: vA0LJgZASHai2/5EFikGnQ==
X-CSE-MsgGUID: R6msyS+yQsCv7vIyTwkBxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57078432"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="57078432"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:29:22 -0700
X-CSE-ConnectionGUID: R6o4IjRPSxuOOhgVA3YEpA==
X-CSE-MsgGUID: WDH93+SRQkerKbj/05oiIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="169259143"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:29:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 11:29:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 11:29:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.61)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 11:29:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHN1CV4PO9aoHjrb4N5hjxgjzENmS2gu7zxYkvmE/+vbLEqh+85ZMfu7Vy5SHNomGBqlbLokdJi+0DwlQgfjampuhMOoaNRgqkr4qcq1/J6ILGC24exvQVNFw/tHLot81fhnH9GYqAqqrjdtajYfaHYPD7/ybljWFTTVAFeWTgxI6I9uYzdkzOAe1WsZRt0PaQXxDrrIpkGPUxxP5i2bJPUGv3khFj+vBNHM01o0cecKYtJgRk66XXvbR1FMmsORnNq0F1t8AD4FHRELQU9Kyjgn3N0vzl0V2UkjwgyiTtlgUcINt4vw4s/IIS4fY41qOZYCHa0ENxLZ6BcxUrPwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7418gwgBAoqRxci7wKzJm1xY3BlVxkpErPdNWvP0Dmc=;
 b=YK1tdu66SIki2yQKYWo8apdPpswRYH0Kjm+IEvBHq+5BBxB8h2wCvnX+MIGkdD44b6CTTT9IOYibCRIAA0/3hv7jchcSHnLbZ4rh6+mpztyqmE6/BONZlLKIQKAq+mjbFeqeitsIvz9waDwoIsXFYeP271w1uvT/zUsDhDzmFGCR1v9Eqy1UJIJ8rivFd7u6bNQ1HwkABMsxhbIKRhc4hfMxdQipFwlIoNQbfnl1To6oKB7K4uKxS97TUpTFr5bvl0CV0EGbLqOvvL7lo1xvw/SiIvWzKGKLx/HPXzSn6JoavLBx23lCFftvyd++Fb25hg1WQ5VrRIVIsa8sSEuEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 18:29:18 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 18:29:18 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 03/11] drm/xe: Implement xe_pagefault_reset
Thread-Topic: [PATCH 03/11] drm/xe: Implement xe_pagefault_reset
Thread-Index: AQHcBpqXPZ5n8oG+e02fc1Svz38ylrRWQwsAgAAPyICAATJRAA==
Date: Thu, 7 Aug 2025 18:29:17 +0000
Message-ID: <c2723825e6d6877d40351d53768774e065d7f583.camel@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-4-matthew.brost@intel.com>
 <ab3197ac98e3a60065f846fb0bf996092f861e64.camel@intel.com>
 <aJPvhZikeKEbwOth@lstrano-desk.jf.intel.com>
In-Reply-To: <aJPvhZikeKEbwOth@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ0PR11MB5865:EE_
x-ms-office365-filtering-correlation-id: ebb504bd-4c32-4143-538b-08ddd5e051ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R0RtYU51c1U1Q2wwNVpWUm90UFQ2UzdtVFdnQTJSd2l1V0wyZ2d5OVp2d2Er?=
 =?utf-8?B?T2NNZ01hb1NXZ0NwbDdKSkdxWlcyV0c5dngza3cyalZzN295OWVvL3hPZVVF?=
 =?utf-8?B?d0xGemdJR0l2bGxxait6QTZFZ1EwUzArR0syZFVHclROL1ZsZS9nSjdrcFFw?=
 =?utf-8?B?WmVxeFQyait3eTBoRGZjQjFzMDBhbENBbCtGMmRmd0JOMk1PVHhNZlhlSTNn?=
 =?utf-8?B?R1FkbzByRWxRRGlINGFzWnMwOWM2enBqU3E1UTBnTkM2aVZVbStybVJ4L1l4?=
 =?utf-8?B?NmNoZnlXSlJOT3dSVlphd3dON3krT0FVQUMzQ3FycmlxeWhzTDk1c3Vab1pn?=
 =?utf-8?B?eDQ0T2FVU0xmanBZN2djOGorTWhFMThSOGpoYVdpU0liTGtnMHNSMHFHZXdB?=
 =?utf-8?B?c0psWU1sdWZzanUwWEduWHQ3M1NHT1ZuQ3lMRWVBNXdTamFVbnRneWpOS1NL?=
 =?utf-8?B?OTl2c2FQTkhSanR4VktNN2hEdXk3V09yZklUUk1YKzZ2Q01uaDIyTm1tdHAr?=
 =?utf-8?B?Z0RWV256blYwZG9tVXpiQTBiSytBUVI2cWVrR2tSWGlkT3ZSeWNrU1JvMEh5?=
 =?utf-8?B?TVRORTJlWmZJSnRaeXRJVGhCeW5hZmU1WlRxaHFSc3NRQ1hQQUkvNmpzdFl0?=
 =?utf-8?B?OVBZbXI3a09yeG9TRVJCUGZVWG9xWHMwK09DRm1ySitHSDhZNTdiZWZreXgr?=
 =?utf-8?B?QU5LYlg3THlySStuT1FpekkyRmVqTTF3N1pCY2RLR25FV290OTVPYWpJcit6?=
 =?utf-8?B?b0JmZ2U2U1hUOHdHWXd3RllBbGI5TEZVVmJnT3kwb0lIVUgwV3F2WlJaNC9w?=
 =?utf-8?B?c0NLL0o4YzFlcTltcjhRbWhURFgwRXRBUlVCU2VHcjZ0RFBYaGFSekM1a0xL?=
 =?utf-8?B?ZnhIY0VjbUJvTEJHR2Rod1AwUHVOUjJBK01kbGhsaGRuYUpjY2p4VUNVTTZT?=
 =?utf-8?B?VmtXSnRCMWZkQk14dkh3a2hLQXdOdzg5ZUFwZkY4YWdxbmpQUVRFQ05Kejd0?=
 =?utf-8?B?K2czNTNwYmxMR2hpVjVlcWNqNFdEaXJqTG5reGx6THU2eXJNR0NzT0VKM3gw?=
 =?utf-8?B?RTBSZEQxOWlHQmF1VmcvOVZ2TDdsclFnYitoY0xoNUdpc2ZteXJpQUh5d0NB?=
 =?utf-8?B?MzZRbHNHVGFxSEx1RGVDM0c1QU5vUXk0dW5idWwzVmo2aU5veFpIdmFOVHR3?=
 =?utf-8?B?eWd3WFMrV29UMSt0T095Y09wOFdKK0dERDM5NWtEZ24yeEY4MGhuNldRQktP?=
 =?utf-8?B?MFo1UHV0MGFYLzh0a3RPbWFoWTNUYU1nZHdWeTE0UVZEUWxCVCt6dkp2dDRh?=
 =?utf-8?B?YkdDcGR3eDRmZm15NnpHaW9lUmpnYUtWOVZ4SklySTZrVXo1ZjRaU2x4VnY3?=
 =?utf-8?B?WTBnWUNHRWlLd2FKSm1qa3NRWkxrL2xhNkJ4QkttNkIyT1pDMHB1dW5EbUlE?=
 =?utf-8?B?TkZzdDJzWXhRemRSWDlQWFIwS0FPTVlaNjFPblkwU2hyTFI4Z04zc0VaT2Fz?=
 =?utf-8?B?ZG1tSlhEalkxY1dJc2RjSzVsWnhQOWowdHlCcTB0K2ZQWWZ2YTEwWFg3YUh6?=
 =?utf-8?B?U09tVUh6SDgzVEp3RzBIeCtBKzNEWTk2WWU4ak1rM1gwaGU1R2ZqVlIyS29O?=
 =?utf-8?B?TUY5bWZCN1c5bHJNUXprYzNycVdmOTI0VjhlN25SN01Cdmw1ZEd1dENvRDAr?=
 =?utf-8?B?MzVGdnpOZEYxSXJHQm5lbmIxdHZna1VxenpXRUxqUTdKd2UwNnlGRTZoTml6?=
 =?utf-8?B?TWV3WHRuVWtpT0tBMlJpUFJwT1N5WXdUUFZHK3RNMWNHS3lvcFFHb0pJSmht?=
 =?utf-8?B?WS9rbHlvMlhZUllqdlBJdU5UaTN2eDAwME5EVEdrYU45Z0dwZHg0SUU3QnZu?=
 =?utf-8?B?eE0zNkpMNW8xS0d3bTNITWFPYmFLN1pYRWNBb1ZFZHZ1NVpCNThoVnRFWS9U?=
 =?utf-8?Q?bLX9gte7qsU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0pNWGE5N2VPelVFU0lDMjVNOW5acHZpV1M3SUUyUzFNdnNEczAxeU1yK1kr?=
 =?utf-8?B?dkNSQ1d3L3gzeXdtM1AxR0pNVmovVXppdnlIOGpxM0ZEcnJGYlpJS2JFd3Y1?=
 =?utf-8?B?RTBjU1N3bmIvaCt0SHJuRCt1NFA0bTU4NFBMQVVkZjZUTDJ5bFpldkttWW0v?=
 =?utf-8?B?WVZzN2c1elRjeGxLNTYvYVNLbjBTenBUcVowYTY2c1NHVXJNQVFveGV3bHdP?=
 =?utf-8?B?VmdFb1JsQk03Nys1QjA5T3FnT1BrcDN1dm1IM05WWXBZTnlZUGhIRmszbUh2?=
 =?utf-8?B?ZmlJSGVRb0FLa01sRGI1cyttaXZoUmlUcVR3blNMcE9ycytaZTE3aVNvdkVq?=
 =?utf-8?B?Y2RFZS9kWkpuOWhhTm12R1pZSUFrOTlnVjFGTEQrSzdidDRQZHJSSTZncWhl?=
 =?utf-8?B?bWcrVUhWNU5FSjdQUnhxTGhGSFNGSWoyNTJXcm42M1hyTHNZcmR6RkJvK0FR?=
 =?utf-8?B?YnlyUFQ0cFh6YXFnbmM3ZW9jcm1qRE9lc0J3U3ZnTHVXcWdYTGZ4UmhuZDlH?=
 =?utf-8?B?SlVSZ0FvcVh3SUNnVmRJN1d5cE9pWlZTdUZ6YVpKVldrU1VOZEkrVk9TUkpt?=
 =?utf-8?B?WXFCNTBsYU1HK0d5TTBxMHpXZVVZWjBPRmpEUTRPR0VzV3ZDb0NTVXVPSGlv?=
 =?utf-8?B?NWVOdkVab3ZJZ0pMdkM5Wit3Wk11NTJ3a1QvYW5xckEySWZTZUFHc1N2c3Fx?=
 =?utf-8?B?WlN2VEU4RmxlTVJxeEJHSEF3U0RtcGhwbllXeUF0YlpuMWVaRU0zRGN4NmpZ?=
 =?utf-8?B?VHBlbkE3bStqNlJpMUFmRDE4djNYQ3FJUkx3ckxINTJoY2RNWnhTSnZ2VW96?=
 =?utf-8?B?WkNtOG5oL2JUOTV4U09NR3NNa3ltMitXd3l1YnhTdjNNSmNYMTBDaWY0UE1R?=
 =?utf-8?B?Nk9Dak8zeUFlS0ZjRmtEVW1PaHdCai9iKzhHemRrSkVZc3N2dEhubkgwbTBE?=
 =?utf-8?B?T3pCeDczMWVlOWMzTkNnMUhyM3IySGxKSDBQSGdHOHp1N2djb1FuMkY1eGph?=
 =?utf-8?B?am5EVnBSOHV2bnpRMEhFYWVxa3AyOVRhc29OVyt5MHhralFTbUk0MHRsTnc0?=
 =?utf-8?B?dVpaN0ErbWsrdkQ3RHgvRzFJL0lwSEluTGNjV1dod3Y0N3BhdjY5UmpZUzFX?=
 =?utf-8?B?bG9XNGEydXNScGlsbTIxbk9mWm1pQ2tvSXBsdG9uTXl1azdBajJJbkVhaVRL?=
 =?utf-8?B?M3cxNVRHRkxnZlhIM3JVSnRPcE5WeHkzUmwzUkE5TGFnSGoyWjkrNmxKbDJM?=
 =?utf-8?B?bVpobVA1Y3Z4bUw0UmpwNFYzVkF6M1BUMVNRUzZwVktESWlERXJ5SG94Y2NB?=
 =?utf-8?B?WjM4QnpyZ0ttUUJVRjJDSHZOekUzV2lCQzNJZUhXMW1nYTBkMmJ6eHk3Q0hK?=
 =?utf-8?B?NWlEZmlkT3Ywd0l6eUVEUjdXVDZKclJXOGcvR0ZlR2JrN2ZXTExRUW5UQTgz?=
 =?utf-8?B?OThaVVdJZWtRTktPM1c4S0lmK2UwNERDNndoOGg3ZVFlRHhMaEZ6OThjT3Qz?=
 =?utf-8?B?dzlOd2FzODNNREhuYXRnKzlqOElpcVFhMnphYnlUV01vZnhudU0vWTdhQ0Jv?=
 =?utf-8?B?T1k1S2ZGRVJvTzBhcmU4TDFNVFFRVGhqN1hsTC9IUkx3ZG9FdWtyVXRUQzZu?=
 =?utf-8?B?YVJTbmdXU0M3QWpROU9kMFk0RkxrczR4aS9jdFZaMXo3VGNxaEpJOG8yWVlF?=
 =?utf-8?B?M1Y2a2xWcWQ0VHVvdkRwOHljbnRzS2trSW8xZStnQ2VBRUlkSXZrcjZRM1FV?=
 =?utf-8?B?WloyZS9kYmcyMllzK0V1U1habHBTc1NqMzFHSGM4eWFCb2p4Ly9wYmRSVEtN?=
 =?utf-8?B?Q05KNmpwNThrZDNaR2hLbTdobzV6S3dzWmR6cHN4VFVqVWRlSmlrd1NCcG10?=
 =?utf-8?B?U3ZzZDRIa1JNNkgvdjlKTmkrUnhKYzQ3aEI5L0RReWJhKzAxN0t4MnA5cDNz?=
 =?utf-8?B?Nm5LdlBWN3BZNnE5andrR2JyV2JhQlo0bU50UTAycWhuS3ZoUEh5NkgvNjht?=
 =?utf-8?B?MVFxRUlXaWpDcTEwYTRoYW14N2VNSHBHQks0ditaUkxjQ2x0akZrM0pVNlFI?=
 =?utf-8?B?ay9DcllESHE1VlVRcTV5STlFNXg5REN4UGY1OVpiLzBLTlNSWUVydFpzS2xN?=
 =?utf-8?B?NjRPY2ZIQllRVVhDUGpCcTJmaEJBcU5DQWJEWW5YaVNwT3BJSWZqbnhFUm1a?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90F50419B4D79849A7DCFF023B8EB84F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb504bd-4c32-4143-538b-08ddd5e051ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 18:29:18.0163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 63pHmsqaF+RGJDbbImB1i3Vh5cC9leT9s1Umwu8bDF6qfZ5G5SBc8Md7HexfJ2GSfYLIfS4b0hZBkUE5E0f83kTx4f8yVslD7mGSFZUIqJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
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

T24gV2VkLCAyMDI1LTA4LTA2IGF0IDE3OjEyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIEF1ZyAwNiwgMjAyNSBhdCAwNToxNjoyNlBNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI1LTA4LTA1IGF0IDIzOjIyIC0wNzAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gU3F1YXNoIGFueSBwZW5kaW5nIGZhdWx0cyBvbiB0aGUgR1Qg
YmVpbmcgcmVzZXQgYnkgc2V0dGluZyB0aGUgR1QNCj4gPiA+IGZpZWxkDQo+ID4gPiBpbiBzdHJ1
Y3QgeGVfcGFnZWZhdWx0IHRvIE5VTEwuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1h
dHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jwqDCoMKgwqDCoMKgwqAgfMKgIDIgKysNCj4gPiA+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jIHwgMjMgKysrKysrKysrKysrKysr
KysrKysrKy0NCj4gPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3QuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+ID4gaW5kZXgg
MzkwMzk0YmJhYWRjLi41YWEwM2Y4OWEwNjIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3QuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMN
Cj4gPiA+IEBAIC01MCw2ICs1MCw3IEBADQo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9tYXAuaCINCj4g
PiA+IMKgI2luY2x1ZGUgInhlX21pZ3JhdGUuaCINCj4gPiA+IMKgI2luY2x1ZGUgInhlX21taW8u
aCINCj4gPiA+ICsjaW5jbHVkZSAieGVfcGFnZWZhdWx0LmgiDQo+ID4gPiDCoCNpbmNsdWRlICJ4
ZV9wYXQuaCINCj4gPiA+IMKgI2luY2x1ZGUgInhlX3BtLmgiDQo+ID4gPiDCoCNpbmNsdWRlICJ4
ZV9tb2NzLmgiDQo+ID4gPiBAQCAtODQ2LDYgKzg0Nyw3IEBAIHN0YXRpYyBpbnQgZ3RfcmVzZXQo
c3RydWN0IHhlX2d0ICpndCkNCj4gPiA+IMKgDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeGVfdWNf
Z3VjcmNfZGlzYWJsZSgmZ3QtPnVjKTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB4ZV91Y19zdG9w
X3ByZXBhcmUoJmd0LT51Yyk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqB4ZV9wYWdlZmF1bHRfcmVz
ZXQoZ3RfdG9feGUoZ3QpLCBndCk7DQo+ID4gDQo+ID4gQ2FuIHdlIGp1c3QgcGFzcyB0aGUgR1Qg
aW4gaGVyZSBhbmQgdGhlbiBleHRyYXBvbGF0ZSB4ZSBmcm9tIHRoZXJlPw0KPiA+IEkNCj4gPiBy
ZWFsaXplIHlvdSdyZSB0aGlua2luZyBvZiBkcm9wcGluZyB0aGUgR1QgcGllY2UsIGJ1dCBtYXli
ZSB3ZSBjYW4NCj4gPiBjaGFuZ2UgdGhlIHBhcmFtZXRlcnMgYXJvdW5kIGF0IHRoYXQgdGltZS4g
SnVzdCBmZWVscyB3ZWlyZCBwYXNzaW5nDQo+ID4gdGhlc2UgYm90aCBpbiBhdCB0aGlzIHBvaW50
Lg0KPiA+IA0KPiANCj4gSSB0aGluayB0aGUgc3R5bGUgaXMgZ2VuZXJhbGx5IGxheWVyIGFjY2Vw
dHMgdGhlIG1haW4gYXJndW1lbnQgZmlyc3QNCj4gZXhwb3J0ZWQgZnVuY3Rpb24uIG9mYyB3ZSBk
b24ndCBhY3R1YWxseSBkbyB0aGF0IGV2ZXJ5d2hlcmUgaW4gWGUNCj4gdGhvdWdoLiBIZXJlIHRo
ZSBtYWluIGFyZ3VtZW50IGZvciB0aGUgbGF5ZXIgJ3hlJy4NCj4gDQo+IENhbiBkcm9wIGlmIHlv
dSBwcmVmZXIsIEkgZG9uJ3QgcmVhbGx5IGhhdmUgc3Ryb25nIG9waW5pb24uDQoNClllYWggb2sg
bWFrZXMgc2Vuc2UuIExldCdzIGxlYXZlIGl0IHRoZSB3YXkgeW91IGhhdmUgaXQgaGVyZS4NCg0K
PiAgDQo+IA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2d0X3BhZ2VmYXVsdF9yZXNldChndCk7
DQo+ID4gPiDCoA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX3VjX3N0b3AoJmd0LT51Yyk7DQo+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jDQo+ID4g
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuYw0KPiA+ID4gaW5kZXggMTQzMDRj
NDFlYjIzLi5hZWYzODllNTE2MTIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcGFnZWZhdWx0LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdl
ZmF1bHQuYw0KPiA+ID4gQEAgLTEyMiw2ICsxMjIsMjQgQEAgaW50IHhlX3BhZ2VmYXVsdF9pbml0
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7
DQo+ID4gPiDCoH0NCj4gPiA+IMKgDQo+ID4gPiArc3RhdGljIHZvaWQgeGVfcGFnZWZhdWx0X3F1
ZXVlX3Jlc2V0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+ID4gc3RydWN0DQo+ID4gPiB4ZV9n
dCAqZ3QsDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgeGVfcGFnZWZhdWx0X3F1ZXVlDQo+
ID4gPiAqcGZfcXVldWUpDQo+ID4gPiArew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIGk7DQo+
ID4gPiArDQo+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiBTcXVhc2ggYWxsIHBlbmRpbmcgZmF1bHRz
IG9uIHRoZSBHVCAqLw0KPiA+ID4gKw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2ly
cSgmcGZfcXVldWUtPmxvY2spOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgZm9yIChpID0gcGZfcXVl
dWUtPnRhaWw7IGkgIT0gcGZfcXVldWUtPmhlYWQ7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpID0gKGkgKyB4ZV9wYWdlZmF1bHRfZW50cnlfc2l6ZSgpKSAlIHBmX3F1ZXVlLQ0KPiA+
ID4gPnNpemUpIHsNCj4gPiANCj4gPiBTaG91bGQgd2UgYWRkIGEgY2hlY2sgaW4gaGVyZSB0aGF0
IHBmX3F1ZXVlLT5oZWFkIGlzIHNvbWUgbXVsdGlwbGUNCj4gPiBvZg0KPiA+IHhlX3BhZ2VmYXVs
dF9lbnRyeV9zaXplIGFuZCBwZl9xdWV1ZS0+c2l6ZSBpcyBhbGlnbmVkIHRvDQo+ID4geGVfcGFn
ZWZhdWx0X2VudHJ5X3NpemUoKT8NCj4gPiANCj4gDQo+IFdlIGNhbiBhZGQgc29tZSBhc3NlcnRz
LCBzdGlsbCB3b3VsZCBnZXQgYW4gaW5maW5pdGUgbG9vcCBidXQgYXQNCj4gbGVhc3QNCj4gQ0kg
d2UgY2F0Y2ggYSBidWcgcXVpY2tseSB3ZSBpbnRyb2R1Y2VkIHNvbWV3aGVyZS4NCg0KWWVhaCBh
c3NlcnRzIGlzIGFsbCBJIHdhcyB0aGlua2luZy4gSnVzdCB0byBnaXZlIHVzIGEgd2F5IHRvIGRl
dGVjdA0KcmVncmVzc2lvbnMgaW4gdGhpcyBhcmVhIGVhc2lseS4NCg0KPiANCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfcGFnZWZhdWx0ICpwZiA9IHBmX3F1
ZXVlLT5kYXRhICsgaTsNCj4gPiA+ICsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAocGYtPmd0ID09IGd0KQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBwZi0+Z3QgPSBOVUxMOw0KPiA+IA0KPiA+IE5vdCBzdXJlIEkg
ZnVsbHkgZ2V0IHRoZSBpbnRlbnQgaGVyZS4uLiBzbyB3ZSBsb29wIGJhY2sgYXJvdW5kIGZyb20N
Cj4gPiBUQUlMIHRvIEhFQUQgYW5kIGNsZWFyIGFsbCBvZiB0aGUgR1RzIGluIHBmX3F1ZXVlLT5k
YXRhIGZvciBlYWNoDQo+ID4gb25lPw0KPiA+IElzIHRoZSBleHBlY3RhdGlvbiB0aGF0IGVhY2gg
ZW50cnkgaW4gdGhlIHBmX3F1ZXVlIGhhcyB0aGUgc2FtZSBHVA0KPiA+IG9yDQo+ID4gaXMgTlVM
TD8gQW5kIHRoZW4gc2V0dGluZyB0byBOVUxMIGlzIGEgd2F5IHdlIGNhbiBhYnN0cmFjdCBvdXQg
dGhlDQo+ID4gR1Q/DQo+ID4gDQo+IA0KPiBUaGlzIHBhdGNoIFsxXSBtb3ZlcyB0aGUgcGFnZSBm
YXVsdHMgcXVldWUgZnJvbSB0aGUgR1QgdG8gdGhlIGRldmljZQ0KPiBhcw0KPiBoYXZpbmcgYSB0
aHJlYWQgcG9vbCBwZXIgR1QgbWFrZXMgbGl0dGxlIHNlbnNlIC0gd2FudCBvdXIgdGhyZWFkIHBv
b2wNCj4gdG8NCj4gYmUgcGVyIGRldmljZSBhbmQgZW5vdWdoIHRocmVhZHMgdG8gaGl0IENQVTwt
PkdQVSBwZWFrIGJ1cyBiYW5kd2lkdGgNCj4gaW4NCj4gd2hhdCB3ZSdkIGV4cGVjdCB0byBiZSBj
b21tb24gcHJlZmV0Y2ggLyBwYWdlIGZhdWx0cyBjYXNlcyAoZS5nLiwgMk0NCj4gU1ZNDQo+IG1p
Z3JhdGlvbnMpLg0KPiANCj4gV2hlbiB0aGUgZmF1bHQgcXVldWVzIHdlcmUgcGVyIEdULCByZXNl
dCB3ZXJlIGVhc3ksIGp1c3QgcmVzZXQgYWxsDQo+IHRoZQ0KPiBxdWV1ZXMgb24gdGhlIEdUIGJ1
dCBub3cgc2Vuc2UgdGhleSBhcmUgc2hhcmVkIG9uIHRoZSBkZXZpY2UgYW5kDQo+IGluZGl2aWR1
YWwgR1RzIGNhbiByZXNldCwgd2Ugc3F1YXNoIGFsbCBmYXVsdHMgb24gdGhlIEdUIGJ5IHNldHRp
bmcNCj4gdGhlDQo+IEdUIHRvIE5VTEwuIFRoaXMgcGF0Y2ggWzJdIGlnbm9yZXMgYW55IGZhdWx0
IHdpdGggYSBOVUxMIEdUIGluIHRoZQ0KPiBmdW5jdGlvbiB4ZV9wYWdlZmF1bHRfcXVldWVfd29y
ay4NCg0KT2sgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24gaGVyZS4gSSBhbHNvIGFtIHN0aWxs
IHdvcmtpbmcgdGhyb3VnaA0KdGhvc2UgbGF0ZXIgcGF0Y2hlcywganVzdCBhbiBpbml0aWFsIGNv
bW1lbnQgaGVyZS4gTGV0IG1lIHJlYWQgdGhyb3VnaA0KdGhvc2Ugb3RoZXIgaW4gZGV0YWlsIGFu
ZCBJJ2xsIGdldCBiYWNrIGlmIEkgc3RpbGwgaGF2ZSBxdWVzdGlvbnMNCnRoZXJlLg0KDQpUaGFu
a3MsDQpTdHVhcnQNCg0KPiANCj4gTWF0dA0KPiANCj4gWzFdDQo+IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82NjczMTgvP3Nlcmllcz0xNTI1NjUmcmV2PTENCj4gWzJd
DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82NjczMjMvP3Nlcmll
cz0xNTI1NjUmcmV2PTENCj4gDQo+ID4gU3RpbGwgZ2V0dGluZyB0aHJvdWdoIHRoZSBzZXJpZXMs
IHNvIGFwcG9sb2dpemUgaWYgdGhpcyBpcyBhbHNvDQo+ID4gYW5zd2VyZWQgbGF0ZXIgaW4gdGhl
IHNlcmllcy4uLg0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiBTdHVhcnQNCj4gPiANCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoH0NCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrX2lycSgmcGZf
cXVldWUtPmxvY2spOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+IMKgLyoqDQo+ID4gPiDCoCAq
IHhlX3BhZ2VmYXVsdF9yZXNldCgpIC0gUGFnZSBmYXVsdCByZXNldCBmb3IgYSBHVA0KPiA+ID4g
wqAgKiBAeGU6IHhlIGRldmljZSBpbnN0YW5jZQ0KPiA+ID4gQEAgLTEzMiw3ICsxNTAsMTAgQEAg
aW50IHhlX3BhZ2VmYXVsdF9pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ID4gwqAgKi8N
Cj4gPiA+IMKgdm9pZCB4ZV9wYWdlZmF1bHRfcmVzZXQoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0
cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gPiDCoHsNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoC8qIFRPRE8g
LSBpbXBsZW1lbnQgKi8NCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGludCBpOw0KPiA+ID4gKw0KPiA+
ID4gK8KgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IFhFX1BBR0VGQVVMVF9RVUVVRV9DT1VO
VDsgKytpKQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3BhZ2VmYXVs
dF9xdWV1ZV9yZXNldCh4ZSwgZ3QsIHhlLT51c20ucGZfcXVldWUNCj4gPiA+ICsNCj4gPiA+IGkp
Ow0KPiA+ID4gwqB9DQo+ID4gPiDCoA0KPiA+ID4gwqAvKioNCj4gPiANCg0K
