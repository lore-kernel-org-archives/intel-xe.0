Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC53DCA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 22:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FBA10E0A1;
	Wed, 20 Aug 2025 22:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlI35x3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF6110E0A1
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 22:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755730672; x=1787266672;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=vulPUh06QOTfLJQcjyJkbio+WzY5IAhYj9U7HBl1hJ4=;
 b=JlI35x3ZU4yxp7xXpm/rZWQX+05nuk+Wwy7HoYlH9v/lNPqOeIt553FZ
 vmor338MkpsJpyBIDCSMofpnkJNlY4KUm1+roj/t+h4foA76SPP+99NYZ
 XI+4mXWoPBkPrNsBBxo6qNehiv5dqOP1mtN6iiLkiePQb3etRxyi7HJhN
 boURyXoMkRx7ows8S+CC5kqBSoVdWQKHEASZSK69seUUnIvdqt7PAIlQG
 9qXuEIqYaMiEr8nTXNvj94W2H7wesW3tOcKvMmbatqJYa11XTKpqLplLq
 sr9zCDKpnwseL3FuBb0H7dhFkj7vcC+J/BQMPpIeycqqc4h7TuJIhcvUT w==;
X-CSE-ConnectionGUID: VNyoaxCKSa+LbADXH50KgA==
X-CSE-MsgGUID: FJWEwiDIQVq3QoMTykxCzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58079723"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58079723"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 15:57:52 -0700
X-CSE-ConnectionGUID: Qb8JT+8zQX2gts8CdCF1gg==
X-CSE-MsgGUID: lmN76bzfQ12FPDHOZYy/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172676416"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 15:57:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 15:57:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 15:57:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 15:57:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpACwsHjT9jGGhnUh/pKWu1Auyup6gzcS76CZfdIwzwfmcmNAXJmKOMcCNHF2YXAIEgwiy0QdSlvGXPlyPwjAfDFwU+Mh3SHuZHXwCZJuUb/VDNs42ok2+fPkDAebiy2kCNvMiSm5o5PD3TZrpCDgkC4RxpBNRcmxuigBp/YAOCsPRWdt3lscDXfgFGOvJzsJdIIz6DBTipSDkipB5zBYVE7PQN4w/6sJhxlZeO7HUaWX8bZ6pp/9s00NoSk6WpTUVTXgGRyWj6bhpC2lAzCa37BNMn++vA1mrU5mkDn24Ov+wZ6UYrt+9/5TA2qFVtkgzbIKBDsDGMixYwzwehw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYegvwpS2QtPNqsc0jpd1S2a1vxBU1NzVhHCeazHag4=;
 b=VVzAJm/pEMsPUeAEZhSoKmi1B/Y0B01zcwL8HDzX9Hx1yR5w9mTlIdnNcMcbXIbzwbamRwnxaz/r2X3KqTijHESd9/Deqg5z4EPTwlrLZkm+HWQUJjp/3uzCCbUNkllVmSzfHWj59tJMRj9Amic55wnOkTT1zZsTrSq5yaUfBR8S9k/wlaIhkdlK3hxJmytDU9S6BlapvHGBcIQWzg6uiBr5u2gYhMIbADYpgBJ9XEWiAOGyJtHKvJusoViTPgc65WyRqclHD2ugppqZoEJFfzQU1zbJpU1tJYDwBXyViSn2Uxc5CyJoqwlX9y9b+WXAblVSwdv96ETDCFDhxeKDew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM3PPF63A6024A9.namprd11.prod.outlook.com (2603:10b6:f:fc00::f27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Wed, 20 Aug
 2025 22:57:48 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8964.023; Wed, 20 Aug 2025
 22:57:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250818-gt_count-improvements-v4-0-ee12870c6f57@intel.com>
References: <20250818-gt_count-improvements-v4-0-ee12870c6f57@intel.com>
Subject: Re: [PATCH v4 0/2] Tile and GT counting improvements
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Aug 2025 19:57:42 -0300
Message-ID: <175573066206.2175.997388978227838086@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:303:b6::31) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM3PPF63A6024A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eeb364d-c1ec-4c1e-6125-08dde03cfb62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkIwYWVOWWJlV1kzaHlVcGhGRGFhSXNOVmsvMmlIZExXdE41c25scTZDeUxX?=
 =?utf-8?B?MzlpQ0pMSkt0T0grWSswOGlTUS81MG1kd0IzWW1id0dEQXB6TnphbDdPaDVN?=
 =?utf-8?B?SHdSaUdkeldWRDdIVHZsWjVkMzc2NjRhblJaYXI0U0dlbkVGWlBJMjJYZTA1?=
 =?utf-8?B?eTZqZ1pTQktvdXZvdjZlVzNrbjN0ait1UlJTNUlJSFZnbElKWFRrWlp0dlVK?=
 =?utf-8?B?bDU4KzVTbU1QMDhVVk5EdVVab1p4SVhMTzNlRklHUjMySk9aVGcxUTlTOEtO?=
 =?utf-8?B?S1lGVi9kdUxCUzRvRFhUT21pMkIwekZrYURJN3pISEdKc0pZQVhZZHpVZTRI?=
 =?utf-8?B?Rkh6YTM3MzJDVDFZNndnZUtBRnNHbDlpdnAzOHJYL1VhUjRYd3lCOWxMWHlv?=
 =?utf-8?B?MHZHNEhUYTBwMHBycjg5MkN1aHg0Mm1FRzljMUFodjZucmFneVdweXdWMFpa?=
 =?utf-8?B?OFVqYmRnem9GdmRsQzRQaDlkcmFmdGhmMVZYV1IwdDAveEFUSU5VRHFFV0JF?=
 =?utf-8?B?eVo2YlVoVTV1K2hhZ2JueDBIQ1FnSitGMWdIaE44TGpLaVNaTXpjU2lNbEIv?=
 =?utf-8?B?UnJodTNBV3RkUDBSRHhCWTI1cmQxNVdFUTAvMmNvaHl3UmM3V243RFNIbUs5?=
 =?utf-8?B?ZzF4NHhmaDJmeitYNVdRdWZxOUhQaGo5VjlNbHRHMWRiQWlha3RzRkpGTms0?=
 =?utf-8?B?QklTZHBmUVpDRi9GTEJaaHJMOGN5Ri92Q29mUnFWSVErSnlXbXBrckl3QmVR?=
 =?utf-8?B?MndmdU0vVFA2aFVlNi9PL2FUVXRCMlFPTzY4bktSTEg1R2FjMkdRcFU0MURz?=
 =?utf-8?B?QkI3UFFuenFUSURoK3MycnpGRkk0aFp2RFYrWXc5ZW8rMHhUQ2lDcEU2L09i?=
 =?utf-8?B?R2ZVR3BES1RXQkpjS0VVMWhia2llNlE4Zk0xblZud1A5c1o1bGxST3pvbTFx?=
 =?utf-8?B?Y0VIV2h3Uk52Q3lkUmdld2Y2NFdaS3lYbExac2FLK1gzL2NMa2ltNUtXcEd5?=
 =?utf-8?B?bUJhby9FUkFsT2lmR0toOFRvbzkyRlhUR0cwMmZmNlhHS2pnc3ZibkJnUnBU?=
 =?utf-8?B?aTVmYk1XV0syWWpPZEJiY21mUXlsTlk3RHF6MzR5N0RUbTdTMUlSelRCT2d3?=
 =?utf-8?B?UVhLUjdEelRxRnpSV1ZTL3pxcTA1VUp6UGxhYVNuV0RXVG9YTzdWQTY0OHV1?=
 =?utf-8?B?V0lMYVB5NTVvcUc3STFrc1paczgySXIrSDMxdGpDbUpxSVd5ZWh3T3ZQenRZ?=
 =?utf-8?B?T0h2WDg2R2s2MzBMRDg4QkJSS1N3dWh1V05kVnpJeXVHZEovVjVxZ1ZYMmU2?=
 =?utf-8?B?NENHcXJMV29LRmo1WnJXR0JEejB0Q3AwUDlOYUswRmt5b1JFVU5SbU9zSXFl?=
 =?utf-8?B?ekF5Q2FEdVVySEtBaUZ3SkV3WnVMZS81OTd1L21TZnZYZ3ZTNm9DRFVnWTFp?=
 =?utf-8?B?RldmanBqRE5BWjFUbS80NnBKSDRZeDFKUFc5NFNQK1loRlpyWFBJZmNBcEJE?=
 =?utf-8?B?eDJSejJzTmZxMERVcER4QmZoRVRSSVRhdnVKTVR4ZmNtRVByZGtkNFdaZGdY?=
 =?utf-8?B?N1I4MmpCcFl6RzgzT2c1SFp1VFR3ZlhLS2gwZHVDUXBVdHdiQjVRVGdONWlu?=
 =?utf-8?B?UFRjNjVXMUtQQ0V6Z1VuVXBtUVM4czR6dzNJSktZZDFaRDlCSTkwVXM3OTlJ?=
 =?utf-8?B?ejlEemc2M01jaTFPU3lBc3d6TFdZVVhYTC8raUgrVWJ2TjlPYlhvRlhvbnpF?=
 =?utf-8?B?Q2cvUXlWbno3Wit4dnEzcjFKcm45QlUrUnZIdzVNR0Z1RTZMdEVqejJyVyta?=
 =?utf-8?B?bkdLRWpkS0tNeWRaVGgvSUNtRHJ3MmFjT3d0TlI0elYxaVcrNmlTL3lYVHlV?=
 =?utf-8?Q?2wPPuitTfjtrE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGw0bWszR1hNQWhLcUhveWovMkwzSlpRRUtPbTdUWlp0Q08xdlBxeGY5bGwr?=
 =?utf-8?B?WmNOSHdtazBoZ3Uwd3BhbTNKd2ZQbUliVkd1bXI4VjBjOSttRlRHR3RDZnVF?=
 =?utf-8?B?eXptcUZ6QlFDZk5kMk40Y1BQdWJoK2RqamMxOGx2bExENE9EM3o5azZVU25s?=
 =?utf-8?B?THp2aUIyQ2M4bnRQTmlETm50emEyV1dCRVNmT2NabXVDZFZvWVFZMXFhSFBF?=
 =?utf-8?B?NmY5UitRK215aG1nMmpNVUFxbkY5Vi9BU3N6dkloZjBvUnVZa1BkTXpFUDZm?=
 =?utf-8?B?SE5xUWx0d0xXUVhNNUx6NlVOYU1pNkRaWHZMaXRvWUV1VnNHTXc4SlFKZlBB?=
 =?utf-8?B?YWpiL0FXVUtRZ3k3bGJZWGJGV0VYWU5kaXFna2lNMTNiT2gycEV5VjVUekly?=
 =?utf-8?B?OVc0aEtpZmEyNlBNbTJnbFBrWTFDNFVabmgrQWRKUVJjMll5dU1jUWVWM3l3?=
 =?utf-8?B?cDNqbVdlYzZhWlROdFdjSm04ek1Sajd3VWxZbkJtOFpQZjdaS0REcmJDV0ox?=
 =?utf-8?B?YS9qTXVPZ3JTN2JZOUFzajJ0dnJOa2RveXZQS1J3Y3ZmV3BkblVsUDlUMTVz?=
 =?utf-8?B?ZW11eXVWRVlqeUxSb2s3T29JRVlEdnNhK3l3NGNwRXNNdUtOQzBDM1FldUFp?=
 =?utf-8?B?cGdjZjNmRmR0Zk15WjRMczZvWDU4VHkwd0dNTE53VDUzUUE3NS84b1ZXWDVn?=
 =?utf-8?B?N3FwYjdOeHBTTGNmLy9tY05LZkpsOFZ5TUtVbmZiSjllY1VRb1RtalMzTjJC?=
 =?utf-8?B?ektseDJWYnExR2lHV1NjdWZYa21hdWtydGdzeHlqcnpOWWdQQTN2aVhYMG80?=
 =?utf-8?B?a1h2dG1yclhya2o2WG5aWWRjMktqNGJtR0Vhb2lpb3doQmx6dG1FM0xON0lM?=
 =?utf-8?B?cFNyaWF4U0RYd2MzNHRmSlBpUXhSVTdKbDZJNnQ0NGVmN3BkQ2dGVWhoRzBH?=
 =?utf-8?B?TStaK2tRUzl2aHU4Z0FRSWg1aVU5ZFcrL09lRTVWanNZd2lONnUvMi96SUVz?=
 =?utf-8?B?LzlLVGNOV2hZaWNQTjZQTDRNQVk5NEJhbjZtdHB4aENQLytFMzBjbGxDWGFU?=
 =?utf-8?B?Wk1IS3hEdGJvYnlHVFkrcFp5RVBRY2ROUE5DZzVHSXgzbFl4Ni9FVjZtYno2?=
 =?utf-8?B?RElUYUpoTEIwNlFZWGY4Z2wxaEg4aFpETmU5K2U4eDE4WHRkNG1YUmYxR0hC?=
 =?utf-8?B?SGZVYjNLUkdDRzRsV09KTi9aRTdWSlBOVEY2anF3WU11bGpSUjZsc3d5Ungw?=
 =?utf-8?B?TlhIc2RQa1ZFOVZzMU80a0IyWit2OHQ3MlNoTlBkeEdsM2wxTFl2VE9qYXBp?=
 =?utf-8?B?aEpXN1BLMmFPejVPdGt3Z3IzSFg5aE9uNVArcjVJdzEwd09NNkZvVkI0ejlH?=
 =?utf-8?B?eWp0ZlM4cXU3UkJXck5yY2JMYmhzSnhuL000dndYd29GcHlTbjdxdE5EYU01?=
 =?utf-8?B?SXZHS1FuLytmblpvL2dJMTlkdmdiai8zeldFVFlVT0hCcUtoUEVvYk9Rc0lv?=
 =?utf-8?B?Sng0cTJndnJxdlVIcHdEQWVnYmI5V0NTU0hJWVBhVDNIOW9vdjBYZ3M3QU9Z?=
 =?utf-8?B?L3p1bmYrUU5YblVEUEZlT01PSTRCa0pwU0FKQVZrSDB4OHNvcWJlQTIxQTI1?=
 =?utf-8?B?THJsUUhGVXNkbE5oY1pjZ25LeEZCbi9vZFRSQm1NMXdTajRGc3N0OCs2REtm?=
 =?utf-8?B?d3NERWlNRjIybEpWWFJLb0JNSDlMSHk1TlJGTUg4aUN1RVYxajZxeXFTNEQ2?=
 =?utf-8?B?K3ZZd1BQRkRvODBOOGZWNTRnMHMwczJ4MUJuM1FZMVN4MnhENnBWa2l5eWFU?=
 =?utf-8?B?TjhjNkZ5aXQrWnZsdC9KWEk4Z21NclRuYlZ2eldyMC95SHQ3YnBpU2l3bHBI?=
 =?utf-8?B?ZzRMcUlrVzhnOTZVTFRSUng3bjY4TzlhTU5ockNaRjc4QTVGS2hJQTF4K2hi?=
 =?utf-8?B?OTdLeXhPcjh1NHhQZ1RKV28yWG1mbU9hdTFUK2JoWWpXVzZCNHZmbkJIQSsx?=
 =?utf-8?B?VzdaTEdvbmZRNnorYmNDWlVLNEYwRWJZakVZS3NzSFIvTzhSOEYxc2dHWlRk?=
 =?utf-8?B?R1VSSmp5b3M4V21pVFV5U1p1YXdBVkZZOCt4MUQzbFVKeUM3SXcrcHdTOW9l?=
 =?utf-8?B?QTNSdWdHSE5mQUJ2K09MdnBwSGlFQ2UweHg0MXJwOVZpQmVXVmdzTjd2YlE1?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eeb364d-c1ec-4c1e-6125-08dde03cfb62
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 22:57:48.0464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oACsEjQj2R9+Pa1rh7isXBxYTK/fL2/UPSNSmjERSIxb/n72aDbehsVRLSPcCqE0aSn2vvRqO9dr4NglSEanQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF63A6024A9
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

Quoting Gustavo Sousa (2025-08-18 15:15:45-03:00)
>This series improves the way we define values for tile_count and
>gt_count. In the first patch, we move the logic that probes for
>available tiles to a more appropriate location; in the second patch, we
>future-proof the way gt_count is calculated.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Pushed to drm-xe-next. Thanks Jonathan and Rodrigo for the review!

--
Gustavo Sousa

>---
>Changes in v4:
>- Fix one issue found in CI (e.g. [1]), where we were trying to read
>  from the MTCFG in scenarios where mmio_multi_tile_setup() would not.
>  [1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/bat-bmg-2/i=
gt@sriov_basic@enable-vfs-autoprobe-on.html
>- Link to v3: https://lore.kernel.org/r/20250818-gt_count-improvements-v3-=
0-32f6901e42e6@intel.com
>
>Changes in v3:
>- Rebased to get fresh CI results before applying.
>- Link to v2: https://lore.kernel.org/r/20250728-gt_count-improvements-v2-=
0-78841ce8a81c@intel.com
>
>Changes in v2:
>- Reworded last paragraph of commit message for the first patch.
>- Fixed KUnit failure.
>- Link to v1: https://lore.kernel.org/r/20250723-gt_count-improvements-v1-=
0-3016134db9ea@intel.com
>
>---
>Gustavo Sousa (2):
>      drm/xe: Probe for tile count during device info initialization
>      drm/xe: Use for_each_gt to define gt_count
>
> drivers/gpu/drm/xe/tests/xe_pci.c |  7 ++++++
> drivers/gpu/drm/xe/xe_mmio.c      | 33 --------------------------
> drivers/gpu/drm/xe/xe_pci.c       | 50 ++++++++++++++++++++++++++++++++++=
+++--
> 3 files changed, 55 insertions(+), 35 deletions(-)
>---
>base-commit: edead24a80ae92312f75626eb92f2771ec5a7697
>change-id: 20250723-gt_count-improvements-d7be01330d73
>
>Best regards,
>--=20
>Gustavo Sousa <gustavo.sousa@intel.com>
>
