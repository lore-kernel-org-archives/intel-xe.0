Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08410C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 10:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD59B10E354;
	Mon, 23 Jun 2025 10:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U15enk7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6394110E354
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 10:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750674708; x=1782210708;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MKrVdoaWTw88JldnSfWA7v2WZAMZGEgEEK1u5BGSrJg=;
 b=U15enk7lX4LXdD9RlAn72lQzxvYbF5KCy2Uk8s5lsaXVu10m49HHuqTy
 VeAJunS2LUXKwuoc86/rMMfQ6HYmWm9jlxoisxbYXVTntFABP/LwkHj4q
 LxKP5MYljPxeZfxG8K6yR4HD6u9JPmdQtTEz2Dc7ESsfaJqat4cxcHgxP
 lNHWHFc4bss3REwPbVOGZNGCvCbtgFHQitIaPfbVOkbPhjUezikwltZmh
 gh9/Bi3G9etb7QTgKVdkBzAlVhT/cPRfL5mpzb4KroYSEzu3Cnz2gm66L
 Y7UU6zqm12Xlq0kv3Qylk5uN6/jAXMgKoENA4gf92V51hT1yUQkeTqsLP A==;
X-CSE-ConnectionGUID: WOwkLO+/Ru2BR8gV+05fzA==
X-CSE-MsgGUID: 8l37BLZwQaCVRPAhw8/4ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="53014349"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="53014349"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 03:31:45 -0700
X-CSE-ConnectionGUID: +sIpn+PzQUy+c1Q20xoHAw==
X-CSE-MsgGUID: ak4ybRO5TIihO4cynFFByA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="155869531"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 03:31:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 03:31:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 03:31:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 03:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6z1ZrPdC3XD/s7OXa+EQeiteYBa94FKvcdcVFm3i00+k0s1EQcc+ftLI665jiM2hzoBhnZQxAjy7YNAFDcamhmTs/VXMDm6niCqBEnxmZ+CQx7kG/pVZ5RBHqUfXlRxZseoTXopdZqK2ZwLKrp1hby4neQ/Fetuxy1M+yiGwwoxwy+okVHrHkWA0oLTI5U21OkQf8Zz2ctpNGJsvfDcTTahDzdNatdtZ4XX82hiMBJpNK7KfNWJB3UBZ8OHhEftXGYYQRSFWaZ6Bf2sFav9dsM7eOwFshSK046/tPnsN5uUN+cfkT2x4jbFb5J0j5NLnIbB00zy2VnQZrffI8zN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/fZjDIhCqgDTNrZUu+RClSnD0SnHnlCIGwIbNNvfrA=;
 b=OSWo5tRszQuWunwkIAuCynWORRe/RYn8OOoihQ8NZF8InL0dmov6fXA6BrmCcpX65A7flQ2SKlOspdTehPUAXRnROA1Cgm0mKEpez/ANd2ma0YjOSNuWE3h0KXeyqCGhPII8tu1nNc1Scdo+/owKKabHzLKtOYiXmzZh4QNEU0iROxO2dSrYCerYp/QN+XeA6WxtHSSOBdK7Y5p1PJFG200BxwEdSKQ2WJ4+cSDaqu/o22bwrTgKMbHxH2TZ1LjxGXx6zPFpmQnNz5rIfeIF2YRTMjEuCmRFgZP0Aq5n2DLoNQ/tBzxn6LqxRi3vaZGaeW402Ig0y9FwQu2WnJ66/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by LV8PR11MB8677.namprd11.prod.outlook.com (2603:10b6:408:1fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Mon, 23 Jun
 2025 10:31:25 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%6]) with mapi id 15.20.8857.025; Mon, 23 Jun 2025
 10:31:25 +0000
Message-ID: <97dcc6e6-66c3-487f-b912-d343afe3bb56@intel.com>
Date: Mon, 23 Jun 2025 13:31:19 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Elbaz, Koby" <koby.elbaz@intel.com>, "Sinyuk, Konstantin"
 <konstantin.sinyuk@intel.com>, "Avizrat, Yaron" <yaron.avizrat@intel.com>,
 "Haimovski, Moti" <moti.haimovski@intel.com>, "Freiman, Didi"
 <didi.freiman@intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <SJ1PR11MB6204EF8ECD2EAE0F8F5AB93C816BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <47547e84-4d10-4037-9f9b-d1b02fa3fbac@intel.com>
 <SJ1PR11MB620443CA7F483CE7F4995250816AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <SJ1PR11MB620443CA7F483CE7F4995250816AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::10) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|LV8PR11MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: 94fc0425-47ba-4fb4-657d-08ddb2411af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1FBWS85YkVqbmRGeVdkRkpGY3lybGJJRlAxd2wrU0RoZ3pCWVU1amNlN3p4?=
 =?utf-8?B?RC9XQ0ZJZEY4SmwvZnllK1ZVc0xndmk3Mm1vTHJWM3F1UzE2aUlSU0tTaTg0?=
 =?utf-8?B?T2pwd2RkN2d2WnBGTm83cnZJaFlYcldiTHo5QzVITDNLR0NrUmxSdEE3RWYz?=
 =?utf-8?B?SHBhNEFEdlFpaHRLSVRvcGxEYXVBRzJTeGt2eHUzT2djSXg1K0FuUWduRy84?=
 =?utf-8?B?dy9jOFZzRlZBWTVUUkNyRDJ0UFo1SEY1QW9ob0hZSkR1dFdBWUFzNEZDdUpS?=
 =?utf-8?B?QmxtTFpmeUhySWJWdUlobW5GclBNQ2p1ZU1OQ1lSbm5SRnUwcHlGcUYvc1Vn?=
 =?utf-8?B?N3RpN0J2ZThTWXQwNUoxNEI4UnNuZ2YyNUc0U3NyMk04T3lhYVpmSkpST2xl?=
 =?utf-8?B?VHpua3N1MTh4V1ZQTDFwS0JGRENPK1F2K2lEMTQvek9hcDhEN1YyY0dvejVj?=
 =?utf-8?B?YjdMZDBzS0x4cmFYb29BQWl3bm9GaVIzWkVaTDRFdTQ3VUpqOHF4WmpqMTF5?=
 =?utf-8?B?UEVlanlPTEtkcjBCWWpYUDlZSjB1MVRDZnVpa3VBNTd5SFNMMGs0UDVadm1K?=
 =?utf-8?B?eFpvSWZqREV4STRLVC9VOXFsa0VWUnhHY2l3Y0Yrd1o3VEp2NGk5S2s3WDc5?=
 =?utf-8?B?eDE3cXRJZm1CN1k3UDJidnlleXVDLzdFNUs4cVhkR1c5SGViVmdYZThMdStO?=
 =?utf-8?B?T0RvSG16Mng3VzdUU1NISmFZZWNJNTVWRVhaVHdWNmNGSkpRTEgxWmEzY1Zv?=
 =?utf-8?B?b0dSTFZxVDVnM05hRldyUHRSQ3JrWTBjcjRrbWFSemc3SWhXdGdIV1VaZWVZ?=
 =?utf-8?B?dUdsYW9NR1RKanR3WGh6MHkzK1RmOXRRVUh3aUszc0hFWjlONWZwU3B2K1hp?=
 =?utf-8?B?d0NWbWlBUEduMENRK1VyTzNRQU1vcS9zRkRaeE0wRm5KVmlINWpGTHZJOGJC?=
 =?utf-8?B?ZDVoeUQvek9RU24zTW53eVF1VmNMWW9EdUdraFVTdUxmTjQzS0dlOHkram01?=
 =?utf-8?B?RXBPVVdDRXdXazRrcTcxTWwzaTRGZXFyU0s2cTN3REt5VUxXQ3lpbWlVZmc1?=
 =?utf-8?B?a3RjajRpbXdjTTlVejNVTTE0NXFiVUg3dEYvMmxlVU9mQy9PTGZxMjZHZzNC?=
 =?utf-8?B?UldHaHgvbjJyanJ0QWhESDlobk10ZHVjazZGNEZpUUFBaUdBclVvM3N4SjV6?=
 =?utf-8?B?ckwraG9CVTdCdlFEazhNcytVZC8zNk1kWmprcFhLRjJVRFA4bCtZSDlSUTg4?=
 =?utf-8?B?NXRQUU0zTGJwdmRCeWFDKzdLKzBwTTIvUUR4RnVMMXVBMk5rdGVIbnJ1dkZX?=
 =?utf-8?B?WEEyOTZ1UFI0Q3QxU0lVanJEZ1o0bExPSmFhYVdPcnZnL2drSnh4VTN5SHJD?=
 =?utf-8?B?dkk2dXA3UFUyNm1waHFHeE0venZ5ZTVaS2xRZHhZNFdCVUJkdEtvNElmSlor?=
 =?utf-8?B?SnF0aXhDZWVpZmlJRkRNeDVmajdPZ0ZoYVpVV0tHQ2k1RVhrTk11K1gzdTl1?=
 =?utf-8?B?M1kwS3FUaFNrNDhCb1p5aTJxQjRVcXdDS0p4UmtlaXlCbjB0WjMvZ1A0M01Z?=
 =?utf-8?B?MXRoMkRSeG4vMnFodUdqYjNacHIzbk1QOE52RVprR0ZMZEx4SmJHSU9Rb2Fv?=
 =?utf-8?B?VlNGSk5HYThaMU5RQTZSdXlDL0FVd3Y5R0kxd3NrNG8vMGVNS21hTGdjYjRv?=
 =?utf-8?B?R0VrQjdrbUhiNVU4MU1ETkhsMERRb05sNG1lY0JzQ3hNR05rZ2p0eHV4VUs3?=
 =?utf-8?B?SXJNb1RnckZXSlBjYkFRYlFFY3psa1hYRG0xWjdGZDI5N0V4eW1aOXpQM0Rw?=
 =?utf-8?B?ZkFnYmNhL1M2MDlmUnNXNGdKb2lOdk1TRTIyM0hHZTdYUFdieXR0SHdmWEs1?=
 =?utf-8?B?cUlZT3RNZlJiaVRINE5SYjQvWFdTUVd1MFQyVmdwMDlFZTZRSVAzUUFET2RW?=
 =?utf-8?Q?3ftUv9D7Gyo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHI4WVhkbzNzQUtub1JVd09lNDZLTlE4eWYrek9vQy9pVndiUmlldzRuTDJZ?=
 =?utf-8?B?OU8wN2NLMTR2dTV1eTYzc1VEQjBoN0RJVnFCZWI5elJIWnpicjJDQlZiY2tQ?=
 =?utf-8?B?M2VnTWZVMFppOS9PaEZDaE5yTEwxQVFnMnZjekNLQkUvL2Y0dXFoMXlTNjdO?=
 =?utf-8?B?UE1tYkxzN3VkZDhyLzNDUXkxMTVmbzNuNzBhNlVkMitWeEhjUzRXOE93T0Vj?=
 =?utf-8?B?aU1rNTBHNkJMbWlTN2FCRGtmZWlyWHJvTlpPUHgyNm1BMFRLcVN3OEF5ZEhr?=
 =?utf-8?B?TnBDWlpuS2dnY1ZvOG41dkRUOTRBZHZ1M3NvK2psbjB2OUVadmZkTWxGQnpC?=
 =?utf-8?B?MGV3dzlVRG4xdEg2bGxENmRFVEtLUC9CMGxPemhRSEgzRmJ5OCsyMklKY1FO?=
 =?utf-8?B?U0l5cVNSTCs5dkJQLzg0T1ZOc0hOS21uTkw0YjBCa05EeXRqa1dQZG9ESkdl?=
 =?utf-8?B?dTFxUjRheUFpYzVQOExROC8zUjFzSlVueDBCR25oVEVycFRnVnduUW5pb0dQ?=
 =?utf-8?B?SjdUb0xSV1VPdjBURENCK1ZWdU1Lc0NiMkFoVEFsSDZwVTVnRzJLTzRlZzgr?=
 =?utf-8?B?OTdiY2M4MlNhVHA4ZWtyWjJUY3EvOTBCck1PdHpmQlAvNW9RVDNKZEo3eS9R?=
 =?utf-8?B?TVdsdFFDaWZvbU1QYUxiaFA0Q1k2VXNRZWpkYmdqejN4OWdleHRzQ3UwQ1N5?=
 =?utf-8?B?a3JVMURwN3pCVU9sVFlSeUd6eGFvNkxBQ2lkZ3JDU3dxK0FXeWtLYnZOTU9U?=
 =?utf-8?B?MGR4dlVhaTlHWWFLWUdNNGZQYVZEK3FHYVZSVDRwZDArVnc1YlY0aCs5dDh0?=
 =?utf-8?B?bFZiVlU5OG1waHZCajk2L05rSzNJbmpmbXB6N0pJWjgwRXJkTktORGY1NUxl?=
 =?utf-8?B?bGppZ2xFV3V3WitDYk8rTEI5RzRNME5iSXNheGpsNnFxem5JSVkzd3ViWUcr?=
 =?utf-8?B?NkxLSUczblcxVVgvZjEvM1ptVHNpUC9Td2NMaGZnU09CTlBVZHlBcEtRNUJv?=
 =?utf-8?B?aktRcTVsb3FrMzBjaFNYVC8rS3h0dUordVFHaDY4Y1g2UFFyY2hVc3JEbzM4?=
 =?utf-8?B?RkVHZXpiNlUvd0xVaWtNelA5bEZ5RDg0aHphZ3A1ZVFVbkQ5VVRhMEFVOVE4?=
 =?utf-8?B?TDgrUjJOY3dqVHZ5clJzTUFUV3Y2R0J4bzRjZmJoMitNR3JyZ1pYdHI0MVFp?=
 =?utf-8?B?bmp6c0svUXV3OWU5V04vT0p6NHltTXFqRG5XRktiTGlhajJYQXFTM1hxQ3d2?=
 =?utf-8?B?TExSSDR5clRsMmk1b0Zia1g4Nm5UZEpaWExHTExITU85L3BMb1N3MDdHUkJB?=
 =?utf-8?B?L05NZnZVNlBBODFXaWRIWk5LRjNZTTNBUUY3bmlsT2pjNHFFTHlrRHQ1b0Nr?=
 =?utf-8?B?V3IzVHZLN0syeEpaL01QVkh6UFRXbzlmZDFCRE8rNkprNDRDNjhudkV0TEJt?=
 =?utf-8?B?bXU0Q3lvSyt1SzlnYWw5RGlqcGFxNkFhekFtS0RlSjFxNXdzUS93YkZPbHBk?=
 =?utf-8?B?aGxNVTJISFpIU3duUitDNG0xbFhOS0xOVDF0ZXFxQ3Yra1IzZDlETW4waS9U?=
 =?utf-8?B?L0R2Ri9hVUhHcktFenRXSk45NzJob1J0ZC91WWVmb3huM1BtV0tBbUllUnNX?=
 =?utf-8?B?ZEhrRFVDeFNoM0NLcDlNUW5nbklwOW9VZHR1SnlCUEZUSkhJYTcvWHJsOHFL?=
 =?utf-8?B?U2RaTEFEMUo5eGdzaTk3MWNjYzdCYlZGYWtlWjN6SWVwallRK21Md1BpUk1Y?=
 =?utf-8?B?WDRYVUR4Nmdwb2xxZC9Qa1J2N2tJVXBZaHd5UmtPSTF0QnRwbjB6MWJ2dWZr?=
 =?utf-8?B?cXFOOE1OWFQ3dkRDSVk2MU5mUFVXcy9HdlgzUXhSczNENnM5SlQreHJlRkty?=
 =?utf-8?B?ZW01U0JBYkh3Ym1sck45TFkxUmljZU1OTXBEVURDZy9FMGhVY1Ayd0poZ3JC?=
 =?utf-8?B?S0p0em9TSXl3V0hBd3BxSThQSHdTZUR2NTVhaUF6ZncvL0lqWTBPWk53Nkxo?=
 =?utf-8?B?bDEwc1ZCSi9zb2I2L0QrOWNoT2R0R3BmWlRyeGh4NXZXaXVPTGZ3YWdVYTQy?=
 =?utf-8?B?akdkVElDZjNocy9vU0tSOWdjdWJBd1Y4NjR1YkFGTklsei9va3BBMWtUVjRT?=
 =?utf-8?Q?AdHug1YIXa+QC4cs7jAnZ9cUE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fc0425-47ba-4fb4-657d-08ddb2411af0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:31:25.4646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFLbVUlQX+IKFa5F9jwzGauxEUXzuD3ooZdbqE3Z7JYsgA5kLA+vtGAIiN+W8Uhj2nqDlScij9+ZC4bF7xdBlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8677
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

On 10/06/2025 15:58, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Levi, Ilia <ilia.levi@intel.com>
>> Sent: 10 June 2025 15:09
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Elbaz, Koby <koby.elbaz@intel.com>; Sinyuk, Konstantin
>> <konstantin.sinyuk@intel.com>; Avizrat, Yaron <yaron.avizrat@intel.com>;
>> Haimovski, Moti <moti.haimovski@intel.com>; Freiman, Didi
>> <didi.freiman@intel.com>
>> Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
>>
>> On 09/06/2025 17:20, Upadhyay, Tejas wrote:
>>>> -----Original Message-----
>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>>> Ilia Levi
>>>> Sent: 09 June 2025 15:30
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Levi, Ilia <ilia.levi@intel.com>; Elbaz, Koby
>>>> <koby.elbaz@intel.com>; Sinyuk, Konstantin
>>>> <konstantin.sinyuk@intel.com>; Avizrat, Yaron
>>>> <yaron.avizrat@intel.com>; Haimovski, Moti
>>>> <moti.haimovski@intel.com>; Freiman, Didi <didi.freiman@intel.com>
>>>> Subject: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
>>>>
>>>> Allow the driver to expose hardware register spaces to userspace
>>>> through GEM objects with fake mmap offsets. This can be useful for
>>>> userspace- firmware communication, debugging, etc.
>>>>
>>>> v2: Minor doc fix (CI)
>>>>
>>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
>>>>  drivers/gpu/drm/xe/xe_mmio.c         | 142
>> +++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>>>>  3 files changed, 160 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index ac27389ccb8b..78542de0d48d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -10,6 +10,7 @@
>>>>
>>>>  #include <drm/drm_device.h>
>>>>  #include <drm/drm_file.h>
>>>> +#include <drm/drm_gem.h>
>>>>  #include <drm/drm_pagemap.h>
>>>>  #include <drm/ttm/ttm_device.h>
>>>>
>>>> @@ -161,6 +162,19 @@ struct xe_mmio {
>>>>  	u32 adj_offset;
>>>>  };
>>>>
>>>> +/**
>>>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>>>> + *
>>>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>>>> + */
>>>> +struct xe_mmio_gem {
>>>> +	/** @base: GEM object base */
>>>> +	struct drm_gem_object base;
>>>> +
>>>> +	/** @mmio: The MMIO region to expose */
>>>> +	struct xe_mmio mmio;
>>>> +};
>>>> +
>>>>  /**
>>>>   * struct xe_tile - hardware tile structure
>>>>   *
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>>>> b/drivers/gpu/drm/xe/xe_mmio.c index 7357458bc0d2..6bfa915a9602
>>>> 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio
>> *mmio,
>>>> struct xe_reg reg, u32 mask, u32 va  {
>>>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val,
>>>> atomic, false);  }
>>>> +
>>>> +/**
>>>> + * DOC: Exposing MMIO regions to userspace
>>>> + *
>>>> + * In certain cases, the driver may allow userspace to mmap a
>>>> +portion of the
>>>> hardware registers.
>>>> + *
>>>> + * This can be done as follows:
>>>> + * 1. Define an xe_mmio instance that represents this portion.
>>>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an
>>>> + mmap-able
>>>> fake offset.
>>>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to
>>>> retrieve the fake offset.
>>>> + * 4. Provide the fake offset to userspace.
>>>> + * 5. Userspace can call mmap with the fake offset. The length
>>>> + provided to
>>>> mmap
>>>> + *    must match the size of the xe_mmio instance.
>>>> + * 6. When the region is no longer needed, call
>>>> + xe_mmio_gem_destroy() to
>>>> release the GEM object.
>>>> + *
>>>> + * Limitations: The exposed xe_mmio must be page-aligned with
>>>> + regards to
>>>> its BAR offset and size.
>>>> + *
>>>> + * WARNING: Exposing MMIO regions to userspace can have security and
>>>> stability implications.
>>>> + * Make sure not to expose any sensitive registers.
>>>> + */
>>>> +
>>>> +static void xe_mmio_gem_free(struct drm_gem_object *); static int
>>>> +xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct
>> *);
>>>> +
>>>> +static const struct vm_operations_struct vm_ops = {
>>>> +	.open = drm_gem_vm_open,
>>>> +	.close = drm_gem_vm_close,
>>> Should you remap in fault handler, to make sure mapping is there always?
>>
>> Hmm, do you see any benefit for lazy mapping here?
>> When a user maps HW registers (presumably a page or so - not much more) I
>> think it would be ok to do the mapping immediately on mmap. But let me
>> know if I'm missing something here.
>> - Ilia
> In case user is doing some memory r/w and some event like hotunplug or similar would happen you may need some dummy page map in order allow smoother exit for user. Also for any other case mapping disappears fault handler would help reestablish mapping if device is working fine.
>
> Tejas


With the current patch, the user will receive SIGBUS when writing to the mmio after hot-unplug.
But during hot-unplug the driver gets unbound, so any fault handler wouldn't be called anyway.
I guess the fault handler could help if the driver was to intentionally zap the user PTEs, but AFAIK
we don't do that in Xe. So for a BAR mapping like in this case, I think a fault handler is an overkill.
I don't see a real-life scenario where mapping re-establishment could occur. Please correct me if I'm wrong.
There are enough examples in the kernel of drivers that don't establish a fault handler too:
amdkfd, exynos, mediatek, rockchip to name a few.

- Ilia

>>
>>>> +};
>>>> +
>>>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>>>> +	.free = xe_mmio_gem_free,
>>>> +	.mmap = xe_mmio_gem_mmap,
>>>> +	.vm_ops = &vm_ops,
>>>> +};
>>>> +
>>>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct
>>>> +drm_gem_object
>>>> +*obj) {
>>>> +	return container_of(obj, struct xe_mmio_gem, base); }
>>>> +
>>>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio) {
>>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>>>> +
>>>> +	/*
>>>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the
>>>> trick below.
>>>> +	 * In the future we may want to store the physical address in
>>>> +struct
>>>> xe_mmio.
>>>> +	 */
>>>> +	return pci_resource_start(to_pci_dev(xe->drm.dev),
>>>> GTTMMADR_BAR) +
>>>> +		(uintptr_t)(mmio->regs - xe->mmio.regs); }
>>>> +
>>>> +/**
>>>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>>>> + * @mmio: xe_mmio instance
>>>> + * @file: DRM file descriptor
>>>> + *
>>>> + * This function creates a GEM object with an mmap-able fake offset
>>>> +that wraps
>>>> + * the provided xe_mmio instance.
>>>> + *
>>>> + * See: "Exposing MMIO regions to userspace"
>>>> + */
>>>> +struct xe_mmio_gem *
>>>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file) {
>>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>>>> +	size_t size = mmio->regs_size;
>>>> +	struct xe_mmio_gem *obj;
>>>> +	struct drm_gem_object *base;
>>>> +	int err;
>>>> +
>>>> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size %
>>>> PAGE_SIZE != 0))
>>>> +		return ERR_PTR(-EINVAL);
>>>> +
>>>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>>>> +	if (!obj)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	base = &obj->base;
>>>> +	base->funcs = &xe_mmio_gem_funcs;
>>>> +	obj->mmio = *mmio;
>>>> +
>>>> +	drm_gem_private_object_init(&xe->drm, base, size);
>>>> +
>>>> +	err = drm_gem_create_mmap_offset(base);
>>>> +	if (err)
>>>> +		goto free_gem;
>>>> +
>>>> +	err = drm_vma_node_allow(&base->vma_node, file);
>>>> +	if (err)
>>>> +		goto free_gem;
>>>> +
>>>> +	return obj;
>>>> +
>>>> +free_gem:
>>>> +	xe_mmio_gem_free(base);
>>>> +	return ERR_PTR(err);
>>>> +}
>>>> +
>>>> +static void xe_mmio_gem_free(struct drm_gem_object *base) {
>>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>> +
>>>> +	drm_gem_object_release(base);
>>>> +	kfree(obj);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>>>> + * @gem: the GEM object to destroy
>>>> + *
>>>> + * This function releases resources associated with the GEM object
>>>> +created by
>>>> + * xe_mmio_gem_create().
>>>> + *
>>>> + * See: "Exposing MMIO regions to userspace"
>>>> + */
>>>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem) {
>>>> +	xe_mmio_gem_free(&gem->base);
>>>> +}
>>>> +
>>>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct
>>>> +vm_area_struct *vma) {
>>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>> +	struct xe_mmio *mmio = &obj->mmio;
>>>> +
>>>> +	if (vma->vm_end - vma->vm_start != base->size)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/*
>>>> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map
>>>> the
>>>> +	 * whole buffer from the start.
>>>> +	 */
>>>> +	vma->vm_pgoff = 0;
>>> I am not sure, but is it confirmed this offset wont be used by anything else?
>>
>> Yes, I believe it is used to lookup the GEM object in drm_gem_mmap and
>> that's it.
>>
>> Also many (maybe all?) drivers do exactly this, for example see:
>> mtk_gem_object_mmap
>> exynos_drm_gem_mmap_buffer
>> rockchip_drm_gem_object_mmap
>> __tegra_gem_mmap
>>
>> - Ilia
>>
>>
>>>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>>>> +
>>>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND |
>>>> VM_DONTDUMP |
>>>> +		     VM_DONTCOPY | VM_NORESERVE);
>>> Do you want to allow cow_mapping?
>>
>> Good question... I probably should enforce that the user passed
>> MAP_SHARED, thanks!
>> - Ilia
>>
>>
>>> Tejas
>>>> +
>>>> +	return remap_pfn_range(vma, vma->vm_start,
>>>> xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
>>>> +			       base->size, vma->vm_page_prot); }
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h
>>>> b/drivers/gpu/drm/xe/xe_mmio.h index c151ba569003..2990bbcef24d
>>>> 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>>>> @@ -8,6 +8,7 @@
>>>>
>>>>  #include "xe_gt_types.h"
>>>>
>>>> +struct drm_file;
>>>>  struct xe_device;
>>>>  struct xe_reg;
>>>>
>>>> @@ -42,4 +43,7 @@ static inline struct xe_mmio
>>>> *xe_root_tile_mmio(struct xe_device *xe)
>>>>  	return &xe->tiles[0].mmio;
>>>>  }
>>>>
>>>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio,
>> struct
>>>> +drm_file *file); void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>>>> +
>>>>  #endif
>>>> --
>>>> 2.43.0


