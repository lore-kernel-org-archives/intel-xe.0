Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC6DC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 22:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4E710E5E5;
	Wed,  8 May 2024 22:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xwxv7Ilz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6254A10E5E5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 22:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715209068; x=1746745068;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=/uq/FNToABE0dB2Vc03fPI2yzZWy+vhl/nJlhNPsFLY=;
 b=Xwxv7IlzM5lJNqP3mlljl+V2Df3/P9+a9LweoJMtnV2YY4bT2Z+fbR41
 ZyC8rZGxxexDjje7XaskculRccfalwnNi1AgJliZIJ+H90VXr3z7916BR
 40HB9mgs+kJO9YcAdl7K51tpeylq0ptc//GQcx2eBF9Y4173aWKccA4aT
 ANTUbmbUoWW9gXxb0TsrZfOw3+7YWQxpMM/JsYz/CQtfjHO+2lcQtkHue
 lsIIehSsc1jPBr4jacdhXNWZ55vt77zCqYPSPIsJ2x4/l40UB8FOpc9ul
 36T/qvxKPDoPUoxB/6r1qqYYmxJ/qZvlFlMw8WkrdeLVBPvpTULL21a3/ g==;
X-CSE-ConnectionGUID: YFRDwzagQiCM2yc/v8Qt5g==
X-CSE-MsgGUID: 6WHTBrPHTpeglioCpPGXeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14908665"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="14908665"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 15:57:48 -0700
X-CSE-ConnectionGUID: x7h3+oBfQvOP0rjZtJlufQ==
X-CSE-MsgGUID: t5az8GDyRgyEFwvjNDasxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="29133962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 15:57:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 15:57:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 15:57:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 15:57:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CenamzHUcneBluiBYVmmYGjdw5pxn5A6uNgaLfCKtDQrZCRTYG/jXK+x9jQHReMp/2JAxPSYRXt46rZzxZBymz/qbC9lUckFlLXACPTmtCG/OG0fBwLznuuZpTA8udWoRQmvBVhQj9Ojv2X0TZ92sCNvn1V4tePwikCl9vSTkqceXERFT8AJbu+LTTkYZ2kNF0GM5AkpnXc2QB6jeWu//+5gFD1qo939+Gaka/7RkN9OKUAbMkIT3pZgkj5Tlabq8Is6G8SCb9mvpswL8UPvxoeLe7P9uf5axbAFco4DRO9SPTQ8spe/mlfw+P3C03YOPt6kym1h3nWyaS28ZiYxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uq/FNToABE0dB2Vc03fPI2yzZWy+vhl/nJlhNPsFLY=;
 b=LFK7dZok9srb9BAIA5VlikdTaHvPyAqf7ak8hjip1y1zdUfNp1+zXG1CFZHH+mb0wDAmYgW+3d5G5dwL//dLrHafDPJ4KqmuZ+3MdDPoeWvxQ++OLSQzO8QjauOIB2tTog3Is8iON6C9E+92u9TBtIogv+GwADT+aG2fIEtcWzThpWfgWeQCpzRwR0Z3CQh2FZXt8B17L1hNFYni++iHUzqinSyK00qKiMha+U6C1RDa75iLb/pIUnCBTMadD28bNqM0nXecy6WGuSLwXwzQ5vdmwaEY2CFqzoGeofp8f2f+a4pW0LMhQ5lyplctGyLu4L9np2qpNFJhS2jgc15ouQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY5PR11MB6140.namprd11.prod.outlook.com (2603:10b6:930:28::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.47; Wed, 8 May 2024 22:57:44 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7544.045; Wed, 8 May 2024
 22:57:44 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 3/6] drm/xe/guc: Add capture size check in GuC log
 buffer
Thread-Topic: [PATCH v8 3/6] drm/xe/guc: Add capture size check in GuC log
 buffer
Thread-Index: AQHaoCC5O4gQgDqwqUaQUK0UIFLjSrGN9gOA
Date: Wed, 8 May 2024 22:57:44 +0000
Message-ID: <1e1e4d700e6b3cb3f96871c529d1d94413cae468.camel@intel.com>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
 <20240507014736.1057093-4-zhanjun.dong@intel.com>
In-Reply-To: <20240507014736.1057093-4-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY5PR11MB6140:EE_
x-ms-office365-filtering-correlation-id: f976666e-6da9-4324-c206-08dc6fb245d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?YlhKZkM0V0ZDVlVtelZTVWwyeWVzYnpQWUZ1WmFSbmhRYm4yaTJrTXp3bW1M?=
 =?utf-8?B?N1BTWGpNYnhjMmY0eWQxaGh1emZ6S0VBSlNZa0xFd291ZmM0Ykg2eTRmQmJG?=
 =?utf-8?B?ZnZxZTYzNmZXU0VTMzVRYnVHZ0VKUUk1OE9PSWxIdFhNcllRbHZoRkhQSmJv?=
 =?utf-8?B?b2kvZUtEOHdLdmlWMFVvc1RSYXZwelVRWld1OUdicUpDZzZWRkdMeWJ4ZndI?=
 =?utf-8?B?aE0vQWppYlM3NWpNT0NWRm1ZWFJjRVV0b3VzTTRuZFJVNHZIUmJsZjQ3NXVr?=
 =?utf-8?B?eHFTQXZlOElxRmJPZ0F3Rm5FUCtNbTJmbUliemJERHVEUWF4WjlURVJJN25w?=
 =?utf-8?B?Z0NNZ2F4R1h6dlpqa1Z5c002TVoydmJIYXdZTWIzeVpCZ092ZHlvblhHSFhm?=
 =?utf-8?B?d3JhNHlyZFBkN1VhVy94TTRjZkhBR1R3YXpqVE53dUlNMG5BU0JvK1RKOWJN?=
 =?utf-8?B?UHNqS1JGeGlBN1ZYTmh4YXhpVGNidXhIWUU1YzNsandGY3lnZys2cWxmWCtJ?=
 =?utf-8?B?b3RDMkI1OEt0b2JqaWxUb2c3VURCaURQakVuVGYxZUVlSmhMWVN1K0VTQjAv?=
 =?utf-8?B?S2hSWTdqdFdBZXUvWlBtQmtRemVVVnp0NzlRcmFLT0tMM2JrdlBRSzlhRkdU?=
 =?utf-8?B?MEdtOXR6UHJSdW40TVBncDE4dzM2eTh6QXpkMHo0Y3grSG84VjRkQXloZGFr?=
 =?utf-8?B?TUVyK016Y0YzS2pGYldaeVZLQkRHeWpsSHQ0V0FlRFVIdktoWXpyL2hrTHFH?=
 =?utf-8?B?Zk1ETU5Oc0twU1BnWk0ycEVoSmc4ZnRVR3d1bzMwQ2ZTcTdndkdIemJyTVV6?=
 =?utf-8?B?Z0pBcDF3MTJKSHcxTUNyeHZpWVA4RVpBSjBJeENHRUo1T1VJQ01ZcHA5SUtV?=
 =?utf-8?B?UEQ5cDBEVVdGanM4VWR0NzUzbXhwVjJpWmx4OHVMcStaYllNeUNPMFlzSks1?=
 =?utf-8?B?U24vY3E0ekxQRjJDTHVTVjFLeGx1cEI0QnZDbXlTK0VZUTNFOGc3V0dLamhw?=
 =?utf-8?B?QlFWU1k2bStmVEkrdEY0NTBDNlJ4b0JvYUVBaGVJN25wUzYwWjE1SnFMK2Nv?=
 =?utf-8?B?Ri9DZFpLNUZMTVB4aithdHJFeVFIcWVsT09ESExPZ1I3bEpreHlENWlybTBv?=
 =?utf-8?B?UVluT3JJVjFCQ2ppcDFDTDJhb2Q2Y0htUW9EdzBaM1RVZDllV0RFSnFEeEJk?=
 =?utf-8?B?L2Jxb0NuTkQ1Z0ljSU0vWS85Wk0zenJLL1pVVTlzUHRhYlE2RTlBN05qTHhU?=
 =?utf-8?B?ZGJORXBUWmZ4dTdWamFORCs3UTJaOEFrS3F3OGVURzVaVTdPTnJyU1JldUhs?=
 =?utf-8?B?OFZhbk01T1lFOHppWUpUa0oyZ0loRUc5aW1Vd0srelNub1M0d0JiUklRMkRB?=
 =?utf-8?B?ZGM0azI1Y3dKZDBNS0IrbklXWWQxTGNzeXFBbitzKzVSZVFQTVN6S3M4QWRR?=
 =?utf-8?B?SHdhclRqdlgwODRQdGpkdmlMVDZFWWtVZVRrb09pRGRSaUtRdzUyTWR5MjNM?=
 =?utf-8?B?Q1hEY1FkcXJtVk8zRFF3dS9PVDl6akEzZ0NaczFnM08wcGdicWJTYTVvbWZI?=
 =?utf-8?B?dkhaVk42UllpZjVucUNuWWxsWE9GejJkYS9VUDNKanlZdWRIWDg4RWpLU0Vy?=
 =?utf-8?B?WXZKblFqMU44QXlrajdmMTVhMGVLUmEvajgwMmxMYStxcldPYUw0T3c3Kzh4?=
 =?utf-8?B?WHMxWXV0RDdFbWsxSVB0NEZGdTBNK3ZRZ1l5VjJ1NjBYTVdyTjFYQVNKWEpW?=
 =?utf-8?B?VWFUbnlZZ1J2ZitqNTB2V3h2WVFLQnM4QmhObnNxQ1lRZzBJK2h0YkVZTWRE?=
 =?utf-8?B?OTJldlBDcllvNVNYNUdzUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0lqZ3lhOUplT05CWUpXL21GZnorZWFqYWJxdzB1MXR3NGxaWkJ5c3dUZ2RI?=
 =?utf-8?B?N3dHaGw5VjVDaFdBWDF1cEhNWSsvdUdnU2pnb1kvVHc3ekxOSE4zakozVDRI?=
 =?utf-8?B?OTZieHQyd2hLWDlGQXFBRXVGTDFaR0s0RE85Znp4RW92MHg5MWJiN2NOT0tK?=
 =?utf-8?B?S0UwaXczRDFSUkp0ZjdzUHg2UGNpUkJMTnUydWZNeDNxZjJ1Ymc2QU9uVTFq?=
 =?utf-8?B?ZExHWnJFRzVNTWdTOWxrYm80RlB3cklTcitCeC9XdnlmUkQvRGw1Q0ZZT1dS?=
 =?utf-8?B?UzVlS04xQjAyMitlU20rTFlmeEVpc0YrUFpyU2Z3OFcxVHNOeXRmS1E5UGND?=
 =?utf-8?B?UVQrb1poNTdMbnBoci9nRVRwMVFEbEJqRUQrYlNZeWRsbzNENitoT0VoUDNJ?=
 =?utf-8?B?MVVYL0p5OXlvaTV3YldlWTNHS0JLeUlYenVHTlJUMDdmUkZLNXIveXhMSlBD?=
 =?utf-8?B?Z2RidS9JQUI0Skgxa2tSN09mLzZFbTJuMThjMjF1NlBmMTRrai9nS29xbGla?=
 =?utf-8?B?ZDBGOUVrMUNwNW5zckRvbzk0MkxHakFRNlRoUXhNeFp5Qjg0dDYxa3FoZjBL?=
 =?utf-8?B?SGNVWGRUOU1OSHFURTN1WkwvOVl5dHkraU41d2JsN0x5OE1ycUVGSlZCcUNp?=
 =?utf-8?B?YVZjbEtkTGtmU3RHOXZwOWlIUHJJaDMvN1hnT2Q3UFkySFhpcUdTWDBNQ0Q0?=
 =?utf-8?B?dk1MS25ybXlaVGgxN205cUxra1dyMmNVcUxNakozR3dnZFF2emNjUzNVV2s3?=
 =?utf-8?B?WUhscmgyOU1qMmhJRlJ5bUlzYzFHK0hQTHdmOXBDMldSTnpBNW5XbEpkVllp?=
 =?utf-8?B?enhNTW1pbXNMUldNOTc3Q3cySzU4dEJwNUZQVEdBZUlkMFBDZjhQWkozUndk?=
 =?utf-8?B?Y3Fvb0Z3VGdwVHVpSXF2Y3U5QS9rMnlnTW1sbEJMd0FHWkl0anY2WEMxQlVL?=
 =?utf-8?B?MlhWRWY2dDQ4aVAxNHhTeGJDMEVmb2luMGt0RFVsbU9vUm0vbC9Pa2M1bHVG?=
 =?utf-8?B?YkhLeUdmdHMrLytSVkExWVZKNnRpUFFqc0k4MjZqN2ZkbGhKWENSYjEzUnh3?=
 =?utf-8?B?RURMN3NDRVJackRHMk81ZTAxRERFZTJIRk1uaHhEWTVZZFFLajdVWm50VlNV?=
 =?utf-8?B?RzBaOWdwbXN0UmVLamtBM2xBNktpL1M0cGZGeG5tRWpERjdYcU5aUm5nM1NY?=
 =?utf-8?B?NHVhdmNDbk4vL3pPUzZUelgvaGViNi90eWZSVDgweDRmTGM4VkZFdFFYN05O?=
 =?utf-8?B?R2VKS1lzTG1oVVZQdjA2Ti8xdE1IbDdieFNhU2JKb3pqZXhjMHRORzZNWVpB?=
 =?utf-8?B?ZXVOMVBFNWV5YmRDcDB0dzhMZDVWaVBXaGg2WnFuV2xPY01rL1dTeVZsbGZF?=
 =?utf-8?B?NGZaSVFUTklKbURyR3I0UUpiUHg3WFE2YjZGM3V5Yk9YaXpQY3h5aTFORlE0?=
 =?utf-8?B?UWlCWjNTWFozSERUdUZ5bHl3RHZBK2ViYWlSekMxY3NsQ2lYckUxL0hETlhC?=
 =?utf-8?B?UlBBYTdLZW5pR3g1TllhbE1Ib3pkdFVFMEFHWG41SEtJTlFQdkdmYldKRjNw?=
 =?utf-8?B?ODExeEZJZlhvQ0NPdHBRUmZwZGY0bmVKaXcrZjhBbytMejZGam45Mzl4ZGVZ?=
 =?utf-8?B?R0s4MllDV3gzRTZtdG9UZHc4M0pSTE1MNCs0Z0FtREZIdlRhTFlxZmxaRGZD?=
 =?utf-8?B?Z0s2RGUzem1zM1VUL0szSEtpVDdWbDBmbndxWng5TWE5VWNXNnlHWk5YYldQ?=
 =?utf-8?B?Z2NUSDFFbDFCMmgxU3l5bE1KNnZjOCtUVC9jRXNCSXdXQ1JVeU4zazJZUkZw?=
 =?utf-8?B?QU9zQ1BGNW9HcGlEdDkyeEF6Q1cyVUdneUgwMDEzM1JDNE5aM3FxWG4zVFI0?=
 =?utf-8?B?amlOSkQrMkQ2NWd4SThDN0ErWnVIR1FwVmlKK0VDaUswWjV3UkF2OFRsNk03?=
 =?utf-8?B?YVIwa2VDVTFEc1NVMlArV2tyOWFZem1tczRtU1AvazVjZnJmWWZ1OWtyUXRa?=
 =?utf-8?B?SlVXQ0hrQmZvbkw5VUE3M2Z1R3Fpckk0QVh2R2hHdnVoU28rY09zamxmb3A2?=
 =?utf-8?B?QmRJK0o4Yjk1TWNldlIwZ2ptYTB5Sy9XbVdqcVc2YlQzT0dKQmgyT013RWd0?=
 =?utf-8?B?RVE0QmplTDJzNlMvNmZOU2dXM0JhSVJPTXkySXQyajZRNGpzS09kRkErUU1j?=
 =?utf-8?Q?uq6Tu/O1iuZ7QocIdhH55mM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1791A18B528B1469E3826889BA074A7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f976666e-6da9-4324-c206-08dc6fb245d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 22:57:44.6018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YeiicN/fh+k3zmIH7NC+ad70jGjnXjVMuhIP2lhDCxOAn6XYtePos8I9YrLPCymr/kC3Gwf+HybX+/IdDTTI/YgouyAQ94hhziYhjsA8aMDXYzuqiUQ+rVpMWPVuLq4x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
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

T24gTW9uLCAyMDI0LTA1LTA2IGF0IDE4OjQ3IC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IFRoZSBjYXB0dXJlLW5vZGVzIGlzIGluY2x1ZGVkIGluIEd1QyBsb2cgYnVmZmVyLCBhZGQgdGhl
IHNpemUgY2hlY2sNCj4gZm9yIGNhcHR1cmUgcmVnaW9uIGluIHRoZSB3aG9sZSBHdUMgbG9nIGJ1
ZmZlci4NCj4gQ2hlY2sgdGhlIHdvcnN0IHNpemUgb2YgcmVnaXN0ZXIgY2FwdHVyZSBhZ2luc3Qg
ZXJyb3IgY2FwdHVyZSByZWdpb24NCj4gc2l6ZS4NCj4gDQphbGFuOnNuaXANCg0KPiArDQo+ICsj
ZGVmaW5lIEdVQ19MT0dfREVGQVVMVF9DUkFTSF9CVUZGRVJfU0laRcKgwqDCoMKgwqDCoENSQVNI
X0JVRkZFUl9TSVpFDQo+ICsjZGVmaW5lIEdVQ19MT0dfREVGQVVMVF9ERUJVR19CVUZGRVJfU0la
RcKgwqDCoMKgwqDCoERFQlVHX0JVRkZFUl9TSVpFDQo+ICsjZGVmaW5lIEdVQ19MT0dfREVGQVVM
VF9DQVBUVVJFX0JVRkZFUl9TSVpFwqDCoMKgwqBDQVBUVVJFX0JVRkZFUl9TSVpFDQo+ICsNCg0K
bml0OiBhY3R1YWxseSBub3Qgc3VyZSB3aHkgd2UgbmVlZCB0aGUgZGVmaW5lIG9uIHRoZSBsZWZ0
LCBzaW5jZSB0aGUNCnVzYWdlIGNvdWxkIGp1c3QgdXNlIHRoZSBvbmVzIGl0cyBzb3VyY2VkIGZy
b20gb24gdGhlIHJpZ2h0Lg0KDQphbGFuOiBhcyBwZXIgb2ZmbGluZSBjb252ZXJzYXRpb24sIHdl
IGJlaWxpZXZlIHRoZSBkZWZhdWx0IHNpemUgbmVlZHMgdA0KdG8gbGFyZ2VyIHRvIGFjY29tb2Rh
dGUgYmFjayB0byBiYWNrIHdvcnN0IGNhc2UgY2FwdHVyZSBzaXplcy4NClNvIGFzIHBlciBvZmZs
aW5lLCB3ZSBuZWVkIHRvIGluY3JlYXNlIHRoYXQgdG8gYXQgbGVhc3QgMzJLPyAob3IgMTI4Sw0K
d2l0aCBzcGFyZSkNCg==
