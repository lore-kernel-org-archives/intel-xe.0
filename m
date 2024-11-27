Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B61FD609A8
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 07:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E0410E9E2;
	Wed, 27 Nov 2024 07:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSbiSdRq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD5710E9E2
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 07:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732691547; x=1764227547;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gil625MfWJYomORjXqT0So6T9HNV2rirOKiTRIaHrEw=;
 b=fSbiSdRq8bXT1aJC0IEc0svbBOXN7AJSu0Eyq9SJr54BftxWC39K5eGE
 XSdEyH4L1/7WD/F2w9hoOxgaC1S1SDMYKdpOatf5U3XbdJvK3hyn5uIzV
 /QMWsfFFiRQqsSZ6ttZscGC4cxFenKlefwaUnEauRsB2skenxSRN7+Z1R
 J67N3M73tXdVJzrru0ni/rWZuQkmEpSQqNWIKr41SGSZuBsBmwRxdbuMR
 cTrGqIFAaIsmwNAQV9SMNzfJ3+hILGCC31yrIpQAe1KeH2pRE13492OSk
 UyE+iVdam89j5/S6tkXYLqrHD733mse43DCKNN9f9B3vlhfuuyBZ/ajVf w==;
X-CSE-ConnectionGUID: r2XLJ+qdQaCke2mZIc9mJg==
X-CSE-MsgGUID: ntf8dbGwQQGj1e9ZVjYz3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32254130"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="32254130"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 23:12:26 -0800
X-CSE-ConnectionGUID: 3i5xpzHDRi2k3LfHXyki3w==
X-CSE-MsgGUID: on5HW2lTQIC3QYyvR/yh+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="92674125"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 23:12:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 23:12:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 23:12:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 23:12:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KI1rNsfT78yvNcOYnZZSMfiyoiskmO9LD3Ai8Vlsu/OmfeEqoOm8k+S+pPaIhkFGrDPqfLn1vF7HhxFMHAZeWPNRMSgnSrNMtpvHnr2hNF319i/+z2gut/+dIDyjOEAihh4xyJfUuLiw9wRH8MzJLI/1xAu5SunybV61NCAwppufEVv3wQ63+Cl7nJvYVz0SQHWBbGSCucXnSb3OYEHHwENs+12me+VHLi0Tmiyv0BKBvDdbA1fggZqSrOeSTy1uxweDMM1nySNu07yrd+y5OfHFV7dkE3XJ0MQuHLT2neAVqP/9WMZJdaqn11a2Ku1Ha9mmX3sO5ch4nvdd/IdJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdqaSRdNslaxhdG6y4ZE71tz/gWKCIkTdk3mt69WKCI=;
 b=tozxEppLeecCOUgAm6Qk3Uic7ZV+HkXlLD3m7EjlXL4vY2BNDthqC+qJw0okM+jb9k3CLyg6dDO7XFCYFqfsa2RGrT0PLFS2MJrkqzVFAW9RwVRYMex6SfeUVQP4NFGwR0BRF3e0EsM90DiEbVm66JKI92s3YAk0WFrbI3jnk03EeOz0W3oBCpLVdg5f7qHTO3PYioAYYsFz4luNSWNdQlR7goBR55WRVMfnlkLqZXKyT+9toBReoYHvaNc605FQJrkxuOgskGbHtoFvhV/Dukbt6RqdH4tfZOS1FlDb5lOgztHpvHcf/Qp4rX1HtWWplvve7iIEwrnmyCOpSV/55w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7485.namprd11.prod.outlook.com (2603:10b6:806:31c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.12; Wed, 27 Nov 2024 07:12:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 07:12:22 +0000
Message-ID: <3288651c-3b4f-4e84-accf-a0ae8c77eb83@intel.com>
Date: Wed, 27 Nov 2024 12:42:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>, <intel-xe@lists.freedesktop.org>,
 "Tvrtko Ursulin" <tvrtko.ursulin@intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-2-vinay.belgaumkar@intel.com>
 <o42m66pseq7yxitt27whcwjntvtuoxndlxcvld2vak5i6ejhtv@ny3ilfuxvwyz>
 <602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com>
 <3de57ee4-d8a6-4b39-bd17-0fd2f00adc2b@linux.intel.com>
 <shrwluh7x22szbsntnu7chuxr4i4q2uvrmfy6bxeru4ue6vemd@moyhm6rfrw3f>
 <Z0TLB2W3n37mPFRM@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z0TLB2W3n37mPFRM@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PEPF000001B9.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: c70371bb-72d6-4a04-a51b-08dd0eb2d673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEVxUUhqQ0R2QjJrbWNBaEdmdWdUVFpkaTl1QjZyYmx0OTV2T3lxK1hOQ25i?=
 =?utf-8?B?V0hzby9WaDdLZ3BBdFIyTy9OZXpDdHNBdG9BTUwxcVJTS3hiOVNialZjdGRp?=
 =?utf-8?B?MzBNaEU1N2F4WHUxVlpmR1JiQjBJakQyWTliZlBxbC8vREZ6K2RQRERvTmhq?=
 =?utf-8?B?ckgzRVNKeThkbXQ5citXc0hLTXZHVWtNRkVqam1uZVVpY2tpMmYvd1RlMXdR?=
 =?utf-8?B?bXA0TXdXczZ2NHVTaFdSbUxTYmZNWkp6WkxXVWw1QlV5eGFNNHdvdkZQSzlP?=
 =?utf-8?B?d3RhdmhPa1AwRitsNFQ3QnQ3eERVOVdJQ1g2Y0xHakN4K0V6b2NJY2s0RlpV?=
 =?utf-8?B?MFFDSUwrVE9scGNqVFNaV2hubDlJMlNPeVVuN2E1cTlaNGszcG9HUGhFRExo?=
 =?utf-8?B?eFJLa0hqNVFzZU5RclF0RXRTbzZPYkM5VHk3TGtqb3M2V0RPSGg2TDRLZklJ?=
 =?utf-8?B?SzhwdFYxbjZHWlNma2owMUVEa2c2cElTeFlmSXBiTHQyVmVoTS9mQSs4RW1W?=
 =?utf-8?B?bjFiQThxNWdiSXpMd2tsZzVwQ2xVMEVwQy9WbGoyQnU0emRjcGJwRDgwcHVO?=
 =?utf-8?B?Sk44eUVVdHBCc3pXSmpGckpwNlVVZG95WDBoenoxK0phYW9IN1A4QklyRmll?=
 =?utf-8?B?bTFTNUdrbWNlajRwUWs0UEpUTnhhNDJ3Rys2dGlaZkRibGtZV2wxeXozNXRh?=
 =?utf-8?B?ckhUN1FMWEovd1F2MjM3QUI1ZTIwTUsxN0hDWm50QnE5OTdUZm9ldkt4QzR0?=
 =?utf-8?B?WGNzL1FHYWlNN0l6TTBGb0lET2d1QnhMWHBMWXM1YkFHTmJNcTVmYm1nWThv?=
 =?utf-8?B?QnFmcmFML3FKUzRGNnZwVWVmWW9nZXVaMm9uK0dNSEpCNERDRG5qbHFQVmd0?=
 =?utf-8?B?eGN2d1pKbmVNVUwrNk82dHBEOUplbHlmeDNOSlJRbTZuQW5RekNDd2dqWE9h?=
 =?utf-8?B?ZFhYWGhxbWVTNkZwaDNQdHZ3dzlyMzZsTHcrb243VjJ4azNkMm9RKzZVMkhz?=
 =?utf-8?B?aGRTS2c1TFpGWGM3a2cwM0w1SEdESzF2Z2YyYm92aUgramFONnBTempoTmc0?=
 =?utf-8?B?WFFoYmd0dXpibnFnejd1dEJ1czN0RnN1cjRDSUtLV08wYkROSkpna3FjdUhH?=
 =?utf-8?B?T0l1UVFMellPb3RIa0RhQ1FUUUdsMUIvT0NFRXMrbll4aThuYW54ZUFOcmZ6?=
 =?utf-8?B?VjhSUDhlOXMwY3VYN3VRUFR3Y3ZzdXovOVhQYVplNFYrVWY2aVpacGxUK3FX?=
 =?utf-8?B?eXBtSW1rUjNucitiNnB3UTZud1NwalVmdGpseHQwa1krdkdENFFEazZQeVk0?=
 =?utf-8?B?L1ZqZnZYNmg2ZkxDbEVkZk03R2JERnJrRXZ2cG1YV0dhZHgyU3RRaGNvdWQz?=
 =?utf-8?B?RGQzM2c2SCsxTVpSL09CdW9TVHA1S2xIUHZZZzJIekwxUm1nWVczb2FkeWEz?=
 =?utf-8?B?blprTWZqdE5lbjAwN2hMakUxVVpzTFMrMzNFODF0QXY0TkNDZi9aK1lQeEVJ?=
 =?utf-8?B?eWRzNFQ2b1k4NUsweEl3aFpnY1VmZFJWTmxoQUEzcTY5eXNSZHNPTFg0TjY3?=
 =?utf-8?B?aEg4NXFiQ0ROeWJvVTVlSmZ0djgvK043TFk2ZS95NXJiNFpGQ0w4alpzcS9L?=
 =?utf-8?B?U0dIdytJNFUvSUxRMU8zYzdYazYycU03eGcwbjJhUnk1ajA1blU4VkxEUmlj?=
 =?utf-8?B?Y2tESkE5YXFJOHU3bUJCcWpnSXBFN3d0V3pFUk11ZHNoNkhXanZ5cHM1bjFn?=
 =?utf-8?Q?kBzx7Kffh8FkL1GcgQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmZ0dVgwVUJRYzNkNURFNi91dklzc3ZncEU3YnNtcllZQzlndzE1NEdQYkRw?=
 =?utf-8?B?SmVaaW13ME81L0NKRFg4SEFpUk83L0E5RCtldjhIcFFheXp2N3lQblAzZVJX?=
 =?utf-8?B?alEzRGlpZEN1eTRFZjNLL1BKWGhyVmNqK2JyTmgzWW5BckdmZFBNMy9WV0N4?=
 =?utf-8?B?U0ZSaFE4QmxpU2VzWW9xQ0p1QTBNVnZtYis4R3lIcjlqcGk0NE80TTh2bVI2?=
 =?utf-8?B?MUZhUW0xY0hZdVNzajJ0TU41NWVwaFNiSDg5bEl2SmRjV2lzOGFOZ2dWT01D?=
 =?utf-8?B?b3F2NzZ6VWYyRFJ1a2FsVGtYQ0w2VkhUWHJxYkp4Si9QMVFVQ2FpZUhlTFBu?=
 =?utf-8?B?dUVzQUxFRVR4ZzRLeUZMWnoway9MRU5XdkJjaE9zMFpQSW9kMnJKeVV2MmxF?=
 =?utf-8?B?ZEVPZituUTYrVWV1WG9OM0c5VGk3dFlGc29vSkhINmF2NDI0SU8ranhxMzJo?=
 =?utf-8?B?Z0t0cnhtSVFXUXA5WDRNL2ZDZVo5bTZvaWR4SGR4bjQ2RVloUGdiVWNtNWdl?=
 =?utf-8?B?UnRXVkkwTHRweW10ZzhuV0FsMFFxT1d1QmYwU3Z4VEJlZ09yd2kxSmZhSEx5?=
 =?utf-8?B?eHc3WmU5T3FxVjYvSFhvdERMZkF3TnpHWGRSNnBLRmJuUW16YjJodUh6M0NI?=
 =?utf-8?B?UWNRU3NhVGNFUUI5U1ZQZ1h5ZDYwdlVHNk5YTmZ3S3RPWDRQUnpuSmtpam13?=
 =?utf-8?B?Q3BDR093cU1yTXFVRE51dE9yOVU3SnZqSStIbE5HRy92MVdyU1lpSk9MZkND?=
 =?utf-8?B?K09uTlVyT3dDOHJQT0JBMksybEU3TFF4elJtbUFBL2x5aWZ3bHlRQngrSm1L?=
 =?utf-8?B?Rnh1alJ4SE80dy9oYTg1bnlrd0JQRk5pNVBjdkRkemlsK0lML2JNWGpOZEpu?=
 =?utf-8?B?eDcvN0c5dTlRcXRKV3FOZVdhbDM4YUVBL2liT2kzbHdZSzRuT2xMc0NSY2o1?=
 =?utf-8?B?MnJweFhuMnVJNFlsVVVxV21tS3lSTU9jUFNLOFIzSy9XQ1RmL0QvaExBMXlX?=
 =?utf-8?B?K3RlTFNqSnExN3JySXFBeTFvZUtCeVFTT1o1em1jN2NyRVQ0YVpFcGY2Yita?=
 =?utf-8?B?aXA4WEthNzdUL1QwZmpsMHB3cHFGTHBQSEJicjZyOUdQWk9jcC94cjZCUkN0?=
 =?utf-8?B?UklSd2czd1E1c2twK2V3TXpLbG9PSmQvdXJaVWI3dko5YnQ3eFNnTHM2QVV3?=
 =?utf-8?B?NUVyQnNQZFBtaXQ1aCtaN0VCMWJicXYzR0k4TitGMExFU0JjTTc2di83UEYx?=
 =?utf-8?B?TnVMVjNNMUgvcjVuNEVYc1E5SEJIUzI3eFNEZXovWWsxdkdSTFluZXF2NDY1?=
 =?utf-8?B?endsWUtmeHNTY1BYc1hmQTk4Mkl2bkdOeFZ0M3BLNTNtdjRJL3JKMldhb2ts?=
 =?utf-8?B?ZWFqbFBLcE0xaTVJZ3ZOcGlkbEk1aUwva1gyVFdPVGdGL0R2ejhvU0krZnRh?=
 =?utf-8?B?UG5nZVdkWVNRbUwxYktZSlV5ZXJBemdoLzlrYjNZU21ZNFo1NjNYakR1RzE5?=
 =?utf-8?B?eTZWc2xiRnROWG5ZYW01TFJPbWM0MXpKTlR5b2ZXRzU0SWI1dzdCRU1ubGZy?=
 =?utf-8?B?WDRjT2FSQUs2dFhOZFp4Qzk5RlRDMmFacGUwdUhJSThsMFF2SDFveUVEcnNu?=
 =?utf-8?B?Zmt1d1BoclRMS2psdWdxNGdpS3JMY0w0NWRtRzBnRWg1Y21XNDlXT3BPbDB3?=
 =?utf-8?B?WWdWNUkwYkxQcXFobForcGhjVGhXZWlvS2JhbVJpNzhnOW9IeVp4Q3F1U3lR?=
 =?utf-8?B?am90WVJ5aUhRN0YzL3dPMTJBU3VXYk9QbkpsZ0ZMSDRvSEp1Y01lSzV0Rkcw?=
 =?utf-8?B?VVlPV0ZCMmk2ZVpUdTB6TnNMdWJ2ckhvSndPbHBjdHRFUUltZU5uK3VDODFk?=
 =?utf-8?B?Ynk0U0FwMUlkK1VMZUd4RUJlM2dldkVjaDhpS29SZlhSTkxiTTdwWW5QbzY5?=
 =?utf-8?B?NjBERGRtUHJVbXZiK25yTVJ0NWJPV1F1ZStudlJId2pIcWw0UXFRdWNZNUpm?=
 =?utf-8?B?Y1Z0UHVZcTFraVlxS2lMRVJXak9Xa205SFJvb05DSXYyOGQ2Vm94Z0FyVVdZ?=
 =?utf-8?B?a1JvT3pTeTdIWmEvZDdXZmE3dlNEZVBuV0RvWkNuaHNUaHEzdzFRbGZIblRK?=
 =?utf-8?Q?sDMIqLShPc7qqw4Xy4HCsFsQS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c70371bb-72d6-4a04-a51b-08dd0eb2d673
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 07:12:22.5377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSpykFRbkk1R5OidhBUban69h2NXlc066d3ec9qjb9wuRETRa+D0ht1fRYPmI+7AkWZo+5dLWnbSMtIxRMLrPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7485
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

Hi Lucas

On 11/26/2024 12:37 AM, Umesh Nerlige Ramappa wrote:
> On Mon, Sep 02, 2024 at 10:01:11PM -0500, Lucas De Marchi wrote:
>> On Mon, Sep 02, 2024 at 11:29:05AM GMT, Aravind Iddamsetty wrote:
>>>
>>> On 30/08/24 03:40, Belgaumkar, Vinay wrote:
>>>>
>>>> On 8/28/2024 12:33 PM, Lucas De Marchi wrote:
>>>>> On Tue, Aug 27, 2024 at 09:41:04AM GMT, Vinay Belgaumkar wrote:
>>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>>> index b6fbe4988f2e..de6f39db618c 100644
>>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>>> @@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
>>>>>>     __u64 reserved[2];
>>>>>> };
>>>>>>
>>>>>> +/**
>>>>>> + * DOC: XE PMU event config IDs
>>>>>> + *
>>>>>> + * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed 
>>>>>> in xe_drm.h
>>>>>> + * in 'struct perf_event_attr' as part of perf_event_open syscall 
>>>>>> to read a
>>>>>> + * particular event.
>>>>>> + *
>>>>>> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>>>>>> + *
>>>>>> + * .. code-block:: C
>>>>>> + *
>>>>>> + *    struct perf_event_attr attr;
>>>>>> + *    long long count;
>>>>>> + *    int cpu = 0;
>>>>>> + *    int fd;
>>>>>> + *
>>>>>> + *    memset(&attr, 0, sizeof(struct perf_event_attr));
>>>>>> + *    attr.type = type; // eg: /sys/bus/event_source/devices/ 
>>>>>> xe_0000_56_00.0/type
>>>>>> + *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>>>>>> + *    attr.use_clockid = 1;
>>>>>> + *    attr.clockid = CLOCK_MONOTONIC;
>>>>>> + *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>>>>>> + *
>>>>>> + *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>>>>> + */
>>>>>> +
>>>>>> +/*
>>>>>> + * Top bits of every counter are GT id.
>>>>>> + */
>>>>>> +#define __XE_PMU_GT_SHIFT (56)
>>>>>> +
>>>>>> +#define ___XE_PMU_OTHER(gt, x) \
>>>>>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>>>> +
>>>>>
>>>>> The perf uapi is self-describing and users should look up on sysfs 
>>>>> what
>>>>> to use. Example for i915 since it's what I'm currently working on:
>>>>>
>>>>>     $ cat /sys/bus/event_source/devices/i915/events/actual-frequency
>>>>>     config=0x100000
>>>>>     $ cat /sys/bus/event_source/devices/i915/events/actual- 
>>>>> frequency.unit
>>>>>     M
>>>>>
>>>>> `perf list` works fine and doesn't know anything about this xe-only
>>>>> header. Why would we add anything here rather than encourage other 
>>>>> users
>>>>> to read from the generic interface?
>>>>
>>>> Agree. perf list | grep rc6 is sufficient.
>>>
>>> This was previously asked by Rodrigo https:// 
>>> patchwork.freedesktop.org/patch/555013/?series=119504&rev=5
>>>
>>> so what changed from then to now.
>>
>> 2 different things. That rev you are pointing out had:
>>
>> include/uapi/drm/xe_drm.h            |  16 +
>>
>> so the uapi was being changed without proper doc. Rodrigo asked for the
>> documentation to be added, because that is the proper way to add things
>> to the uapi header.
>>
>> In this review what I noticed though is that the change shouldn't be
>> there in the first place. We shouldn't change anything in the drm/xe
>> UAPI header because this is actually an UAPI (via sysfs) coming from
>> perf.
> 
> @Lucas,
> 
> Agree. This is carried over from i915, where other constraints may have 
> led to adding some header bits for gt.
> 
> I want to mention that now there are 2 events per engine - ticks (actual 
> engine run ticks) and total_ticks (total ticks that the engine was 
> alloted) which enable us to take a ratio of deltas to calculate 
> utilization at the engine level. If we add the config for each possible 
> combination of gt and vf_id, we would have
> 
> num_engines * 2 * num_gts * num_vfs
> 
> where num_vfs should (ideally) be the number of vfs provisioned.

Here it will be max_vfs instead of provisioned num_vfs. Pmu event 
attributes are added on pmu_register.

num_engines * 2 * num_gts * max_vfs

Did not find a way to add/remove events dynamically.

Thanks
Riana

> 
> Do you think that's fine?
> 
> Thanks,
> Umesh
> 
>>
>> Lucas De Marchi
>>
>>
>>>
>>> Thanks,
>>> Aravind.
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Vinay.
>>>>
>>>>>
>>>>> Lucas De Marchi

