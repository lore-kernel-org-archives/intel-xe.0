Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9891CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 19:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EA410E08C;
	Tue, 28 Oct 2025 19:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8gi16/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A04B10E08C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 19:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761679321; x=1793215321;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0aorPcwHOVSU4l2jXiOOzcwJUXbStR+Y3sU/c17xSLA=;
 b=Z8gi16/npnaGzxTbFxtO+qh5FdjMEAXXjWe3lJccA4IPr7qXxG0RKrU+
 ODtIAk2EALu8yJIOb+SXeGApKszkgQUvBhyVfRPyl8vglZutRgfagLBK8
 IX1Iq8GW4WerF4h6/PQFlmXM18xbBKKqw9wMHGVKwJTpmqaQRNzakt3NI
 qriNPx8JLJ0La+ROPdbsva/9HQZbGAyaojYfqxT4whSzve1a1VfDA4imz
 5lQQ+l8hPswJSK6L1GXHGLLn1MoxVB/H8FVlf3qm+Ewyg4xVYOVrAu28n
 kvy/ef6tFnXZvX2ucvExh+ROFqy73w/xpm8IMH8KjDJVVQj1IMjvYjtpy A==;
X-CSE-ConnectionGUID: CAvrzS4hTxK93KE6577t/Q==
X-CSE-MsgGUID: RiX6//TDQkKW4UOuOGaF/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75135377"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="75135377"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:22:00 -0700
X-CSE-ConnectionGUID: qBEYOw45R7qeJwGLipejvQ==
X-CSE-MsgGUID: 3Rb2btB/SKOPeWLmEyEaPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185134323"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:22:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:22:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 12:22:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:22:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJeXe2PXWc887yfRh5cUrSkmE3BfsNBBIoQtAYzEHSxmTGFqEYrh0PEcawXCyouV8OUh4ftVSC8N2uDHoAICMPZa9F4qFctnAW59DeRi1AGrxdIlP2jmlzH8HPWjWoVlKG/nLsZnGIJMJ7TlutT+MU44MFLB/svU4aN518Jts1VR8SAWtB3IxRiy46nar6xWDV/d9a0/SU8+/LPHitZFj8Za69U8p8KCgy80PwCBk2zcPp19wFCkJQ2SWDkYCC/shyZg3NdZ3ZjiC0M0N6WvlJNEBFE5AWKOVxtev6tXV7pkHT09D83eXiJ5ymF3oMPZmQs8wyrjcBBr82vYWwUEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aorPcwHOVSU4l2jXiOOzcwJUXbStR+Y3sU/c17xSLA=;
 b=dBIay3ECa4JOoNA4r1jlji2hXgBNYcNcMCTt0zk5FdEPn4eqEQZEVvLX6N18sd6TqlwABkmSZTXODwSjGYiAcFPoeztj0+4bOD8Yh4zyV+5KE9h38yVTVLx7XyAQhy8g2nJampXh7jwutmwoCAyA6x480hE3CAFmWzYO2xeM6qhgZf4EG8WpeIcGQByqnLtRxUvQSR1XC7yHgnZo+b3Kh26EmAfvCfayoc4/lUC4/VZ8ExmdqiuQNDb5PjHN/3JSOLb6l0tf/EiY75LdEQ4F5pWPyCt/RJKKO9XmPY/fafBaho4MjdDJsK78rqiL35AteGZpnXskxWwOJfTPeLfAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 19:21:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 19:21:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_guc: Dynamically decide g2g buffer owner
Thread-Topic: [PATCH] drm/xe/xe_guc: Dynamically decide g2g buffer owner
Thread-Index: AQHcPf86nvI6BO9nyUe7LB3mniY/O7TWmHUAgAEWyoCAAEWJAIAAAi2wgAAM3eA=
Date: Tue, 28 Oct 2025 19:21:58 +0000
Message-ID: <CH0PR11MB5444EEB04E9A2B390C527EB0E5FDA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251015181159.92509-2-jonathan.cavitt@intel.com>
 <4c8b3cd7-13bc-4051-b58d-df5c68e45e2b@intel.com>
 <CH0PR11MB544495482BE4637C9A705605E5FDA@CH0PR11MB5444.namprd11.prod.outlook.com>
 <6609ff30-2c38-45dd-81ca-3ce852d5ff55@intel.com>
 <CH0PR11MB5444B02E06EFA8485527DF49E5FDA@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5444B02E06EFA8485527DF49E5FDA@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB7824:EE_
x-ms-office365-filtering-correlation-id: fd3e1085-7933-45f9-abe7-08de16574374
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MUk1RG5DajBuMVQyV3NkVlhuRmhIK3oxbGhVVWYya0dWR2kyampDQ1RXNHc3?=
 =?utf-8?B?d21WcU40R0c5MkFvdndQeWZ1TXZHbWU2ajJOMWJJL2p3RCtHT0RxUUt5U3Yx?=
 =?utf-8?B?L2xFYklqQWllT2IxR2JKbnRJanVaNDEvenVLRXpVRDlsNDExdzViSDkreDl6?=
 =?utf-8?B?aWx4NzBHeXJaQUpuTmNGN256QmNRVHRMV0d5MXhqVUZlbk9YWXd1aUdYVGVk?=
 =?utf-8?B?L0ZuVjcxcVJydHBZWm12dG9yREYvWDJscWNkMkhwRHhTN01JQmFpN1J2dG5V?=
 =?utf-8?B?MmdENkNMcUdaVlVlNWVtaEFwZHI4R3B1TXA5WXoxaW9XVDR4Ui9DeWFTaUd1?=
 =?utf-8?B?NUFIdWdoUm5sU0RBaGkwSXFuaUtZOHQvNGxGREFSQm9sUE1vSWxvbVk0NWFr?=
 =?utf-8?B?aHJrRkdOT1JaTHVTUmpFZ2FaTmwyY3R0SmJ5MVJkOXRkVmdmSHRJMkl0QWV3?=
 =?utf-8?B?VHFIb3YxQ3hEY2VISy9EU1Bvc1JLdWF4a01YdGhKTTdSaTNPUnJaRHFRR3dR?=
 =?utf-8?B?YTVTaFpiTjJ5cVBvV0tQK2tFcE9sZzdvcDYvVWt1anFKUFJCbnpuLzJnK2sy?=
 =?utf-8?B?aUVTeDVmWjRucEFSUnNmcDRLOXFWTUs2cWVUeWkyWDF4Y2h0a09ISkpWNDRP?=
 =?utf-8?B?aVdOYXlWWnhZUUtXUDdpRGloQUhjcFlzVUFGa0RFRDR3Szg5MHFCSnZrYk5m?=
 =?utf-8?B?dkF6dENQUFZTOFJCZFhTd1RUaFJ0SUlZYjBLZGtFYndhOUZ5Sy80STRoVDY1?=
 =?utf-8?B?d25VVmtXanc3aUN3TTlqL1Z1bkRrQzN4a1RoRlBWU2xkeEpxWVN0TlNrbTRk?=
 =?utf-8?B?WkcyYnBxT2VPdVkyTDFOUDVORTFnS3VyRlNJYi9jMld3VjcwN3lvMEVVcURG?=
 =?utf-8?B?NDdkcmRIV0pFN3dzRG5SZy84T29aODVQeWVTdU82RHJVOFVhZWlmQTlMZVdh?=
 =?utf-8?B?N0hWVkJEZ2FPTHhmZE1kdGVYaEtnV1k4NW1xcW9MNUR4RFBFNWRwZHB6NVpX?=
 =?utf-8?B?WG1NNmRaQnQyZXFvVGNFRiszVCs0UVd0UHBtM3E3Z1Y0ODRlalF6SVd0R1BT?=
 =?utf-8?B?TUpYVXo2QnRnZnhNd3QxWFFsT0JNNmRHMmN0Q1BocS9yRm5PRG9yZHBkb2FJ?=
 =?utf-8?B?NURuYk9RM3RMb0U3dGRrTFlyZ1hoanVVTGp1TnVGV1MrRmllQ0l2SHJlSHNL?=
 =?utf-8?B?S2pZRW5tUVJyWVZmdHlnYXZhRlVrUU55WU9HVXljTzk0SnR4cmc3VEw2UWN2?=
 =?utf-8?B?MUM2OVc5WE4rVG84aTgrMjhWQXZTUlRkRFVMcUU4c0E1S3FNV082THpodGl2?=
 =?utf-8?B?dnNmRFNYWjFPRlVMRUR6MVRDU2Y5VXo2VUY1Mk94QnlTaG9kQk4yeE5sTklS?=
 =?utf-8?B?MkUxZ1FuN00xY2tQcCttZFFKV3I5OXgydUcrY1J2K0lKQml6aXVRYWVYbjVY?=
 =?utf-8?B?MDFIakl5bVh6UzF4eStCTk92M0hNaUoveTdIcnl0d3FaR1VBSFRjaVNDc3do?=
 =?utf-8?B?em1XdUJyUWZCRHdPUGdtcmo5S0U2QXkzVnhpVmdYSHF4YnJTSzJRa3dTNTcz?=
 =?utf-8?B?WXZQRi9iWWFtbzhzOU9qeno2T0VCdjFUTWtjY3JDK2V6ZDl3b2daRU1vZWhK?=
 =?utf-8?B?MFZKYVlTVUc1em4xc2s2bHJKeFVCb0I4MzdNMEhITmZSQzY4K0xrYkI1ZVQy?=
 =?utf-8?B?WUNMcCthZXVLSWk0ak9BajZIWUkwd2dyOC9YOENGZjQ2aHJuRmQ0T1A4WXBF?=
 =?utf-8?B?aW1MTFNNUHAzdFVvdjVhcDFNWmZHWERQdEVrZnBKMTQ5a1pjWUJLOGJUKzRj?=
 =?utf-8?B?alYvcVJxcE4weHNDS3VwcFNjek9kQXFxUkxqcVYyYkNCNUd6elBDUnc2OVJo?=
 =?utf-8?B?NTRqcXY0UGFraVg0b0YrQnh1VkkrVnVpWXNXQ2swa3RONDV6ckE3dUpwSlJx?=
 =?utf-8?B?RENucGpYN2RrOVYxQzdmUTI1ZDFRcEtrS2tBdXFJZXNCc3FBUmVuOFRLdm9C?=
 =?utf-8?B?T0pqNEcrU1hnTi9qWHY5TW50ekRXSzRzNFdzbXh1azJnWXF0YkM1VXRRZ2tm?=
 =?utf-8?Q?giTnjm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXJLUmMrVnBHVHFPWVVQNjczQ3JpMmMwbVdGT0owYTlvdGlwbGUvZFpTMG9q?=
 =?utf-8?B?TGlLb0t4bHFWSk80RlpLVUJET1ovVGZoaUJGWVJQSytNellCbTVMaTVnOEVa?=
 =?utf-8?B?VEhxeTE3T1haSXZLRnovZTdlMnVqOWEzS055Yk9UUTlWL2NXbUJIbTJvQ3lt?=
 =?utf-8?B?Nzd1THhrMjB0bFFnNkNFRVFTRmlTZGZGS2szTThVN0RRd3BRZkFwckhldEpY?=
 =?utf-8?B?dGVHYlIrZ1BXcWVwcy91eklLNy92V3dhRHUxeEhhQzBpOGhRZjA5dGg5eEVH?=
 =?utf-8?B?eDBWRU5rS1IwK2VScEFkZzJ2Z0t3MjZGbXhjVGd2ejljcGdhMmtRTDU2RExF?=
 =?utf-8?B?bXZGbzlxaStLRmU1VUg3ZGwwRUhVR3pOT0lKLzEvWjdpWHdtYXpxaDZIZnJ3?=
 =?utf-8?B?c0h1UzFtMitXNFY0bU0xbzllYnpSbkY3Q1Vqdk43aG1iL1UxUjJ2RjBZeisx?=
 =?utf-8?B?ZmZ6UWlqcS8vV21UdzQ3RjJtb1Q0QWk4V0hVQU5kNGFmcTBiTmZrRmYwQ2ZJ?=
 =?utf-8?B?TFJYS2Jkblh2ekFGc0pHeGJNY1laQlVJQWgwUE1LbUo0cXNCLzZqYThPd3pD?=
 =?utf-8?B?UXBCMU1jRWFKSjNocUpQamxWTFlsb2c3UlV1UFdxQzMxWnQrMTJ6VTBNYW9N?=
 =?utf-8?B?akZ5L00zTWVmSXlUbjZ0YXNaaVp1bHNrVDZEeTRmZUlZT3Myd0Q3bENodmJr?=
 =?utf-8?B?Y25iNjhvb2ZrNnZVSldZQlM5Y2Jtd2JSM3Via1ZSWkxzVkJHWlplaDNQNEJi?=
 =?utf-8?B?TVRDdDYxNk1GeEwybUs3MUVOMDcxMGlsUnpVM2lPMUdlVWJzQk1xdEdRV2JK?=
 =?utf-8?B?YkRrY0FiN0NnVyt4MGNhRkdZaEs2cnNpKzE3cmlMSkNIVVFvdXdUMnpid1FX?=
 =?utf-8?B?a0puYVR0Y2xFOUQ3UkxvNEg1K1c0dE1yaEJ2QTRkR290R2xRWmxFWEh0K1J2?=
 =?utf-8?B?aC9vT1JPMDYwUzRFbEs5UmFCUWMxY2hML2pnSDRnTGRibTFCU0pUUTNUa0VB?=
 =?utf-8?B?SGJsVHhyeUNoenlTQ0djK21yMWNIMllrMjFsclRmVFRSaUNKQ21ZWVk1Wlgr?=
 =?utf-8?B?OVBnOUdXeUNpZ3JzV1FLczhvbVhCSWZKRG1MZnl2Qzl1ckJSYkpYQm9WU01p?=
 =?utf-8?B?R1c4R0duYVZ3R1VOc3piMEpReFVXSnh6Mlc1MkZ2OTJkSTNneXFUbzEweTVL?=
 =?utf-8?B?MlZvSWZtT0hGSEdnMzBkK1BBb2cwQnhLUGhZK1ltZmFxWjB2ekNMdEVoOE1J?=
 =?utf-8?B?bmM2dCsreGRNcmtUZE5rZkZZK0VUTGVQb1NaR2VRaGRiWkphaHcrb0R4aFI4?=
 =?utf-8?B?WmJDWkxRUzNGVHRFUFBURURORXdadlZkUU1mYVRDc1o1bVhvZjF1WVlWb1dP?=
 =?utf-8?B?elhwNEF4YjhwZWlrRDhUTGxCbml3SmthaGNnVDgyRHdsZUxhakZuR0pwUVM5?=
 =?utf-8?B?SEl2clZjSlN6VVlucUtZV3NkUXB0bFU0RElZN1JNV0JENmFKVURrdnEyQS9p?=
 =?utf-8?B?aHB2Ny9QR3BrNWs5bi9JamwyOC91RTcrQjBiaTJQemNDU05UZE82UHNuMFcw?=
 =?utf-8?B?K0xVcEJuZmJnYjR0L0p3eUYyeDBaUDIvV0lHb1FXaEs0T0hiOE1IQnpOYmFh?=
 =?utf-8?B?dXNDSnRpbkc1c3hnTTczMHVsclo5WDhpa2dLcnplMHJHQzRYRVhTUDJxSFpV?=
 =?utf-8?B?dlZ6LzNaaEJtdWFwbUdkTTFMQXB1aUZDRWVSVTdRaDdGVkdaWmhPMnR4Q0ow?=
 =?utf-8?B?NDQwMW54VU1mSnp6WFZZT2tGR0hWM0l6dzl3ZU92eTRDNjB6RkRYUEk5Rzli?=
 =?utf-8?B?UFJSYzdXSFpXbXRQOFVOT2RoZFh6TjJMZm41a1BTcXphbkJSWXlCMHpST0lp?=
 =?utf-8?B?bzhBNGJCT291a1gwb2plMEhtTDBPb3NEY1orLzJOcWlDb0xwSldzV3lLMDEw?=
 =?utf-8?B?WE85eHpNaW8vc0l6VThPKzlMTkgyOVBlR3BOVGYvM3NkZWlHZDN5ZnIxdlhq?=
 =?utf-8?B?anN0ME5CaHlia1JOZmhRcDBPR0pGNHpoZU9DZ0NiTDRYeUVoRktjVTlwUzJV?=
 =?utf-8?B?VDBBL0pDdFJ2elhMQ0lWTHJWcmk2ZGJmWFc1UGVCc2hlSkhBMXBSb3RKU0tN?=
 =?utf-8?B?a2ZPcUYrcENTY2czMVdkTzQweHhSb3FJdUhxZDhsRkpVbVlaTnNFMkFpWkpz?=
 =?utf-8?Q?tRencO8c6VW+q5ApX2FgJHqiswliegDLzEpOQnyQ1RqC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3e1085-7933-45f9-abe7-08de16574374
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 19:21:58.2822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8V3cMgZq+oybLtsVg/+5luhyWb0e36Pbp0WOO86czv8HsbU860WpYv07y8HmZEL200g++wDCL2rQAQVtEXsiZ3eK+ZmVM8nBBT1BEfwB74s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0
aGFuLmNhdml0dEBpbnRlbC5jb20+IA0KU2VudDogVHVlc2RheSwgT2N0b2JlciAyOCwgMjAyNSAx
MTozOSBBTQ0KVG86IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIDxkYW5pZWxlLmNlcmFvbG9zcHVy
aW9AaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEs
IHNhdXJhYmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVv
QGludGVsLmNvbT47IFdhamRlY3prbywgTWljaGFsIDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNv
bT47IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBDYXZpdHQs
IEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KU3ViamVjdDogUkU6IFtQQVRD
SF0gZHJtL3hlL3hlX2d1YzogRHluYW1pY2FsbHkgZGVjaWRlIGcyZyBidWZmZXIgb3duZXINCj4g
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENlcmFvbG8gU3B1cmlvLCBE
YW5pZWxlIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPiANCj4gU2VudDogVHVlc2Rh
eSwgT2N0b2JlciAyOCwgMjAyNSAxMToyNyBBTQ0KPiBUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9u
YXRoYW4uY2F2aXR0QGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFs
ZXggPGFsZXguenVvQGludGVsLmNvbT47IFdhamRlY3prbywgTWljaGFsIDxNaWNoYWwuV2FqZGVj
emtvQGludGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS94ZS94ZV9ndWM6IER5bmFtaWNhbGx5IGRl
Y2lkZSBnMmcgYnVmZmVyIG93bmVyDQo+ID4gDQo+ID4gT24gMTAvMjgvMjAyNSA3OjM3IEFNLCBD
YXZpdHQsIEpvbmF0aGFuIHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiA+IEZyb206IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIDxkYW5pZWxlLmNlcmFvbG9zcHVy
aW9AaW50ZWwuY29tPg0KPiA+ID4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDI3LCAyMDI1IDI6NDAg
UE0NCj4gPiA+IFRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29t
PjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiBDYzogR3VwdGEsIHNhdXJh
YmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVs
LmNvbT47IFdhamRlY3prbywgTWljaGFsIDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT47IFJv
cGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4gPiBTdWJqZWN0
OiBSZTogW1BBVENIXSBkcm0veGUveGVfZ3VjOiBEeW5hbWljYWxseSBkZWNpZGUgZzJnIGJ1ZmZl
ciBvd25lcg0KPiA+ID4+IE9uIDEwLzE1LzIwMjUgMTE6MTIgQU0sIEpvbmF0aGFuIENhdml0dCB3
cm90ZToNCj4gPiA+Pj4gT24gdG9kYXkncyBkcml2ZXIsIHhlX2RldmljZV9nZXRfZ3QoeGUsIDAp
OyBjYW4gbmV2ZXIgcmV0dXJuIE5VTEwuDQo+ID4gPj4+IEhhcmR3YXJlLXdpc2UgdGhlcmUncyBh
bHdheXMgYXQgbGVhc3Qgb25lIHRpbGUsIGFuZCBldmVyeSB0aWxpZSBoYXMgYQ0KPiA+ID4+PiBw
cmltYXJ5IEdULiAgSWYgc29tZXRoaW5nIHdlbnQgd3JvbmcgZHVyaW5nIGluaXQgb2YgdGlsZSBv
ciBHVCBhbmQgd2UNCj4gPiA+Pj4gY291bGRuJ3QgY3JlYXRlL2luaXRpYWxpemUgdGhlIHN0cnVj
dHVyZXMsIHRoZW4gd2UgYWxyZWFkeSBhYm9ydGVkIHRoZQ0KPiA+ID4+PiBkZXZpY2UgcHJvYmUg
aW1tZWRpYXRlbHkgYW5kIHdlJ2xsIG5ldmVyIGdldCBmdXJ0aGVyIG9uIHRvIHBsYWNlcyBpbiB0
aGUNCj4gPiA+Pj4gY29kZSB0aGF0IHdvdWxkIGJlIGNoYXNpbmcgYSBOVUxMIHBvaW50ZXIuDQo+
ID4gPj4+DQo+ID4gPj4+IEhvd2V2ZXIsIHRoZXJlJ3MgY3VycmVudGx5IG9uZ29pbmcgd29yayB0
byBhbGxvdyB0aGUgcHJpbWFyeSBHVCB0byBiZQ0KPiA+ID4+PiBkaXNhYmxlZCB2aWEgY29uZmln
ZnMgZm9yIGRlYnVnZ2luZyBwdXJwb3Nlcy4gIE9uY2UgdGhhdCBsYW5kcywgaXQgd2lsbA0KPiA+
ID4+PiBiZSBwb3NzaWJsZSBmb3IgdGhpcyBxdWVyeSB0byByZXR1cm4gYSBOVUxMIHBvaW50ZXIu
ICBUaGlzIGNhbiBjYXVzZQ0KPiA+ID4+PiBwcm9ibGVtcyBpbiBndWNfZzJnX2FsbG9jLCBhcyB0
aGlzIHByb2Nlc3MgY3VycmVudGx5IHJlbGllcyBvbiB0aGUNCj4gPiA+Pj4gcHJpbWFyeSBHVCBh
bHdheXMgYmVpbmcgcHJlc2VudC4NCj4gPiA+Pj4NCj4gPiA+Pj4gSW5zdGVhZCBvZiBtYWtpbmcg
dGhlIHByaW1hcnkgR1QgdGhlIGcyZyBidWZmZXIgb3duZXIsIG1ha2UgdGhlIGZpcnN0DQo+ID4g
Pj4+IEd1QyBwYXNzZWQgdG8gZ3VjX2cyZ19hbGxvYyB0aGUgZzJnIGJ1ZmZlciBvd25lci4gIFRo
aXMgcmVxdWlyZXMga2VlcGluZw0KPiA+ID4+PiB0cmFjayBvZiB0aGUgZzJnIGJ1ZmZlciBvd25l
ciBpbiB0aGUgeGUgZGV2aWNlIHNvIGVhY2ggR3VDIGNhbiBrbm93IGlmDQo+ID4gPj4+IGl0J3Mg
dGhlIG93bmVyIG9yIG5vdCBkdXJpbmcgaW5pdGlhbGl6YXRpb24uDQo+ID4gPj4+DQo+ID4gPj4+
IE5vdGUgdGhhdCB0aGUgYXNzb2NpYXRlZCBrdW5pdCB0ZXN0aW5nIGNvZGUgZG9lcyBub3QgbmVl
ZCB0byBiZSB1cGRhdGVkDQo+ID4gPj4+IHRvIHJlZmxlY3QgdGhpcyBjaGFuZ2UgYmVjYXVzZQ0K
PiA+ID4+PiAxLiBUaGUga3VuaXQgdGVzdGluZyBjb2RlIGFsd2F5cyBydW5zIHdpdGggdGhlIHBy
aW1hcnkgR1QgZW5hYmxlZCwgYW5kDQo+ID4gPj4+IDIuIFRyYWNraW5nIHRoZSBnMmcgYnVmZmVy
IG93bmVyIGluIHRoZSB4ZSBkZXZpY2UgaXMgdW5uZWNlc3NhcnkgdG8NCj4gPiA+Pj4gICAgICBw
ZXJmb3JtIHRoZSBmdW5jdGlvbnMgb2YgdGhlIHRlc3RzLg0KPiA+ID4+IEknbSBub3QgY29udmlu
Y2VkIHRoaXMgd29ya3Mgd2l0aG91dCBtb2RpZmljYXRpb24gdG8gdGhlIHNlbGZ0ZXN0LiBJbg0K
PiA+ID4+IHRoZSBjYXNlIHdoZXJlIHRoZSBHMkcgaXMgYWxyZWFkeSBlbmFibGVkLCB0aGUgc2Vs
ZnRlc3Qgd2lsbCBkZXN0cm95IHRoZQ0KPiA+ID4+IGJ1ZmZlciAoc2VlIGcyZ19mcmVlKSB0byBj
cmVhdGUgYSBuZXcgb25lIGZvciB0aGUgdGVzdGluZy4gQm90aCBmb3IgdGhlDQo+ID4gPj4gRzJH
X0NUQl9UWVBFX0RFRkFVTFQgc3VidGVzdCBhbmQgYXMgY2xlYW51cCBhdCB0aGUgZW5kLCB0aGUg
dGVzdCB3aWxsDQo+ID4gPj4gY2FsbCBndWNfZzJnX2FsbG9jKCkgYWdhaW47IGluIHRoaXMgc2Nl
bmFyaW8geGUtPmcyZ19vd25lciBoYXMgbm90IGJlZW4NCj4gPiA+PiBjbGVhcmVkIGJ1dCB0aGUg
Qk8gaXMgbm90IGFsbG9jYXRlZCwgc28gdGhlIGNvZGUgaW4gZzJnX2FsbG9jIHdpbGwgdHJ5DQo+
ID4gPj4gdG8gZG8gYW4geGVfYm9fZ2V0IG9uIGEgYmFkIHBvaW50ZXIuIEkgY291bGRuJ3QgZmlu
ZCB0aGUgZzJnIHRlc3QgaW4gdGhlDQo+ID4gPj4gQ0kgcmVzdWx0cyBzbyBjb3VsZG4ndCBjb25m
aXJtIHRoYXQgdGhpcyBpcyBpbmRlZWQgaGFwcGVuaW5nIGFuZCBJJ20gbm90DQo+ID4gPj4gbWlz
c2luZyBzb21ldGhpbmcuDQo+ID4gPiBObywgdGhpcyBpcyBjb3JyZWN0LiAgVGhlIHNvbHV0aW9u
IGhlcmUgc2hvdWxkIGJlIGFzIGVhc3kgYXMNCj4gPiA+IHhlLT5nMmdfb3duZXIgPSBOVUxMIGF0
IHRoZSBlbmQgb2YgZzJnX2ZyZWUgKGFuZCBtYXliZQ0KPiA+ID4geGUtPmcyZ19vd25lciA9ICZy
b290X2d0LT51Yy5ndWMgaW4gZzJnX2Rpc3RyaWJ1dGUgZm9yIGNvbXBsZXRlbmVzcyBzYWtlKS4N
Cj4gPiA+DQo+ID4gPiBJIGhhdmUgdG8gd29uZGVyIHdoYXQgdGhlIHBvaW50IG9mIGRpc2FibGlu
ZyBhbmQgcmVlbmFibGluZyB0aGUgZzJnIGludGVyZmFjZQ0KPiA+ID4gaW4gdGhlIGtlcm5lbCBk
dXJpbmcgdGhlIGcyZyBzZWxmdGVzdHMgaXMgZ2l2ZW4gd2UgYXJlbid0IGV2ZW4gdXNpbmcgdGhh
dCBpbnRlcmZhY2UNCj4gPiA+IHRvIHBlcmZvcm0gdGhlc2Ugc2VsZnRlc3RzLCBidXQgd2hhdGV2
ZXIuDQo+ID4gDQo+ID4gVGhlcmUgaXMgbm8gbm9uLXRlc3Qga2VybmVsIGludGVyZmFjZSBmb3Ig
RzJHLCB0aGUgRzJHIGlzIHB1cmVseSBmb3IgdGhlIA0KPiA+IEd1Q3MgdG8gdXNlIHRvIGNvbW11
bmljYXRlIHdpdGggZWFjaCBvdGhlciwgdGhlIGRyaXZlciBqdXN0IGFsbG9jYXRlcyANCj4gPiB0
aGUgQk8gZm9yIHRoZSBHdUNzLiBUaGUgdGVzdCBqdXN0IG5lZWRzIHRvIG1ha2Ugc3VyZSB0aGF0
IHdlJ3ZlIA0KPiA+IGFsbG9jYXRlZCB0aGUgQk8gYW5kIGluaXRpYWxpemVkIHRoZSBHdUMgc3Ry
dWN0dXJlcyBjb3JyZWN0bHk7IHdlIA0KPiA+IGRlLWFsbG9jYXRlIGFuZCByZS1hbGxvY2F0ZSB0
aGUgQk8gZHVyaW5nIHRoZSB0ZXN0IHRvIG1ha2Ugc3VyZSB0aGF0IG5vIA0KPiA+IG1hdHRlciB3
aGVyZSB3ZSBhbGxvY2F0ZSBpdCBldmVyeXRoaW5nIHN0aWxsIHdvcmtzLg0KPiANCj4gT2theS4u
LiBhZG1pdHRlZGx5LCB0aGUgdGVzdCBjb25mdXNlcyBtZSBxdWl0ZSBhIGJpdCBiZWNhdXNlIEkg
a2VlcCB0aGlua2luZw0KPiB0aGUgZzJnX3Rlc3RfYXJyYXkgSVMgdGhlIEcyRyBidWZmZXIgd2Un
cmUgdXNpbmcsIGJ1dCBJIGNhbiBzZWUgbm93IHRoYXQgd2UncmUNCj4ganVzdCB1c2luZyBpdCB0
byBzdG9yZSB0aGUgaW5pdGlhbCB2YWx1ZSBmb3IgdGVzdCBjb21wYXJpc29uLiAgSSdkIGFyZ3Vl
IHdlIHNob3VsZA0KPiBqdXN0IGJlIHVzaW5nIGEgc3RhdGljIHZhcmlhYmxlIG91dHNpZGUgb2Yg
dGhlIHhlIHN0cnVjdCB0byBhdm9pZCBjb25mdXNpb24sIGJ1dA0KPiB3ZSBoYWQgYSBjb252ZXJz
YXRpb24gaW4gcHJpdmF0ZSBhYm91dCB3aHkgd2UgY2FuJ3QgZG8gdGhhdCwgc28gSSB3b24ndCBi
b3RoZXINCj4gcmVoYXNoaW5nIHRoYXQuDQo+IA0KPiBJIGd1ZXNzIGFsdGVybmF0aXZlbHksIHdl
IHNob3VsZCBjb25zaWRlciByZW5hbWluZyB0aGUgdmFyaWFibGUgdG8sIHNheSwNCj4gImcyZ190
ZXN0X2luaXRpYWxfdmFsdWUiLCBidXQgdGhhdCdzIG5vdCBwYXJ0aWN1bGFybHkgcmVsZXZhbnQg
dG8gdGhpcyB0ZXN0IHNlcmllcy4NCg0KKnBhdGNoIHNlcmllcywgbm90IHRlc3Qgc2VyaWVzLg0K
QWxzbywgdGhpcyBpcyBhIHNpbmdsZXRvbiBwYXRjaCwgbm90IGEgcGF0Y2ggc2VyaWVzLg0KDQpJ
J3ZlIHJlYWxseSBub3QgYmVlbiBvbiB0aGUgYmFsbCB0b2RheSwgSSBndWVzcy4NCi1Kb25hdGhh
biBDYXZpdHQNCg0KPiAtSm9uYXRoYW4gQ2F2aXR0DQo+IA0KPiA+IA0KPiA+IERhbmllbGUNCj4g
PiANCj4gPiA+IC1Kb25hdGhhbiBDYXZpdA0KPiA+ID4NCj4gPiA+PiBEYW5pZWxlDQo+ID4gPj4N
Cj4gPiA+Pj4gU3VnZ2VzdGVkLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwu
Y29tPg0KPiA+ID4+PiBTdWdnZXN0ZWQtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmll
bGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IEpvbmF0
aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gPiA+Pj4gQ2M6IE1pY2hh
bCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiA+ID4+PiAtLS0NCj4g
PiA+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHwgNCArKysrDQo+
ID4gPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyAgICAgICAgICB8IDkgKysrKysr
LS0tDQo+ID4gPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4gPiA+Pj4NCj4gPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2VfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMu
aA0KPiA+ID4+PiBpbmRleCAwMmMwNGFkNzI5NmUuLmUxN2Y4Yjg0YjhkNCAxMDA2NDQNCj4gPiA+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+ID4+PiBAQCAtMzgs
NiArMzgsNyBAQCBzdHJ1Y3QgZHJhbV9pbmZvOw0KPiA+ID4+PiAgICBzdHJ1Y3QgaW50ZWxfZGlz
cGxheTsNCj4gPiA+Pj4gICAgc3RydWN0IGludGVsX2RnX252bV9kZXY7DQo+ID4gPj4+ICAgIHN0
cnVjdCB4ZV9nZ3R0Ow0KPiA+ID4+PiArc3RydWN0IHhlX2d1YzsNCj4gPiA+Pj4gICAgc3RydWN0
IHhlX2kyYzsNCj4gPiA+Pj4gICAgc3RydWN0IHhlX3BhdF9vcHM7DQo+ID4gPj4+ICAgIHN0cnVj
dCB4ZV9weHA7DQo+ID4gPj4+IEBAIC02MjYsNiArNjI3LDkgQEAgc3RydWN0IHhlX2RldmljZSB7
DQo+ID4gPj4+ICAgIAlhdG9taWNfdCBnMmdfdGVzdF9jb3VudDsNCj4gPiA+Pj4gICAgI2VuZGlm
DQo+ID4gPj4+ICAgIA0KPiA+ID4+PiArCS8qKiBAZzJnX293bmVyOiBQb2ludGVyIHRvIHRoZSBH
dUMgdGhhdCBpcyB0aGUgb3duZXIgb2YgdGhlIGcyZyBidWZmZXIgKi8NCj4gPiA+Pj4gKwlzdHJ1
Y3QgeGVfZ3VjICpnMmdfb3duZXI7DQo+ID4gPj4+ICsNCj4gPiA+Pj4gICAgCS8qIHByaXZhdGU6
ICovDQo+ID4gPj4+ICAgIA0KPiA+ID4+PiAgICAjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX1hF
X0RJU1BMQVkpDQo+ID4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPiA+Pj4gaW5kZXggZDk0NDkwOTc5
YWRjLi45NzkwZGRhZDYwNmEgMTAwNjQ0DQo+ID4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWMuYw0KPiA+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4g
PiA+Pj4gQEAgLTQ2NSw5ICs0NjUsOCBAQCBzdGF0aWMgaW50IGd1Y19nMmdfYWxsb2Moc3RydWN0
IHhlX2d1YyAqZ3VjKQ0KPiA+ID4+PiAgICAJaWYgKGd1Yy0+ZzJnLmJvKQ0KPiA+ID4+PiAgICAJ
CXJldHVybiAwOw0KPiA+ID4+PiAgICANCj4gPiA+Pj4gLQlpZiAoZ3QtPmluZm8uaWQgIT0gMCkg
ew0KPiA+ID4+PiAtCQlzdHJ1Y3QgeGVfZ3QgKnJvb3RfZ3QgPSB4ZV9kZXZpY2VfZ2V0X2d0KHhl
LCAwKTsNCj4gPiA+Pj4gLQkJc3RydWN0IHhlX2d1YyAqcm9vdF9ndWMgPSAmcm9vdF9ndC0+dWMu
Z3VjOw0KPiA+ID4+PiArCWlmICh4ZS0+ZzJnX293bmVyKSB7DQo+ID4gPj4+ICsJCXN0cnVjdCB4
ZV9ndWMgKnJvb3RfZ3VjID0geGUtPmcyZ19vd25lcjsNCj4gPiA+Pj4gICAgCQlzdHJ1Y3QgeGVf
Ym8gKmJvOw0KPiA+ID4+PiAgICANCj4gPiA+Pj4gICAgCQlibyA9IHhlX2JvX2dldChyb290X2d1
Yy0+ZzJnLmJvKTsNCj4gPiA+Pj4gQEAgLTQ5Miw2ICs0OTEsNyBAQCBzdGF0aWMgaW50IGd1Y19n
MmdfYWxsb2Moc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ID4+PiAgICAJeGVfbWFwX21lbXNldCh4
ZSwgJmJvLT52bWFwLCAwLCAwLCBnMmdfc2l6ZSk7DQo+ID4gPj4+ICAgIAlndWMtPmcyZy5ibyA9
IGJvOw0KPiA+ID4+PiAgICAJZ3VjLT5nMmcub3duZWQgPSB0cnVlOw0KPiA+ID4+PiArCXhlLT5n
Mmdfb3duZXIgPSBndWM7DQo+ID4gPj4+ICAgIA0KPiA+ID4+PiAgICAJcmV0dXJuIDA7DQo+ID4g
Pj4+ICAgIH0NCj4gPiA+Pj4gQEAgLTUwNCw2ICs1MDQsOSBAQCBzdGF0aWMgdm9pZCBndWNfZzJn
X2Zpbmkoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ID4+PiAgICAJLyogVW5waW5uaW5nIHRoZSBv
d25lZCBvYmplY3QgaXMgaGFuZGxlZCBieSBnZW5lcmljIHNodXRkb3duICovDQo+ID4gPj4+ICAg
IAlpZiAoIWd1Yy0+ZzJnLm93bmVkKQ0KPiA+ID4+PiAgICAJCXhlX2JvX3B1dChndWMtPmcyZy5i
byk7DQo+ID4gPj4+ICsJLyogZzJnIG93bmVyIGlzIG5vIGxvbmdlciB2YWxpZC4gIE1hcmsgYXMg
TlVMTCBpbiB4ZSBkZXZpY2UgKi8NCj4gPiA+Pj4gKwllbHNlDQo+ID4gPj4+ICsJCWd1Y190b194
ZShndWMpLT5nMmdfb3duZXIgPSBOVUxMOw0KPiA+ID4+PiAgICANCj4gPiA+Pj4gICAgCWd1Yy0+
ZzJnLmJvID0gTlVMTDsNCj4gPiA+Pj4gICAgfQ0KPiA+ID4+DQo+ID4gDQo+ID4gDQo+IA0K
