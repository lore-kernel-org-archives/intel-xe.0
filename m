Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F0ACF45DB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 01:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A463910E103;
	Tue, 13 Jan 2026 01:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJv5rGFo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C1110E103
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 01:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768266101; x=1799802101;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Sr3qwyI3F9XzmTalgk7+zkMwLQ0nPd0SCL0tjcHvFjU=;
 b=SJv5rGFoK8LGUrKrUYDg+zOYDTREoJSSXbuZcnCb72N5GeB+B4hHMDvj
 pwVHRpR4B02DLEoH9POghyo0qO4ub64heKjTEoTb6N8yPheU+PoKUXPGf
 6T7G379+jPwH/2FjEjrlbtnmEbqFB7OTCsLhypQwxAao2uh2VR3iQ5TFZ
 wEUGlYN98EkBiTQCruPHI6Zn3Ne86Mmjh02jRFSjqwtd2cmw8SU2xbxKe
 qNmzLH8BLrURCBEwJDQ6E8aVK9dePI1O/B8mkn+5TLFmk4GANdgH8jCks
 peXJtX1OqY8WbDij5q1w9U1qz6D8a/Ro979OK1sFj/OqhgkXcVpZ90eC+ Q==;
X-CSE-ConnectionGUID: iGSCctJwSYquDBa7TcVg3w==
X-CSE-MsgGUID: TprnGr1ZSFugDOc+WK+1Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73178964"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="73178964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 17:01:40 -0800
X-CSE-ConnectionGUID: D734oWSBQ7GJyAt3X0K1EA==
X-CSE-MsgGUID: +Kr+3plnRgyuGMQbkXtexg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 17:01:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 17:01:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 17:01:40 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 17:01:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/2bjPK7vk++hdN9bayrnklIt1inT6tNIVqRjUd4fl2Tm4r1N39G79h7n8gXgZnzEbsAoWvRQ/50iHovr2GjLCZNyAy8to7u1FuWPMioiTogXa5JUz48+3/OLCjtPk/Ju+OkqzxfBIQF2mGDZ36xlRjrExcLiBvZudjm7f9GSO3wDk6T5N1C0Y/aAZNhp6OBFQqZdEDf3PXj5OkYcU5szg0pbzsL/Md7Gz1Wk01Bvwm2A8Bc1xrlBkKyrhFbNSzhL4r+o7kgK9e7cQ5t56IKcAsDerrOTnaz0pKdLoxYgnnw9v8dJejy3k5ahnhfSmHO0lzaCjv/cId8VtLwVYB9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sr3qwyI3F9XzmTalgk7+zkMwLQ0nPd0SCL0tjcHvFjU=;
 b=JFYOW4pZ/HKMKMWWBlS4oQK4rpSSGPBLMwQ9fL973LNqt3AClS34Ao5KoXo0iiKapz/beQv4jQY7B215O17NVas9C+PbPWqN4TNeg5HByaqPLAHxen43D/rB7Q4mct/KucPggMBGahfx7sOcVXRbHO7uA5+pptFbTAXwMmcUZ30Wg5ZAY/ja4oiSwjIG5/97Z19/jBNlJAWSudDt43HsXT+XcDfv7+DwOt3nUviXCi5hnzOcSQM2n5uIElBagftNfoF1sl5+lLFsv2NB8vYN9uUCzn9Rj1Cjq4YrQzRzQC4s4oWAkF9WVRtV2mMkvRYH3iw16WByPOetyCUOqEJAPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Tue, 13 Jan 2026 01:01:27 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 01:01:27 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v3 03/11] drm/xe: Add xe_device_asid_to_vm helper
Thread-Topic: [PATCH v3 03/11] drm/xe: Add xe_device_asid_to_vm helper
Thread-Index: AQHchBsRm7JLCZeKEUuxg1+xkCxVcLVPSBAA
Date: Tue, 13 Jan 2026 01:01:27 +0000
Message-ID: <5385a9ad207c537ad15e47af735bd714fdae78cd.camel@intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
 <20260112232730.3347414-4-matthew.brost@intel.com>
In-Reply-To: <20260112232730.3347414-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM6PR11MB4675:EE_
x-ms-office365-filtering-correlation-id: 55ea2573-054b-426e-b55c-08de523f4801
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZitycUFudklFV09qOFp0VkdrWHZ0MVhGZGNQUjlwc1N2NjVDYS9CSk9xb2Ey?=
 =?utf-8?B?R0hIVTlLT2dZNE5UYStYNVFTWldyeG5YWC94Y3BBWmVybU81V0NOczEyTmNE?=
 =?utf-8?B?bGRobnV3Q3BhQUR1MTZuVktiVFhoVHd4T045VUFtNGZyOXovMzlNaTRYNXpr?=
 =?utf-8?B?UXBDSXB3eHhnck5rcHF2azZlVmRlN0lub3R2L0F3NHdOajJuWk5Fa2JGN2dX?=
 =?utf-8?B?KzBqOUIySXZhekRUMm5DMXdXYkUzUllXZndBOGtua1I1cDZEOThjMmc5TWhS?=
 =?utf-8?B?bHo5d3lCcHBsTmgweTk2ZDRkNjBvNnh0Z1Vua1FpcHNxWEFrL1JsaC81WWlP?=
 =?utf-8?B?MnBDQU5zcjRnanV1Sy90Um9TZUsyalM4QWNwVU5GcWRuUmRuMUxuWFpVZ3Jx?=
 =?utf-8?B?NGFzQytTMy8vdGJZL0ZTT2xmSjNuRjlpL1N5MDA2Z2hYcnhZcEhCQU1ERDd0?=
 =?utf-8?B?U0V6NnpDSTU4d1NTaEVONGNMVUNJMTZEQnRUSTc0ZFg3QzE3ZTBFR1lsOGZ3?=
 =?utf-8?B?cmppQTNiTTY2cVk3empSS1JrcXZpbllrY3FkdDZyOUhZRXErVGVMajRvRU8z?=
 =?utf-8?B?ODdXVVZ2bEhiS2RQdmJsVG1tUDljWXYrNldjNkRreVdaUE5mNk1sL0RPMTVz?=
 =?utf-8?B?aTdkbDNENXJuOTVCdG5jc1RGSHF6QlNiRHR2OVIwMk1tejRFYThmb29iVlBk?=
 =?utf-8?B?Q2J2WU5ZQ0owQm9GNGJPU1M3c0I1S3YrcEJZaWdUdXBDTG5uSjQwZDE4SXB3?=
 =?utf-8?B?NFRyay9uNHo4RHJ0ak82Nm5XUjU4RkM0QWc5QnVyRUVsaXFpSWk2bWMwbDZs?=
 =?utf-8?B?WGpVUFFYVDdzVXhFME5LOUphZElaN0hGTlFWOEY4ZTdsbXJqc05tdFlUeDJU?=
 =?utf-8?B?aUgweUdJMXZGZDgwL1ZSOFBoUVNkb1pLN3gyQVNjcVlVajVQeDdSbUU3a0g5?=
 =?utf-8?B?MHBNNDh3WEJ1bE1ENytWZVIrUWtRQ0taTGdQNVhYa0xXamxZbXRQT2ZPckdG?=
 =?utf-8?B?OGNwM08rdDhqcCtIcFYyNnVvQ3lFTC9GSEZ0S2RtMU1CK1FGWjF0U0xxbktn?=
 =?utf-8?B?YW1nYzlFWWdzVFhDY2kwSlJLNGttTjU2SkdHMFpETktYWWl6bWxvMFlTTVcz?=
 =?utf-8?B?ellIUk0xSlFNUVpNTnRPZ2lpOXpKd09ZOTNtQnFvV2ttUU83T2R3R0NUUFFm?=
 =?utf-8?B?MThNM2gyNDJjRnRzN3JTWmRRb1l0RDFISHhwOHhEcVh0RTVNVEplOGl1dkQw?=
 =?utf-8?B?T3BPWktjeURoWHlKSjV1UjdCa2U2bTN3cUNCUzF4ckUrWGluYkZ5OUdEeDB1?=
 =?utf-8?B?a1lMSEpkeTdydVBDS1kxS2pPZTlPZ2J0MCt6YmVZa0VCTWtheng2VVphYlZB?=
 =?utf-8?B?REhaaDZxZ0QzR0pHU3FMSGczNm01M01ONVFmcmdwR2hGTGtIdzlydUpLZG1Y?=
 =?utf-8?B?TVpMK0hZT05lTENQUzkwSnd5NE9YRUdXVjBxRlFtOVRaMXU2b0srdHppd0lj?=
 =?utf-8?B?VlVkRDFCeTlqeWRoN2ZyK1FOUG9RMU8zVytES2s3bExMWTRuRHMzRHRJMkZ5?=
 =?utf-8?B?QlBPa1NEcXVJcUpMSC9Ca1Z1VE9iU3h4MEI4YW1NdzZQSmtNUGxvR0dhVFVL?=
 =?utf-8?B?N0x3SE5NNDQ5bVUwWDIrVkNOam9HazFiRVV3N2taN1BPUXpPU2s2Zm5pYnds?=
 =?utf-8?B?dU4zTkZlYU1tRWlyVFg2TXRKcGhVNHNqYVFSeW54Y01Ja2hzYjV6bFV0NlIv?=
 =?utf-8?B?OHA3ZnF2V2EzVnJwUTl6LzRFeWVZbG5SMHh2TTBGT29UbGhWTGR1aFlLV0Fx?=
 =?utf-8?B?Q0VnZzkxbzZXd0h5U0UvV1dqTG04TkR0UHgxUUJMZ1lMRVFJb0wvZFdQNDA5?=
 =?utf-8?B?QTdIV3F0MHAxS3k3YVRoZDMwNldCK3hMNU1rM1A4WHVBUmNUSGY5NkZEMnk0?=
 =?utf-8?B?K20ycFAzMkJlUkRZQlBFUGxrRWxFTjFORTlSSFh1b0IrL0Z2NkppUUxwWG1h?=
 =?utf-8?B?VTdhSytKWFdySVUxNHViN3JKaE9rbEhscG55WU9pdCtHZ2l5V2ZpcWhrVWxx?=
 =?utf-8?Q?jfWWqh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTRuUXA2c1M5T2ZBdHFzOUpBT1E5dG5BUDBrTVIvRFR4UnBZVVJTeVAxeDlr?=
 =?utf-8?B?MDNhU3ZHZ3Bpb0l4UWJmVDh1SW5YQldMOFAwQ1IxYVZMQXpaYzA1OGp5T2Fx?=
 =?utf-8?B?dWVrbnArSE5zbUZIdUVxQWNsQjJpM2lTUHo3ajVOVGQrVGpMeFBtWExyMkMr?=
 =?utf-8?B?VDY3dFlXUERETkp6WGNmTFRsUm53ZmVOZ3hZTE1ybC92a3ovanJZbmZpVGU3?=
 =?utf-8?B?S25iWnpLQ0VHREpHNFBLZW5veTBSbkU3Sk1MR0RjSVZwOGppbHVRV016TW1a?=
 =?utf-8?B?dkdLVUU1cjh2L08zWVhkeWswTlcvWi9FUXVlV0Q4ZmRxSktiQms2M3hISzdL?=
 =?utf-8?B?TUd0elJNQmJrdEhRc1BqM05qK2gwcGxVSDlrbG5sSjg0TTRXZUFZdnV4bTBV?=
 =?utf-8?B?cy83WHFvR05URUJpVmQ3OWU2TmhKWm5jK2xpVm9DTUpJbnR0SnNPQWdlbDdh?=
 =?utf-8?B?ZXhBUmNCWDgySEFmZHRubkY4a2xTQjhyVDM3cXAvVmJqc3gyN3hCT2RabnNI?=
 =?utf-8?B?YTVPTldoYmRBZEFmSWdiYlh6RnhPbkV1bVU1Yjh5TDFjR1loR2xBbDR2RGhO?=
 =?utf-8?B?QkxTS3daMEZmcDF5VE5Nb2pwTDdtWmZnYUhiNHNGVTV4WWE3WWp4ZHprYks5?=
 =?utf-8?B?WjVXQXRETzRsK2pHV1hGUTZrZ1lJcFFwWnFheExmT280R3lkRmJWMlI5Y3FG?=
 =?utf-8?B?RkJjeEVVVWFTQ2hJQ3hPeTdJM3NBaktiVTNoK1JpWGhMQksrNmFCTnNScmE3?=
 =?utf-8?B?UmV1MHhrNjVlRmdhd25oM2M1VXhsL0Jxd3BsUXNsajF3U3R3a3hzUlBIN0NJ?=
 =?utf-8?B?UkVCZVh3Zy9mQXpMNVVDeFlxZU55N3lYQ214MncvQjZ6NVM3ak90QWh5dWRm?=
 =?utf-8?B?OTEzNnQwbnBVOHhLK1J4ZCtkc2RvTmhaVXpuZlJCWDV2V2pHU3JMcXRwZkJt?=
 =?utf-8?B?c0I1VTY0UXpUaGgzNUc4SkdhSElXR0ZyTnFSZzIyVUN4OUlNZmE1QkJwaFVP?=
 =?utf-8?B?QzdYZHBrY1JhTVJEeEVIMWhIdE0rMnBIY3V0bm1Wc0ZvSXhFTUZOTng2OWtw?=
 =?utf-8?B?YlBFSXdXMys4NEpBSDBIemRnR0MwRUwxdS9LZlVaamRiS3BCYnFpVksvR25a?=
 =?utf-8?B?K09kRU96Zmo0aEtBNzNQWmhUQWxlcVlxUjhtQTdENGp2L3lBbFRYS1VyaWxr?=
 =?utf-8?B?NzdlemdIdVAzUVA5NHRjQVRHYU5LOWxYUDk0ZVVKZEZDYW9GTXRrYnpIN1Nn?=
 =?utf-8?B?Q3ZONzUyYzVZTVJLUXhqMXZBczBveVViZUhFcXByZ0dOMW04WnZFK01CSkpn?=
 =?utf-8?B?ME9yMlVrNGE0Rmw5d3hOa2ZnSWJlb1NMS25tT2pUQjh6WlBDaFFkektObHMy?=
 =?utf-8?B?UHRwcDRwUWRia2x4OTNpdWJ6d0Y1L3ZqY2xUN3VPelVScWF2YnVEN3RQUVE2?=
 =?utf-8?B?Qi9lMXhTOThJRFpKNTVPcGZDZFlTYkJiMUQ1RlZOWVVwcXFDZzVhMlZ2QXhH?=
 =?utf-8?B?QVBLVE5sWk8weWdDRGlJZEJtM0RtZVd3cGE4WFR0V0FjWmJDU3NWNE5kdUxl?=
 =?utf-8?B?WnBjS3YzMGN1KzVPY2dWcnovMlB6WHAyeUN0NDNLZFk0am92azFPaVorQmVs?=
 =?utf-8?B?V2hzTHdhUStaWi9xTWk5UVZTWDZpdjFxRE1YbTJLM2srTHlLQXB2OEtVNjF2?=
 =?utf-8?B?RmRIY254ODg4YjJ4Zzhkc3JnM1k4cW1GMm9LbkdXbDBhMWtsZ1k5ZHpKU0Ns?=
 =?utf-8?B?eDFSbjVDLzdOMlVpMmxzNFd1V2Z6Zi85YlV6MG5TcWZTOFp4cUJSdGZ6L1pj?=
 =?utf-8?B?S1pWT082dUdVbkNaL3U3UWIycXREc29Pdmw0ODFLYTIxS0RMNFlVMzJINTVP?=
 =?utf-8?B?ODJaeXE1YjRmWWI2YnQ4bnZYbTNsaTdENENQc29YY3kvR1o3TkNKV1BXYmR4?=
 =?utf-8?B?UXpnREFIdzY1WU02UVRCZFFWT2J6V2U2SVFxUXRFOFc5L3YzbVpTUTFVaDhR?=
 =?utf-8?B?dU9sdHNQck9nQWs0L2c4RllZVXlSTzhhMkdsQm1CMkgxeFJyME1KcVN6MFAy?=
 =?utf-8?B?NWRpZStZTjhYNkxpR3dIYmw3amI3UVRyVU5NM1M1N0lVbVZyaG13MmZsdmdD?=
 =?utf-8?B?N0dESlFDalgwZnMwZzJwY2pMVjhuanNOUDlHVlZhYUN5Qyt4dm5yOHU2UWZT?=
 =?utf-8?B?NXZjQmhTYnZ4RUZwUzAxMHNwS2E3NWdIVHB0SFVqbSt2RllZV1RUcmhQcjBG?=
 =?utf-8?B?Y0ZSOXUvVzdtaDRFeHVjZXI5aVFETEFXZFM2WS9meHJvY2JKUlRlR2JTRWNT?=
 =?utf-8?B?eDRFQUxhQWRIL213cDYwa0t3TVd4dGxFOE5lYlFOVDJNQWcrSFZnNnlkcjVD?=
 =?utf-8?Q?PT+XcP/AjD6yNKHY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13920A564F9CE346BB1483A287FA5A6A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ea2573-054b-426e-b55c-08de523f4801
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 01:01:27.7345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7EebmDF2x9k2GGwYEUK6yFZAK5n/k2waqG/KUnnpCSuoJp0BTHjc4HbfXcGjFxc6u8ccdmmxcVjS0acV5VGsrNrYXQmsvsXgJEZouGPPHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
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

T24gTW9uLCAyMDI2LTAxLTEyIGF0IDE1OjI3IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBJbnRyb2R1Y2UgdGhlIHhlX2RldmljZV9hc2lkX3RvX3ZtIGhlbHBlciwgd2hpY2ggY2FuIGJl
IHVzZWQNCj4gdGhyb3VnaG91dA0KPiB0aGUgZHJpdmVyIHRvIHJlc29sdmUgdGhlIFZNIGZyb20g
YSBnaXZlbiBBU0lELg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhl
dy5icm9zdEBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBNYXR0IEF0d29vZCA8bWF0dGhldy5z
LmF0d29vZEBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlLmggfMKgIDQgKysrKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Uu
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiBpbmRleCBlNDAwYWQ1Yzlm
OWUuLjQ0NWNmNmRhOWRjNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiBAQCAtMTQx
NywzICsxNDE3LDI4IEBAIGNvbnN0IGNoYXIgKnhlX3dlZGdlZF9tb2RlX3RvX3N0cmluZyhlbnVt
DQo+IHhlX3dlZGdlZF9tb2RlIG1vZGUpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuICI8aW52YWxpZD4iOw0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoH0NCj4gKw0K
PiArLyoqDQo+ICsgKiB4ZV9kZXZpY2VfYXNpZF90b192bSgpIC0gRmluZCBWTSBmcm9tIEFTSUQN
Cj4gKyAqIEB4ZTogdGhlICZ4ZV9kZXZpY2UNCj4gKyAqIEBhc2lkOiBBZGRyZXNzIHNwYWNlIElE
DQo+ICsgKg0KPiArICogRmluZCBhIFZNIGZyb20gQVNJRCBhbmQgdGFrZSBhIHJlZmVyZW5jZSB0
byBWTSB3aGljaCBjYWxsZXIgbXVzdA0KPiBkcm9wLg0KPiArICogUmVjbGFpbSBzYWZlLg0KPiAr
ICoNCj4gKyAqIFJldHVybjogVk0gb24gc3VjY2VzcywgRVJSX1BUUiBvbiBmYWlsdXJlDQo+ICsg
Ki8NCj4gK3N0cnVjdCB4ZV92bSAqeGVfZGV2aWNlX2FzaWRfdG9fdm0oc3RydWN0IHhlX2Rldmlj
ZSAqeGUsIHUzMiBhc2lkKQ0KPiArew0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfdm0gKnZt
Ow0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoGRvd25fcmVhZCgmeGUtPnVzbS5sb2NrKTsNCj4gK8Kg
wqDCoMKgwqDCoMKgdm0gPSB4YV9sb2FkKCZ4ZS0+dXNtLmFzaWRfdG9fdm0sIGFzaWQpOw0KPiAr
wqDCoMKgwqDCoMKgwqBpZiAodm0pDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV92bV9nZXQodm0pOw0KPiArwqDCoMKgwqDCoMKgwqBlbHNlDQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB2bSA9IEVSUl9QVFIoLUVJTlZBTCk7DQo+ICvCoMKgwqDCoMKgwqDCoHVw
X3JlYWQoJnhlLT51c20ubG9jayk7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHZtOw0K
PiArfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+IGluZGV4IDM3NDAxNDM3OTBkYi4uMTBk
MDRjMzI0MjU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+IEBAIC02LDYgKzYsOCBA
QA0KPiDCoCNpZm5kZWYgX1hFX0RFVklDRV9IXw0KPiDCoCNkZWZpbmUgX1hFX0RFVklDRV9IXw0K
PiDCoA0KPiArc3RydWN0IHhlX3ZtOw0KDQpDYW4geW91IG1vdmUgdGhpcyBkb3duIGJlbG93IHRo
ZSBpbmNsdWRlIHN0YXRlbWVudHMgYmVsb3c/DQoNCk90aGVyd2lzZToNClJldmlld2VkLWJ5OiBT
dHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQpUaGFua3MsDQpTdHVh
cnQNCg0KPiArDQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fdXRpbC5oPg0KPiDCoA0KPiDCoCNpbmNs
dWRlICJ4ZV9kZXZpY2VfdHlwZXMuaCINCj4gQEAgLTIwNCw2ICsyMDYsOCBAQCBpbnQgeGVfaXNf
aW5qZWN0aW9uX2FjdGl2ZSh2b2lkKTsNCj4gwqANCj4gwqBib29sIHhlX2lzX3hlX2ZpbGUoY29u
c3Qgc3RydWN0IGZpbGUgKmZpbGUpOw0KPiDCoA0KPiArc3RydWN0IHhlX3ZtICp4ZV9kZXZpY2Vf
YXNpZF90b192bShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTMyIGFzaWQpOw0KPiArDQo+IMKgLyoN
Cj4gwqAgKiBPY2Nhc2lvbmFsbHkgaXQgaXMgc2VlbiB0aGF0IHRoZSBHMkggd29ya2VyIHN0YXJ0
cyBydW5uaW5nIGFmdGVyDQo+IGEgZGVsYXkgb2YgbW9yZSB0aGFuDQo+IMKgICogYSBzZWNvbmQg
ZXZlbiBhZnRlciBiZWluZyBxdWV1ZWQgYW5kIGFjdGl2YXRlZCBieSB0aGUgTGludXgNCj4gd29y
a3F1ZXVlIHN1YnN5c3RlbS4gVGhpcw0KDQo=
