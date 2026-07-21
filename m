Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A01C4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 04:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35F310E1DF;
	Tue, 21 Jul 2026 04:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R85Fz5UO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A50310E1DF;
 Tue, 21 Jul 2026 04:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784607968; x=1816143968;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i1V7eejzpTz9msRYkVa5yQbvvCIB8/Fa4Yp9FBqwnso=;
 b=R85Fz5UOCz9mAjhtqGt9XYJmgLx/eKW0ZVut8iG1o/ms80yc/g5eWpGp
 CgrBzg0uiGC5xpaikI+OAJWN2Q0+S2Ai9rgF4aW/wbdy9VmykIfzkYfUg
 9m5R9WVklkAcug4paGLnVv1cv2jwpcv9NDwpegm2bpmdI+7u5ng6RW78s
 PSgUZO7hEpmu3LvYX1QHjhZg0gR7dTBeBFSceu7+HIb/rabaFfi/+kEzE
 vNQJBcGKp+bnkIpLZO3NfuXYz4ADSoh7flgYzLgJxBI4toGBdzRmlkx4q
 VU3opkS6VestNqv6lmBnZB6QiKKaXT8+mVoJ/kjuwfb8U/PXdTaLG83Gs A==;
X-CSE-ConnectionGUID: XdM80twwQ5Cmrs55BljJ7g==
X-CSE-MsgGUID: TsSTfuiHS/GTBgL2nkyOow==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96555245"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="96555245"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 21:26:08 -0700
X-CSE-ConnectionGUID: qpgVwvVaRrSPFxjdppq1mg==
X-CSE-MsgGUID: w9P/dLEJSFqznQvNZ5mdPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="261430495"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 21:26:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 21:26:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 21:26:07 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 21:26:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pd2aDaPsDa9cGekAZ8nmrZVDALFMWExVoe0MBI8I4m7sLvweouh/NS32QbBuzpgPrWLfBNznWjv742JfPe8bhydLOM1QjAyAeGqINMt4DMVC7Qkir/+v/XS7bPa+4O4XnCB46aIXlPKks09yh+hbo0ShDV+wAK/cwzM5qg6PAdqD7gfQqkCxZUyImO8w23D4pYf0UowUBa2QCoX6b4Z3jDi8tHN0FDGnzmn1T1PECW3Vk8jwiqDGx8gwXUdiueA5t35djwL0Fx2Z+x//xe0EhumjMvrF+ABhEdT2GXx0ZtfgphKj4MxZ9s+1D2Ou8DAtyNuppprPgeMbWHqwe8Fs+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tbYJDbpTNlD9cpJC2+IL/BaCdT0CGItzS6PzUW5MNQ=;
 b=RvHPtB67IlD8hWIA+PqcBfZCKuDLRh3OYucDtkV1sWYGyKGIJfvyAoTkYQ1tQ+s5LLezlOvZc8euGpGym7Z2uIK3bN3WdyTtnqXAxj8SwnGFtDioUb3yXed31cxiAWIAQmxTLQnntCWPbOnJXa/zAsSPvmbVjNnVLC1nbVqb2XS10/gXv4LjC5Ie+RTSGktgPaaSKQ+k0Ee4XiCxDUKbKrOnhF/cAlTBoU9/CdLnnrknRJsSwlQ4RKqbkA3of1SPrnE3Dn7MUmWhZuuztHjH1ynKSR2VN/74rBdOGYzKN1uMj0NFE5dibJ8tyEotH8uiUhhyUusBvtcfeuWe/7wXig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by DS0PR11MB8071.namprd11.prod.outlook.com (2603:10b6:8:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:26:02 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 04:26:02 +0000
Message-ID: <555af174-4492-4066-9617-f9e7ca3f7100@intel.com>
Date: Tue, 21 Jul 2026 09:55:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/i915/dp: Prefer DSC over 6 bpc uncompressed
 output for HDMI sinks
To: Alexander Kaplan <alexander.kaplan@sms-medipool.de>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Imre
 Deak" <imre.deak@intel.com>, Chaitanya Kumar Borah
 <chaitanya.kumar.borah@intel.com>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260718105207.5565-1-alexander.kaplan@sms-medipool.de>
 <20260718105207.5565-2-alexander.kaplan@sms-medipool.de>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260718105207.5565-2-alexander.kaplan@sms-medipool.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0329.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::16) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|DS0PR11MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: d45dd14f-5b9e-429f-22fb-08dee6e02bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|3023799007|56012099006|5023799004|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: kIjxxIz3VEeMbCFrWtRFcCvBD9OhdjCIRIWfHlfEaMKI3bVtm1yCmWd32Vgaj0CEtKEwGo5dryNr0su5jWFMClPFEqKNVxpMkzBbZpReHKjUxEN3yVfbtXRAD+lXw0dT+hJ7+anqRRBxyGUUkhg7UcyOaowN/+MuBeJFT5L9b4nrhUWMeVHxk4mlqtMEJwzwlAD+y+7ngOCcP8I4kJi3HdKBLXqZ52Ao0ir3SxRAziA8v5G+zpqRAIZO0WMQVMdJJY4UFFf7Y8mU+XVcNGG2wwp4cr3I4P4+vfysu+yWZ+g458LURJc5LsWyuI90fapyR0Y2QAUAVSD2Mydbc6kdfapFjQY6Ql2DUv+KALa92KhwH5cwRs9a5VTyKBotArUhBAcWLNx+nT5Mv3FfoxR1udkdITXa4Wb8pDh2PiQ2YE8e8WEwZ4VHLab7t/FcYBE8+1XKxDRO8n1ZRaCfXd1gxYCUE5LIIFTucolw9EO8g/4ReMCGi756+/b3GYpzVLB4RcKk0CCJHo72DBxts+6pISGf3/1mqH9IU0n2uM3yHmwXkWPw6Iw/mx32oNZ062n9WvBWPuzt3r3fw4U1jqglwrPb6GDpHuvKHwarRRXAhH5L49ynSug2zILyBp2mXFb+4wfcOIkLvSh1jGtAHDaGOjAHqYy1QDppWGRrqslzeYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(3023799007)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzN1OCtiYStzaGJSRlBqbFZmOGZDcDBkMXRBU20yT25NQWhCREt0SmZBM1RM?=
 =?utf-8?B?cWcwSWtyQ3U0SGdvS0V6cFhoMHdzeFZNOXBFUjkwcWxIVnVlNGJVa2sxY1Nh?=
 =?utf-8?B?RWxBbkpzakg5c3JhRWd2VUVWTGpEUVRJNnk3YjAvMEdDdDVoUnNpeW8rTUpW?=
 =?utf-8?B?dlY2OFZnOUFoMFY1WERNWmpJdTVTQjQzcmIzdE52VEFvalhDR2VKSG1CSDVQ?=
 =?utf-8?B?MkZwZlhKY2dRaXE3Y1hZeS9TV1Z4UWtNRVdWdkF4bitDTGNaN0M3Q1Zjb2Ew?=
 =?utf-8?B?Wi96UVVNM0Jrd2pZR01VZ1c2REZQT0FTcE96ZUlTUytPbWNtMUMvWnhzV2hi?=
 =?utf-8?B?aE5MVUlLanJPNVh1UEZyUlM0MWVaaXBDTTFDeGh0c2tmaGRGeEZkRmpidkh4?=
 =?utf-8?B?N1AxMjZ6bEFOdDVrS043d1ZVeEllWFlEWWpRazU4YTdXc0c3UFltaHZlV2dO?=
 =?utf-8?B?blBtdFJPRVdld3FRMVdrcDN5OStiRS8vSGkxTFkrVERkZndDeW1qeHhycHVU?=
 =?utf-8?B?T3ZZRy9LcFBENWx4cTVCV09UZklhRjdISk5FM0ZuR3lnUmZiaHhZTm9BOGlG?=
 =?utf-8?B?bjZCQXN1dzBuYUVMUnkyOEhicVdVNzN5QUkyQlpFU1lCVUhrUEJkZ2VGcXVk?=
 =?utf-8?B?TGhINitCOFVwdG9JZVlGNGUzMjRHV0FiZU1MWDR3ZUZVK1dURW1YblBkRC96?=
 =?utf-8?B?cDNkdUhrcExhK01RaXltSWpLSGZiVnNySGJUK3FHdEpidnAyTU9ySTYrZ2x1?=
 =?utf-8?B?bkN1clIwb2lVeGMySmpqT2ZtRjVaRHVEaWV5R2NiSGw0TGp3T0JQTlIwMnZJ?=
 =?utf-8?B?ODZodDJXZ3lPZTBlaVRNdDN5WlEvSnFWbGVXZngvQnZCMVJxdmpTekE4MVVM?=
 =?utf-8?B?WUhCNVVLM2UzOExVTXUwU2puMlo2bXN0YXlwUTd1c0huOHdhaS9GMFdBUmxY?=
 =?utf-8?B?K1ZsUjNKSXF5Vjg5UExYaXF0a0FqREYwWkEzRHNqb1VIWG9CQ082b1hSd3Ra?=
 =?utf-8?B?L0VaeFhVWXZFNjF4TGpNa0syUkZvM2t0TThnKzZIRVNITkNMdWZIcEJZVlht?=
 =?utf-8?B?ajA1eElxT3FtUUdQUUJTMVM1aXVQVEdsWGIzR2FUa0FabXpwVmhrdC83aXJD?=
 =?utf-8?B?R295bEQ2RVlWRk9CUHRwdHlFV3E2UGZ6SlNpUHpYeGVBME1sTXZ0c2dhN3lm?=
 =?utf-8?B?RlQyZXlWUmpYSG9Nb0VBR2tCUjlrNHlLbCtBWWo2eEtOUmYxdk50cEZEa1Zm?=
 =?utf-8?B?YmIyZXhDdmdPTCtKVHhQWlpDUWpDZGNuamd6d2tkT2JsNlRyNHFNMWplbVpK?=
 =?utf-8?B?eUk0UTIzQUdWUC9qTmdNUm9EN2xLQ2xTZXFjc2wxMUhlQ3FMWWEvVmNCNTM1?=
 =?utf-8?B?VnA2dk9qVkI5OWZXM2NDRWM2NHo2OXcrQnZTSEkzVnJvSC9tajZ2aFp3b0hm?=
 =?utf-8?B?aVFuc3pyVjltaFl0OFJIck9rTEtRMlNXZWxTZndsR0x5MVFsSUFHNmNSWTRj?=
 =?utf-8?B?ZnVnRlU4UDU4c0xjR2FnRnV6TUNRaytoL3JnMHhJalFpUU9rTTZwbmdqdjN1?=
 =?utf-8?B?d295d1FWNmhaeko4VHRrdGwwc1NtcGJ5WU1Wa3YxMy9rdFJwYm9zK3pxaHFh?=
 =?utf-8?B?Vnkzamlma3djb1RXVjZYTlA4Uy9lYkpBakVMTGNaeDltRDgxbURXWEhsVnNw?=
 =?utf-8?B?elRzQzZTOG9KMi9ieWF0dmRmQjQ4L1JYbTB3enRoM3M4L1NsTGdUdlVIR0pB?=
 =?utf-8?B?dG1wZGtKcS91L0trdStLc0oxRkN2REFycGtSZFVwTFFOVW9rM21FRmZyTURn?=
 =?utf-8?B?R294WFIwR0JVWlZPYy9QR3l2VXZOUFM3UEJ5WkwrbmpaaXFPOWx1WUNqVUxs?=
 =?utf-8?B?eUl5ZkF5WlZkb0pzTzZYSG05UnNQKy8wV0wydjRORDVPbUVtZUVLUUVjVHNR?=
 =?utf-8?B?ZU50TlR5Y2haYlVkalY4TGpEN0tCZFlpVzVOM2t2b3dnUXU2bnphYVdLYzVj?=
 =?utf-8?B?L2laZmVsdDVtamtwOGhEd3dWb01RcjFoQlIvd3RqL2piQlIrZ3Q2dS9IZGFK?=
 =?utf-8?B?MWNHbERJeHZPcHVtY1Z2YmtVOVhuUmJsYmQ2enhxeFlhTG03WVhjZHZJeXpz?=
 =?utf-8?B?c2cyNEZFT0c4SjFNT1JBVUR6YTB3MFdYYTYrd2lYYXZDSFBDM00yLzRVSnR6?=
 =?utf-8?B?ZEF2dXIxajBzUk5CZGhXK0pINndub0RabFVKTzdNYzh1dDNUaXR4Z0swcTM2?=
 =?utf-8?B?RllXUkNKaElEejd4RlFDdlUwNzVLQnBJVmI3VDZCN29zWTJsQnBaMUN4cmdW?=
 =?utf-8?B?RjJ0YUFoTFEwQ1l2VDc1aTdUby9FMDZiMkxoMjFRYlZQWDVLbnp3V2RkUzk2?=
 =?utf-8?Q?Tp5VftBe/Fz7HhbA=3D?=
X-Exchange-RoutingPolicyChecked: IPcLX3g77dniwGIrxsbJ9z01pSU7LKryMePBDr2JlZQMR81Rkoi4P/E0car3YsNpoOm6I5MqKo6QF5ekg+qy/OiyYaq0zUNAd5aAhEEQKF0CmOaMXBwj2IRmxAs4Whyn3cRn5Evw3JDeg9I9RLCo6a5TyrKr0aXsEHHR5PnnxGiqOac3K3FXVDITQeTZZqGKHGb1pC3g8g4oIk1DTEoNaE7qQUxJu6XVSdvat4d5Nz90otphIYf2bqcE6AyRhQDUiVvjR7yJ5GwR8FcRsOcHHG/TG+gQkP7x8nmM8w+2y1RAkTFT4qBk9jLWlNllBZ8EffSQ0lK8XC+l/KSwNfGRpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d45dd14f-5b9e-429f-22fb-08dee6e02bd1
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:26:01.9594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3r/DMnOCobAwU7PTyWBcPf0Vd1n6LOUuBtKVTvjzjvNwGduCo81kBoX/6H9DYU2R+KwoZJNubfBFPGwG0WBqExMjYC0g3txds+RS7hmDWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8071
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


On 7/18/2026 4:22 PM, Alexander Kaplan wrote:
> For modes which fit through the link uncompressed only with a 6 bpc
> pipe BPP, the link config currently selects 6 bpc with dithering even
> if the sink supports DSC.
>
> For HDMI sinks behind a DP to HDMI protocol converter this is the
> wrong preference: HDMI knows no 6 bpc transport format, so the
> converter has to expand the dithered 6 bpc stream back to 8 bpc for
> the HDMI link anyway, and DSC with an at least 8 bpc input provides
> a better output quality than that.
> Prefer DSC, following the pattern commit ba49a4643cf5 ("drm/i915/dp:
> Set min_bpp limit to 30 in HDR mode") uses for HDR: keep the
> uncompressed minimum pipe BPP at 8 bpc if the sink supports DSC,
> making the uncompressed link config fail for such modes and the mode
> fall back to DSC.
> As there, if the DSC computation fails, the mode falls back to YCbCr
> 4:2:0 where supported, or gets rejected.
>
> Besides the output quality, some converters can't even display a
> 6 bpc stream at high pixel clocks.
> Synaptics VMM PCON based DP to HDMI 2.1 adapters from two device
> families (branch device IDs SYNAq and SYNAa) output corrupted FRL
> timings for an uncompressed RGB 6 bpc 4k120 (1188 MHz) stream,
> resulting in a black screen, while the same mode works with DSC
> (12 bpc input) and 6 bpc works at lower pixel clocks.
> Windows and macOS drive 4k120 on these devices only via DSC.
>
> A lower bpc limit explicitly requested via the max bpc connector
> property is still honored.
> This keeps the current uAPI behavior (exercised by IGT kms_dither)
> and provides an escape hatch for sinks with a broken DSC
> implementation.
> DP and eDP sinks, and HDMI sinks without DSC support, are not
> affected and keep falling back to 6 bpc.
>
> Tested on PTL (xe) with the above PCONs and an LG OLED G4.
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
> ---
> v2: Apply the limit only to HDMI sinks behind a DFP
>      (intel_dp_has_hdmi_sink()), leaving DP and eDP link config
>      policy untouched, and adjust the subject accordingly. (Ankit)
>
>   drivers/gpu/drm/i915/display/intel_dp.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index b2464a3dac056..7e860f62d5554 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2671,6 +2671,20 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
>   								     crtc_state)));
>   	}
>   
> +	/*
> +	 * HDMI knows no 6 bpc transport format, and DSC with an at least
> +	 * 8 bpc input provides a better output quality than a dithered
> +	 * 6 bpc output. Prefer it for HDMI sinks, by failing the
> +	 * uncompressed link config for modes which would fit only with a
> +	 * 6 bpc pipe BPP. Honor a lower limit set via the max bpc
> +	 * connector property.
> +	 */
> +	if (!dsc && intel_dp_has_hdmi_sink(intel_dp) &&
> +	    intel_dp_supports_dsc(intel_dp, connector, crtc_state) &&
> +	    limits->pipe.max_bpp >= 24 &&
> +	    crtc_state->pipe_bpp >= 24)
> +		limits->pipe.min_bpp = max(limits->pipe.min_bpp, 24);

Agree with the change.

For HDMI sinks without DSC we keep allowing the dithered 6 bpc 
uncompressed config.
For DSC-capable HDMI sinks we skip the 6 bpc uncompressed case and let a 
real 8 bpc input be DSC-compressed instead,
giving true 8 bpc at the sink.
A lower max-bpc connector property request is still honored.

LGTM.
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +
>   	if (limits->pipe.min_bpp <= 0 ||
>   	    limits->pipe.min_bpp > limits->pipe.max_bpp) {
>   		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Invalid pipe bpp range: %d-%d\n",
