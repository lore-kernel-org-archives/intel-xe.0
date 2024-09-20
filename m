Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37D8CF9C62
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 20:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7283310E2B4;
	Fri, 20 Sep 2024 20:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biQojYLN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB01C10E2B4
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 20:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726862841; x=1758398841;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=9ZCNyjzlrehJKOcyz96haSBN13kMFFXauA8tJO3K7wo=;
 b=biQojYLNF3yTWi32m2fPFXJaOeJsjbkOxb6URsINVCskWemEwjZQBhSo
 bWeXG5aWY2ZpgZcWs++UAVdiIaikaN1xrx4MKax6YupXt67E7er3ITCiK
 YoQWp3CJVVzD/ISqTgehq+ikqTLNcMaN8MOqUwKsQ2HknTLle25cVJUNy
 i/jY6XpS9TjT84N1OLCfHU7THNpr43tzYTdJgotHVOT2UwtWZpaLPUrGf
 Z4VYI0SHnV/w8Kc6tszgCHh+r+3ciWZQpef0QPmfh7CughFZS4Xznd1wG
 qqANrPEa1DlFp4nRn1bfBM2X4g0tOEq4tdsbBzbWdqVRc5B9m89VD3Ffq w==;
X-CSE-ConnectionGUID: mSqE96AVR4qARo+T8ESe+A==
X-CSE-MsgGUID: 9SSFTrsyQ9CSlpV5zThAkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26068914"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="26068914"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 13:06:44 -0700
X-CSE-ConnectionGUID: m6dH65HBQWGFD5xFP5IgIw==
X-CSE-MsgGUID: EEAXmqv/Q/SAAgcRGO7bzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="101144695"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 13:06:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:06:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:06:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 13:06:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 13:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfOd2QP0xR+hbo5+ZKf1C+TORdesaHoHbUSQApFB6UhQkZ65wTVN6Ak3TtGyclszo7VEqDC3lyBRwGrd4RQrYx3MKDnr0o1s6D/1XTGsd7OFv7huqSGRBmANx9NmG8Sa56RHrm3TsF5lcWOfas1M7rdLmNalsKmppxk1etvz4fxRGO8xIrgAdVDFnPOosEW3I6Tf+yMC9gWeTv/C3KeY19IW4EX3v1Bw6xlgTb1hTbClic9zmyh5qODgzQfpc3pJT4Kc1fWcuo/hglXx9qgIrirhcNTqF+0fX0nzM75OL+AUd7Vp5AisyRBMKtqLvNrqejxBpTnpxd5x1dNSAIWnAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gozIah+tsg1IpLgWG0XhI1sQAAY0xb743MnEW7lL1aU=;
 b=S2z+AgXrd4FPAIG0GStXAShTeFmsBnHlVgg02anwmXGFj1DuRNvnegsp7nXJMXwzB7ZcPtm5CkwYhsQNoZAL5fXr1VDRpEyOfugcDzUeecYc04us6+RZFhxl+Ot1Mjo5IlUxsPG7Go6ozajGhdO/2GchmjgdN0RHWgqEcksBAWL6wMgnlzugh2ulUClGgED8itwqc5uuSkJXb374UzTiSPSYJs63FDhfdIvYihVeqxvKHfmWKm/sQq7its5HUzv2cKZsEynbln6O/dC0zFmtqmt9pmS6piB3GgTcQTmhsQ9j/S0qTYOxexCOig6znNEjjXhZmH5qxVF447mg8ZVNrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Fri, 20 Sep
 2024 20:06:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7982.016; Fri, 20 Sep 2024
 20:06:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240920192644.GW5091@mdroper-desk1.amr.corp.intel.com>
References: <20240920171223.64969-1-gustavo.sousa@intel.com>
 <20240920171223.64969-5-gustavo.sousa@intel.com>
 <20240920192644.GW5091@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Sep 2024 17:06:33 -0300
Message-ID: <172686279302.236428.12481256240412350726@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0255.namprd04.prod.outlook.com
 (2603:10b6:303:88::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: 1216916e-c7f7-4128-299e-08dcd9afbca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTBNQmMrcmVxTCtKRG9tVlZ2eXhtOGp4a2RnR3VNdDB4cjMxYWtmUW4wbGNv?=
 =?utf-8?B?NHBvblZkTHp6K2ozOXQ4aGNHT0NIajlaZEFyNFdmUWMvWmk2Z1NTSjFRa2pO?=
 =?utf-8?B?ZEtmY085cUluSGJaUEJyb1hvdklGWmZMNk5jZm5QbUpHcjk2ejRuWnhBdll4?=
 =?utf-8?B?Q1F6MDJsdW5HU3B1QmNpK2kyWnh2bE04cElzYlNHUFFhSkNNaGVXTHd0QlBv?=
 =?utf-8?B?ZjdFM2VBeWRWYXppMU9MTjAvWXBxVzlOQ0FSRjBKU3dPN3Z3RzVSeTFRS1VS?=
 =?utf-8?B?enEwdHJZVjdmcUxUcUI0MW9wemxzVFFLZFFvYXlpKzNoWExjbnR1UGlFWUlE?=
 =?utf-8?B?ZXlZZWx1L3JRVVRKbUkxVGJ0OS8rV1k4aWVuaTZReWxUbGJEcUFnR0gzZ3p3?=
 =?utf-8?B?ckNHYWFaNVZ0MWdtUXhObVhTS25abTdXZ2RRL1g1ckFTTGlwK3pTdnBNQUhB?=
 =?utf-8?B?MXlzQWU1bDluT2lNVmhlcFZwcEVZeVhOWUVJU1FtN2g2RjhwWGRzdmJoQW0v?=
 =?utf-8?B?Y2E0dkYrcjdvdUtiTVNHcmlxU1JURGFwQ3ArK2h2d1BEQ0h6QlRDbE9Rbkcv?=
 =?utf-8?B?TmZTckd0NWVCRUI1VUFXTE1sRXpJSGVUTDNJbFExMCsvZFh4NGpQV1M4YWgy?=
 =?utf-8?B?VjVoc3NBYTAzZ2VTVGdTM1BMdFVwUElQdDdKSVVKcVErTVA2WUVqeWlEVnBG?=
 =?utf-8?B?K0VCb0xxV1VmeWRRYUdrSGVWQ3NWM29ZQ0JwTHhvYk9tTXgrRWZtNHRrWnVE?=
 =?utf-8?B?YXMrbTltVHQ5UmtMdUdCKzl5Wjd2U1E0cjNocDVyWnZ6dzMyTEYwUEUvZkdP?=
 =?utf-8?B?d295aXN4NmtYRWk2eHlSUmo3bnlnVGUzMTlnTkNiMmJ2L21FVjVBclliM2to?=
 =?utf-8?B?QTdTUWNjdm9GQ0Z3ZFExQzFGWUJGVWEwV3ZPUGZrR1RadUE5MFcrYVE5ZWZr?=
 =?utf-8?B?QUZxUng3TXBJUEpVRGhRUmVtVlorSkRlS2FGQ3RDR09ZejVmMjIxK3hYd2Yy?=
 =?utf-8?B?cVlJWWpWellEcSt2SnpyUkNHcU84NktnWEtSckcwMHNkUEVJZjEyMnp5VGhS?=
 =?utf-8?B?U2JHcVpZMjdvcmVoYVZpdm5rT09rMjJnWTR2TWtKL2YxbDRYSWlvWWtkZXho?=
 =?utf-8?B?Y3k5T3dwd2RJV0lFNXdXbDBkcmU2SGJzdTFWbTdNUzE1Z3llSlluNFNCZ0lL?=
 =?utf-8?B?aU1TcjBZamlFVnZnWEhjb0lTU2Z6aXVPKzBRVGdweEhJTksreVJTUVJJUUk3?=
 =?utf-8?B?ejI3WXh5WkpXVkNhMFhUaGxUYmhlMGhHa3lQRUpxa2tOR1VQVDcyRUtITlMy?=
 =?utf-8?B?a0tseU1oWG9KK05vbUxpWEg4QjMzWHpVbEtkMnUzMDJEQkk3TWxVdkZKM2dX?=
 =?utf-8?B?SUZoSU1ZRE5sZjNwYXpXQUhQT2x6elJlR2NwUksydXJrcnNjbUJ2aDRRUU5r?=
 =?utf-8?B?dDRDUk1tRkhnT01BbzJHdk13ZVh0MjdIbWd4ZmxNLzBjTldLNGlLRVVSRita?=
 =?utf-8?B?SC9yOFgwb3JUVDJXeVpIQktQMWUwNGR4RE1XN2NET1hhVHBtSlBubU9EbFY5?=
 =?utf-8?B?MTNLMjc5WjZSSjNqR0E2V01ibFNKa1lZa0RqS1Z1bm9OQm5iWTd6Rm9RVkEw?=
 =?utf-8?B?cjZpOVliWmhzUlU2OTRma21tWkYyNUNoMFNUVkM3SnduNE5mUE54b3pDdG9a?=
 =?utf-8?B?S3JRdXB0SUdaeGRUL3BvM2llQkxhQnljd1E0UWw5cWsrTCtnQkdpa3ZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWtGKzFmZUN4TGVZQTBSOVU1NFZ0L3hkQ0ZqbVlYemtWdDZtcExkV0JwTDlC?=
 =?utf-8?B?Z2E3ckFHZkVqS0lpSkN0OHpOSFBuenBxTkZsZ3BmSWtaclRzb2QrTzFHaThl?=
 =?utf-8?B?NmJkTWlIYnhrcitnNWNZWWZPV2VFZi9PcjBybnBSM0dtKzF5amFDekhvSVVk?=
 =?utf-8?B?WFhwMVdJd1UwQnFsS3BQQlNPUE4wTkdPSXNDaEgwcDB2UGxtdGpUR01pbnJV?=
 =?utf-8?B?a09KSnN5VExWWjZyK3gyaXdDYmtFV056NXVyZzRrcEphMEFBM1lMUG92VDZq?=
 =?utf-8?B?ZEU1UkZjYWJUWmZ6VU5UVXlyQ1NGT1hHd0t4M1liWFAwNlhhbEZJOFB6K01G?=
 =?utf-8?B?SGhWTDhLRVpNOXNSeEtUMVQ3VDBvSUNJREdmSUQvd0g0U245bCtRUVpzRVR0?=
 =?utf-8?B?SVpZQUNVSEs1OHJCNE9SeS9zZWRrQlVxYVhMZHJxaXJlVXJyU0VFU0VIVEdq?=
 =?utf-8?B?b2tPZEw0QUEydW84OHBKcXM3SmFRRVNWTFhYV2FXbmtKcWVHb2ZlZThnVTMy?=
 =?utf-8?B?T0R1RmdVdEp5T1FFbklrdHFjQlFZaFdlblREM3duYmx6N1ZZZFlocFhIbW9W?=
 =?utf-8?B?d3hkNHQ2Y215UVpvWWZYcGIzTm1EaEZyQzhPcXBmWWNWdlU4L3Vacis5bVJm?=
 =?utf-8?B?WVJuNCt4VkZSS1ZBdUlFUVQveWNaU28yOXJPN3pjTkY0TW0xbE5HZ0ZuV0I4?=
 =?utf-8?B?WERlS0hoMHN5aUo1TVgxTTJMM2JDUEpMV1gzajlveFd2YkFOR1JCbUV2eFVG?=
 =?utf-8?B?dy9BbTJwRGFJVWF3WFdmWUZRYyt4WTRCK3lDb3k1VHJuUE5aNGdvbHREcVo0?=
 =?utf-8?B?c29RYzhucGc1WmFSUDd2Tlh4SHVleExSbDBWYUw3MTN5VUJCK2liV1ErSXpj?=
 =?utf-8?B?MzU4cTlLS3U5WG9wdzZFaWQvemJVRW03VnNSSlk2b3JJMkNROVBTRnhGTGxB?=
 =?utf-8?B?YjgvQWZNVU91Mi83MW12Z3MxTlEzdTQ1NVBPSFk2S1NiUGJTUXA2MUQrL0xI?=
 =?utf-8?B?bzJLV3pXalNwRnNnNWlWNTFiQXZRc2dqcE9CcGFHTEpSbE1FZzZ5eERzNXlR?=
 =?utf-8?B?VEIxL1RtQ2VSSGhrNjFWQ1ZFRFU3eXdpWHhNdVk5ekNTK3NNMXh1VTBQUWxk?=
 =?utf-8?B?S2tkRFBjbjUzMk5NazhzaCt6d2p5ek9OdE85WUtHOFhOZ0thSFdZalpqa2V5?=
 =?utf-8?B?NFhCVmswdzJoZy92SERjbzJoaTg2bHdtZ3ozRElSaFk2d25OV0VmN1JmVENL?=
 =?utf-8?B?WVExd0lkdjI0ZFZER2hvVURNZUZ6aXhCaUdITXQycThOYXJKYm9GNXNuKzZk?=
 =?utf-8?B?a0tKeUtHL251NGVidGtwVTFvNmNDaTFua1NoTnowYmhtU05aczY2T2RHdGFI?=
 =?utf-8?B?eG9ha0hRQ0duMXpuVGdRR1dpRFdoeUlXOTlGc3gzdlpPdWlFZ1JsRHYzbGJF?=
 =?utf-8?B?NkJIMG01b2FCeWQ2ZHh6dy9QSWtSK3l5S2lydjJTTTRkNkE2cEYxZlRGYUJJ?=
 =?utf-8?B?NE90UjNZeEJjVzc1cEFSWFpqYnBxMzJvQlU0dHNHMncwcXdBS3NsT1graGJP?=
 =?utf-8?B?bGhPV0dGNitBSWpONEdjNGR1L2hPYkdkQk9DeklaSWpmTnczUGsza1pyaXVX?=
 =?utf-8?B?WXAwWHJmTGZmNnlFaDJQQXdxQ28rcXBOMTFCMmVVL1ZJRHd4SzFkQjNCa3F5?=
 =?utf-8?B?V1p5K0t5Z3pzQm82RXdwU09mRHk2WitGTVNzNUFEV3p6U0JhSmhwVks3WGhY?=
 =?utf-8?B?MklVdUJJcjk3QzJNNUlsNkRpV0NmK1BTMU5Kb2hoaldWbHltSWwwUktHQVRm?=
 =?utf-8?B?cUdFOUF6L2hNWlNNNmNES1Vyc0RBRzF0MXBuajRzSFRDWFl3dUpWVlN0aHB2?=
 =?utf-8?B?cXJPZEhjeUVINnFxNGR2WXA3a3FTWldjMW93eE0yTUVrZXVSMmIrWUJpUlZ3?=
 =?utf-8?B?WG9xZHdQOHdHUlF2WDJBTCtuUnVSUHJWcEp3MVhWZ2o0dXRXQllGbysyRXhZ?=
 =?utf-8?B?UVllcXllaGlmSVJoakpNVUw4aEIwOG9jSWxPcGcyd29UUU5oNWY3WkhBeVgw?=
 =?utf-8?B?VkQ2T2VFaUM2NzEyZWNpcSt5T0ZSdkYyVEJhclVwdU9uVDZuQ1VHTWNwT0J2?=
 =?utf-8?B?aVdtOEhMT3JSemMwQWFUQlJnSHYyY3ZwZTdiODhnR1puZTFqNTFNeDA2Y29o?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1216916e-c7f7-4128-299e-08dcd9afbca4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 20:06:39.0260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCf+eo+wm2hd+TXxqxV+rjBrtakGhfkSHJH06u4511+iNzZGrDSmbnAIwAXESB9uI2YnfhQHOF3/MHoiEX8d2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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

Quoting Matt Roper (2024-09-20 16:26:44-03:00)
>On Fri, Sep 20, 2024 at 02:12:11PM -0300, Gustavo Sousa wrote:
>> A recommended performance tuning for LNL related to L3 cache flushing
>> was recently introduced in Bspec. Implement it.
>>=20
>> v2:
>>   - Fix reference to Bspec. (Sai Teja, Tejas)
>>   - Use correct register name for "Tuning: L3 RW flush all Cache". (Sai
>>     Teja)
>>   - Use SCRATCH3_LBCF (with the underscore) for better readability.
>>=20
>> Bspec: 72161
>> Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
>>  drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
>>  2 files changed, 13 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/r=
egs/xe_gt_regs.h
>> index 07315eb72eff..8d8f6a113a86 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -388,6 +388,9 @@
>>  #define L3SQCREG3                                XE_REG_MCR(0xb108)
>>  #define   COMPPWOVERFETCHEN                        REG_BIT(28)
>> =20
>> +#define SCRATCH3_LBCF                                XE_REG_MCR(0xb154)
>> +#define   RWFLUSHALLEN                                REG_BIT(17)
>> +
>>  #define XEHP_L3SQCREG5                                XE_REG_MCR(0xb158=
)
>>  #define   L3_PWM_TIMER_INIT_VAL_MASK                REG_GENMASK(9, 0)
>> =20
>> @@ -405,6 +408,8 @@
>> =20
>>  #define XE2LPM_L3SQCREG3                        XE_REG_MCR(0xb608)
>> =20
>> +#define XE2LPM_SCRATCH3_LBCF                        XE_REG_MCR(0xb654)
>> +
>>  #define XE2LPM_L3SQCREG5                        XE_REG_MCR(0xb658)
>> =20
>>  #define XE2_TDF_CTRL                                XE_REG(0xb418)
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuni=
ng.c
>> index 230369f108ab..39f50b6f94ce 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -75,6 +75,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D =
{
>>            XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_=
COMPRESSION_FORMAT,
>>                                     REG_FIELD_PREP(UNIFIED_COMPRESSION_F=
ORMAT, 0)))
>>          },
>> +        { XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
>> +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_=
UNDEFINED)),
>
>The bspec tagging on this one is a bit of a mess right now, but when I
>look at the ticket that originally added this to the bspec, there's an
>underlined comment there that says "only for LNL."  We might want to
>check with the hardware guys to clarify if that's still the case and, if
>so, make this one of the special cases where the tuning applies solely
>to this one version.

Okay. I raised a question on the original ticket.

We might as well make this LNL-specific and then come back and use an
open range in necessary when we get more info. Thoughts?

--
Gustavo Sousa

>
>
>Matt
>
>> +          XE_RTP_ACTIONS(SET(SCRATCH3_LBCF, RWFLUSHALLEN))
>> +        },
>> +        { XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
>> +          XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UND=
EFINED)),
>> +          XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
>> +        },
>> =20
>>          {}
>>  };
>> --=20
>> 2.46.1
>>=20
>
>--=20
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
