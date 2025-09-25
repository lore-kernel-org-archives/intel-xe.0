Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F1BCAC5A7
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 17:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8A310E27F;
	Thu, 25 Sep 2025 17:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVJ4gW/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013E110E27F
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758820604; x=1790356604;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2viLv5Zbq/L6O/3tC+K8niT4BngN6RDCZfS7xqUAM7Y=;
 b=fVJ4gW/dnZGJAQnPBifo87D2MKHKTps32Mk/6VaeLpsPUuyMKG6DVjtF
 wFnazNEbLlwhvySPGPtwCUtvtYQQav6cPWsZxw/fH/Fjj7v0CJVerAXk0
 OetEsyQZyNfLm+7IRvu1DaGaqqNKZOboO58r28u3wyQJvj1qdPOoNCfdq
 pA1z/c246A/AlZaSipilDZZWXSQAtemOgzPWlNtogMvikL9toIjWi0RD+
 S45Jjb8lP3dJGSzksiPnoNWhsT4AA/uqmuiA1HzUIlGBHQ2fNkITgXGtt
 Kl5oZE5EtBXTbfvb/dDFEVMPCTCS5nICL+j6PEk3GX/4+Prvuy3fgOCqw g==;
X-CSE-ConnectionGUID: 7zSsatXLSWW8a8h4aMC/+w==
X-CSE-MsgGUID: /Au0BkO+Tbib0k+pbP6c3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61201125"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="61201125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 10:16:43 -0700
X-CSE-ConnectionGUID: eFRdswhJSS2c0wl8nVWqog==
X-CSE-MsgGUID: vt8la0rkTu6+ULTXNahw/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="177445364"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 10:16:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 10:16:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 10:16:41 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 10:16:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQBVvOC6f/4mtcm+P54XWvBL1rvvXMsDJyakKWBmaJeWOH5U8bGDDNz50CfI5M/6OMtcG/nh6j7XN5H70Pu2m6zl6jBx4JL7aNl6Y642uFFhNBxlyQdgdPQ7xLWn7CV3YNB/AFtkH0GL2yFZyWx18o2mB63M/GmQhT+EActcnHR1MrB9kFa9a4tmsneGQZ6aKZmbfY1Rbj+dtxMUMcmHQccIIMn0yTWS43xcwTBkf/RwuQzciLbKP9xdTcZtXc0YjS4SjHoAazNY84aKBfjFBaHikZaSu/SMMqrisT+84WXU3kcr24RQLl6OoIXsF5duk2oVcySfolGGV0CMJtVJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDaJbfMoU59XRJxYvDRRR4pMOOCy3rq/AJUkPeS02es=;
 b=mtsqZe95dbJFWCK1YIp+dHCdejc2LBns6LHuM+JuxZKjvIG5W6FyfjHJPHc6Hcm+yp2I10fLomlCxLGPBG46fnWBdiskPnYynZ5FO3hLQ9I9gcYYJosAVLgacwuNyOSwTi7atesYxH+oSHrwEM0MU4kcvTcPO2jbSxVnKI2/118p0g6OAC08Xtow49fpIClC7wnV6a+T6TWPnWR1JbUVIGzroVNHPXc43hKfyUE21dOVOoAHgQqBBqU0r3NOB9p2AiPF8+U1RGXOZuIIhuhuY6GgSvZarkZCIkmIgGx44kH/p1/XnkWLjIaZlgcS1i7Xi/Hw8OepCPqiKkg9yyLbgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB9204.namprd11.prod.outlook.com (2603:10b6:208:56d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Thu, 25 Sep
 2025 17:16:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 17:16:30 +0000
Message-ID: <b05e7ab6-edb3-4ea0-bb7e-4db759b5c4f9@intel.com>
Date: Thu, 25 Sep 2025 19:16:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Update GuC log buffer type value
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <john.c.harrison@intel.com>
References: <20250904151406.736972-1-zhanjun.dong@intel.com>
 <44a754f4-78a3-4cbd-9f1f-55d62f19c957@intel.com>
 <2318dc1f-f03f-416b-a53e-eda9991083a0@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <2318dc1f-f03f-416b-a53e-eda9991083a0@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: 584f97cb-6a4a-4d9c-02c3-08ddfc5744f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWhIVzQ1c0dBNWZVNHpiQmhRZENFeUVkRUZBRjZMMFpOTGZ5V1pmZFZhQWtP?=
 =?utf-8?B?bFZVQk84TjUvckw3QU8za2hvOFVuakpHVC9wMkNoOVRCa0Z0WDRGcmJOSVFj?=
 =?utf-8?B?a2ZoSkUzNHhwaXhlZ3VUbDkyWEZXMlE5UWxOUmFlcGpHcjd0bVBzem5Qd0ZB?=
 =?utf-8?B?QjN0c2FjU2Jacm9PVW1ZbGxoaElwejFSeG5oaE9IdzloS3BTdk16NCsybi9o?=
 =?utf-8?B?TWI3TDRNRHdNTGdMMzhZb25tUDRMKzE3SE5odDZMSEZuRUpyWFN1cGJFcTZI?=
 =?utf-8?B?bE90ZEZuaEhpVXNHeHdTUVk5enBNbmZmYVh3c29HUzgvZlFQSTBTNE9RZitm?=
 =?utf-8?B?d2Z0MnRFMlI4M2hkYlRVYk42b0N2WmEvcm43NUlMNldsQTVxeDhPd01Wc2hC?=
 =?utf-8?B?OGlpOXJWRGlrS3JaNDBuUm05REZ3TWFtZ1RLVGZRVmNOUGJSZXFZNERKTk1p?=
 =?utf-8?B?L0x4YmFZYXpkc0V1aUtnd3NzL3JEMTVac0QvYWhPWHdmOFlxQncvRmY0Y0tU?=
 =?utf-8?B?cldGdmJMSnhxVHB4R3U4Vzg0ejFCQjJwNGllamd3VmxYLzNxR1orWHlnbUdw?=
 =?utf-8?B?ZHZ3cFYzZTI2RTk3YStJeCthcExZekhXcStjU1NLeGF0VFVMMStuNnFncUlT?=
 =?utf-8?B?SFlSVjNNSk5SRzJqYmpOcFo5ZEUwUDI0UExJUjNTSThnaWtiTGs3aWJOTndr?=
 =?utf-8?B?Q1lZMjgwWEVYd0I0MUs4UGN3ODRUdHZTRFVYYzUvRmcvRjdYbnd3cnVYZUdv?=
 =?utf-8?B?eWRLN2c5RHpVSGpSQXdQYnJHS2FSdnhSTTN4QWpWVGdKWDhXZmFBNVp6N3ox?=
 =?utf-8?B?b2UxbjlUSDFwbzlwRE93YjluMXJJV25NUnkwK2FLc09qN3BqYk5GNTJscGc2?=
 =?utf-8?B?Z0Fzam5rU1BsZ0VqVVM5aGRtSnVxZHJBVksxMGk4VEd1MEE2cFY0RDRhcUlL?=
 =?utf-8?B?SlFlSzV2T0lqS293RUtiYTluY20rM052dGJ0UUJLT1hwQ2R3TGlpOUttRms4?=
 =?utf-8?B?dy82NEY3QWZRSjIxTUtKTlV4SVlRa3BnaVJ0OVlyMzM1R2dGZGhwMk83Mldm?=
 =?utf-8?B?ZVlKRXh3YU1xanRjcjZhRXJtMWJ6UTlNTjJ0Z3ZTcU13VTdkL3B4a3VhSkVX?=
 =?utf-8?B?bEYzYVVhNGFhZEgzbG11VWp6amhTeldoTmlXdEk0VFY1K2JjcW53N3I1MDI3?=
 =?utf-8?B?NjZqSFJWNDFuQjB2U3l0SndESFQ2UlhXSTRJWXZzU1pacVo1YndHMW1DQ0hD?=
 =?utf-8?B?VGV2YXg1TE9TZTBpUnhuS1FrWnBmZmhhZXRpclRGbkcwUW9yQm5pUmk0cGdQ?=
 =?utf-8?B?cnFRbUJDT00yaXZoU05rMVlKSVZmV1gwN0JNZU56TzBzNUoxRFZ0dUh0WDgy?=
 =?utf-8?B?TU5uRGhiOEdiK2lxamF3eFRFSS9zWTZFc1dsS2dlNHUrTEhtaEduRmdUeENR?=
 =?utf-8?B?cHhUd1Q4eTB1Nlc2U3VhaHNrNkFuajBzcFU0MFlMbUJ5d1lxNmZ1dTEzVkR5?=
 =?utf-8?B?Z3NBNGpMZVhod2Z4ckRrSzVGKzBSa0VBSk9ER2dRN3RBRUl5YTUwai9pZEJs?=
 =?utf-8?B?RTV2ZllwOU1RTE5na1pjelFwSGRmSkxKb0p0Y2JhczJaR0NjR0IxTDJmV0Uw?=
 =?utf-8?B?Q1kxU3hWOGo3RW80T1dSdWRhSGZhM29KZVhmQTVGa0hBMHNMT3NsRlpna21q?=
 =?utf-8?B?L3NKSXpndkZQVDNtN1dYYTFESW9jNGppcEoycGJaR1MxWDdrMkhLQWh0M3Vj?=
 =?utf-8?B?VlRaMVhJKzRwTmhGUnQrb2NpWnJZRWNvTTdiVE91NEFoRGJwTllwWmZENHZL?=
 =?utf-8?B?Y2hnSllTdTVuVnpJVFJqN3pKVWlldDVFSDcwalJ4cUNEdm9SbGdVVkVscHZ6?=
 =?utf-8?B?eDYzQ1BWc2ZRSk9RWVBQUy9neW5ZL2dzb09LQVBFZDVYd3g3U09RaVpzbnQ2?=
 =?utf-8?Q?Xyq5HyMwGVE5IrC6ngezJhBw/BxYyrGS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG92ckcrWTdaMnRDM2VCMG5jVEluSk5DR1ZGbTNKVGlwMUJzcFhHVlpFckNx?=
 =?utf-8?B?TFVRdnpWeGxGV3hza1VPZysvelFnd3h3YmV1d3A5WU9IV0lsR0JvekxHbWFZ?=
 =?utf-8?B?blRFY0xXM3hodU5oNnpuNk9zamJaTFZJMncwUEt0dWhxV21oeDRrQk5iUzJK?=
 =?utf-8?B?c2xNdGZwTTNqVVUvUmM1L3NjcDVIcTVNMWZGZkVNVDMwUlEvaEhRME5uWm5j?=
 =?utf-8?B?YWZsMG1TVy9HZ0IvSzM1bCtrMWN2RHozalpkMnhVbDUwUkMzWSt6Y3BWeDFr?=
 =?utf-8?B?WnlqUm9jYTVMZWVZZm5zM3FWeGJ3NjExalNBU3p6QzFCWERCT0JzYXNKczRW?=
 =?utf-8?B?dkpWcHFWeWU5SVFwcUc4RFFETnRVMFFmS3B4SUNmYlUzRHhucjFxQWdUZ1p6?=
 =?utf-8?B?MHd1NXJhdmZlcnhYRjBLK0hkYkdtTFJuSjQ5S2hJRzdiOE5oTjJHUnd4T1I5?=
 =?utf-8?B?VmNOTDJyNjhNL1RKRDlsdlRyYWticlVSNUhVVFpIQy9KVm43WHZQeWExeXBu?=
 =?utf-8?B?UXM4M3ZtMGtoejNUakdWOWZvVHE5ajlQYzJSbWVTUWVtaU5sV24wOFRSei91?=
 =?utf-8?B?Z3BUYlpIZEozbnBnMVpsL28zeTZuMXNwc1o1ZGEzZG1wTXdQSnBoSDJRMW02?=
 =?utf-8?B?Kys3VkhXdy9sTmRyRkVtbmQraGg5YUIxRlE3aDQzK3JLc1FNZG1zdWMzWGNY?=
 =?utf-8?B?YkVNSllhRWozalZ6bWlkVVVhMlZUMzVEYmVYM0RBUHBKeDN4dUpBUkFoNDhx?=
 =?utf-8?B?dmxYTFBRekxlQ2UyWG5tR25tS01WdXNOUlFzdXlBSjljVTBjNnJiSytNeUxU?=
 =?utf-8?B?eWxLM1p2L3dMUnNOaTdHTHVjczhvdzhvaVV4U0lvTlc5a3piL1NtcmxTemEw?=
 =?utf-8?B?Y1hBR2N2SlV4K0VXMnI2RzZQbGlkeklWaU41T0tKUnJvaVhINUVST1ZZU0dt?=
 =?utf-8?B?Z0ZHdXZvY3BkV3kzRlkxYjdENnNGYmREUHlZa3RPQWFmQlZZUk9YeWhxd2dV?=
 =?utf-8?B?RVFoV2RjUDBrbldxNkhQSWZCdVl2RGhZUnFnZ2xzT3YwVmNYbjk2bGFmM3pq?=
 =?utf-8?B?N21KQitySmduRnBRaDZCNkU3ZjRHQ1FZN2ZjbEk1WVNnNEttSmljVGZFRUp2?=
 =?utf-8?B?QStVb0ozZXNJQ0RnQU92TDV4OU9obDZkYmp6UTdESENYdkVmTkZDazlVRDJo?=
 =?utf-8?B?Vm14c1FadjAyZENmUFM2RFJocm55L1BoVUZDWktXcHVYUnBlVFhQNHA2MGR1?=
 =?utf-8?B?T1d3SHpCOW1zVW9sRTJFT1lmTGFXTVpPaWZRZGNEa284cXF6cSt5dEJDNlp6?=
 =?utf-8?B?TWJlYzgwc2NGV3R0VitZdnordjA4VnUxU3J6bkN0MDVCSWlUamJOS0JyNjdl?=
 =?utf-8?B?MHEyTnZ6VGhoTGJKTVpXdlM3Qk5IeTRuSWN2c0paaU5LZlVRb25Fay9RZGpN?=
 =?utf-8?B?M1pINXpXbEFtSWlSMldHcTluanY4bFZUS2QxUVNraHgrekhwT00yK0RhZnlH?=
 =?utf-8?B?bXhOUHdmcSt4MnZoSDZUZlg5bWt1UkdCRzV2ZWxWWHRDdGlRZDV4VTJGR0F3?=
 =?utf-8?B?d0lTbzZKc3J6dWI5N1gycUJMQWFhcUV0eU9kVWUvVnRnQm5IMWVEQmw5R2F3?=
 =?utf-8?B?VjdWYzVlVldLYXYxNDFPUzB4cGR5UVNJYnFaNnBPclQ1QlJEbDRPa1llWFpZ?=
 =?utf-8?B?ajlkWis4V0crb2l5eTB1V0xtcklMWTNjM0x6Skx5SHR6a0NFeVQxaExza3R1?=
 =?utf-8?B?c0UzNnZIVDRRZ04vU2pSWDJQQjRNRW5yQ2JONmdpTTh2QkgxWnBhNGY1bExF?=
 =?utf-8?B?WlgzaG9PMDlnU09ZaUVZUGJLdncvS3YxeWRUSldCK29POVVURFB3MEVLcTdR?=
 =?utf-8?B?R0NyMkFTejlLYk9EelF0bUZZZW5kdldYN3BSZzhmb1lBeVA0aytzNy9ReER5?=
 =?utf-8?B?cjF5TDV1L09hbmtJUTNuL1BMcE93NHJSTThpME9DWGV1UTM2RklOK2RwSm8r?=
 =?utf-8?B?TkM1WW0rOFJhWXpvbWwzclBVWDZwQ29EM1dPUU4vYVVQbjZJY2Z4SjdkeG92?=
 =?utf-8?B?eGdibmZoQjJnamJWVXBFVzdtMXBQajQ5b2tYaW9DTERuczd2Z20vSG5iWVE4?=
 =?utf-8?B?RFJyY0FkMkp1ZDduL2t5cElqbThNVm5ZeUVLM3ZCL1RHRzlnTldtRlJZU0U1?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 584f97cb-6a4a-4d9c-02c3-08ddfc5744f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 17:16:30.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jc9J3HqZUXcQloo/Fa8lGgmFNOFlMd4PDLM6AdK3AJ/ildH9S+3jpLYWKHxUYkzOaNvpXtSzyzqSSDsZQfkW3jN0iu6phKd4aRFAUcWOcdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9204
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



On 9/25/2025 5:20 PM, Dong, Zhanjun wrote:
> 
> 
> On 2025-09-23 6:20 p.m., Michal Wajdeczko wrote:
>>
>>
>> On 9/4/2025 5:14 PM, Zhanjun Dong wrote:
>>> Update GuC log buffer type value, to align with the GuC specification.
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>> Change list:
>>> v2: Use SZ_4K, instead of PAGE_SIZE
>>>      Expand for loop with switch and fallthrough
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_log_abi.h |  2 +-
>>>   drivers/gpu/drm/xe/xe_guc_log.c      | 20 ++++++++++++--------
>>>   2 files changed, 13 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> index 554630b7ccd9..b1819679fa35 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> @@ -10,8 +10,8 @@
>>>     /* GuC logging buffer types */
>>>   enum guc_log_buffer_type {
>>> -    GUC_LOG_BUFFER_CRASH_DUMP,
>>>       GUC_LOG_BUFFER_DEBUG,
>>> +    GUC_LOG_BUFFER_CRASH_DUMP,
>>>       GUC_LOG_BUFFER_CAPTURE,
>>>   };
>>>   diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>>> index c01ccb35dc75..6cbb0378d2ba 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>> @@ -50,7 +50,7 @@ static size_t guc_log_size(void)
>>>        *  |     Capture state header      |
>>>        *  +-------------------------------+ 96B
>>>        *  |                               |
>>> -     *  +===============================+ PAGE_SIZE (4KB)
>>> +     *  +===============================+ 4KB
>>>        *  |        Crash Dump logs        |
>>>        *  +===============================+ + CRASH_SIZE
>>>        *  |          Debug logs           |
>>> @@ -58,7 +58,7 @@ static size_t guc_log_size(void)
>>>        *  |         Capture logs          |
>>>        *  +===============================+ + CAPTURE_SIZE
>>>        */
>>> -    return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>>> +    return SZ_4K + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>>>           CAPTURE_BUFFER_SIZE;
>>
>> nit: can you do the math in the same order as on diagram?
>>
>>     return 4K + DEBUG + CRASH + CAPTURE
> Actually the order in diagram is reversed, I will update it in next rev.>
>> and btw, since in this function you are using hardcoded values
>>
>>>   }
>>>   @@ -327,13 +327,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>>>    */
>>>   u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)

btw, this should be named as
	xe_guc_log_get_buffer_offset()
or just
	xe_guc_log_buffer_offset()

since it takes xe_guc_log, not xe_guc

>>>   {
>>> -    enum guc_log_buffer_type i;
>>> -    u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>> +    u32 offset = SZ_4K; /* 1st section size */
>>>   -    for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>> -        if (i == type)
>>> -            break;
>>> -        offset += xe_guc_get_log_buffer_size(log, i);
>>> +    switch (type) {
>>> +    case GUC_LOG_BUFFER_CAPTURE:
>>> +        offset += xe_guc_get_log_buffer_size(log, GUC_LOG_BUFFER_CRASH_DUMP);
>>
>> do we need to use fancy helpers to finally get the same hardcoded value?
>>
>> here it is just CRASH_BUFFER_SIZE
>>
>>> +        fallthrough;
>>> +    case GUC_LOG_BUFFER_CRASH_DUMP:
>>> +        offset += xe_guc_get_log_buffer_size(log, GUC_LOG_BUFFER_DEBUG);
>>
>> and here DEBUG_BUFFER_SIZE
>>
>>> +        fallthrough;
>>> +    case GUC_LOG_BUFFER_DEBUG:
>>> +        break;
>>>       }
>>>         return offset;
>>
>> then since XXX_BUFFER_SIZE macros are already in .h maybe we get kill those helpers?
> The value is fixed for now, with the helpers, logic inside could be easy to change for future, currently, caller of xe_guc_get_log_buffer_size for crash and debug log are inside of this file only, but user of capture has external reference on xe_guc_capture.c.

if those buffer sizes are about to change into some dynamic/runtime sizes
then those macros shall be removed or at least made private to the .c file

but in the meantime, since those are public *and* your guc_log_size()
function is also using them as-is and bypassing helpers get_size(type)
then I see no reason why macros can't be used in buffer_offset()

either make buffer_offset() to use macros, or
convert guc_log_size() to use helpers

mixing different approaches is very error prone

> 
> Consider the helper won't cause code hard to read and only return fixed value, make it easy to be optimized, I would keep it as is. >
>> and btw, those BUFFER_SIZE macros in .h should have likely have XE_GUC_LOG prefix
>> (since those are Xe driver specific) - something for next (or prerequisite patch)
> Yes, need to add prefix. I will make another patch to change it.

maybe all those small fixes could be done in one series?

1 add prefix to BUFFER_SIZE macros
2 make them private to log.c *or* drop xe_guc_log_get_buffer_size() helpers
3 fix get_log_buffer_offset to use macros *or* fix guc_log_size() to use helpers
4 rename
	xe_guc_get_log_buffer_size
	xe_guc_get_log_buffer_offset
	xe_guc_check_log_buf_overflow
 to
	xe_guc_log_buffer_size
	xe_guc_log_buffer_offset
	xe_guc_log_check_overflow


> 
> Regards,
> Zhanjun Dong>
>>
> 

