Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F6CCCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 15:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9557510E416;
	Mon,  3 Nov 2025 15:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0p6odl2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815F810E416
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 15:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762182285; x=1793718285;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=zTcFZRI2oZWDNUeAXR/9nVc0JQK1iHeZSXqNw6/geJc=;
 b=D0p6odl2OerREfemm9KoScjnvKGgHySIp9EBw57M3ZK5L5z3wrNVCUuh
 SD03FBRWnufuW65tAJ+BHN+Tbx4eutyNIg/7hoY8YNgh1ANLg9Tm0ozKk
 qVfUi5c2QB9vvHJrf7S00FPF86+VNtQnFnGiZTlFeKlJ2OmmSKJmHrzuC
 He8XgvW3FfkKzVRbR3n/rJxtFt/Jxaqja17jIL3xupo3rc6mMwZGQpjkz
 TfCr3mBJNfOMFuZniCOlLKKDvItAjpUq1DXhrFhbgz7P8t1EIJZMqqbbQ
 dwNUeV58ncKAih5s6849f2SKiYq8Aog+FWbXVZRoCscPDomZ1v3EPGpew g==;
X-CSE-ConnectionGUID: xpKAhbpGRiem+D/He08rQQ==
X-CSE-MsgGUID: XAapP0CaR0eXX/rCzuAWIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75609211"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="75609211"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:04:44 -0800
X-CSE-ConnectionGUID: 3zKSvUHgQICLQsMfKY12UA==
X-CSE-MsgGUID: BJVd/OoNQxSIgs097d79sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187611255"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:04:44 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 07:04:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 07:04:43 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 07:04:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5DYqZj3C1IbmSuHHVrM52hsEVgi/qV/ZD8VBNpvRinb78I+nChfARxR/7kanq08ZkvUx4kaLYXri/8xFNLuF/aNMEQs3fPlIVto/Tl8il8oBjmy6NnGLKDromc0fBx1k8PwtLq2F0+0MJGAQL78mz5ojwn6wz9SECpx479lGQXvq4jPBS9wCwzdjtZs+1EwJyDww4E/HTO9zgvhBWxQxU+Vxs686rnckxrfu0YR1mpBVywOdwkrqtSxk8GvzXyUybHihyzNpnsVm2nrh8U7QJG2KtNws8+gYk0UGQiAwAtQNAIln2zmzdgG+gsOE9VWWo0KyEa8HkSs9miryju4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaMY0/Imebx8Zv9zt2YBkTdlHytBSmQlLWE+csyMxSA=;
 b=HKmVImS0lHdjKRAgEQhcgnXYpJd7/iKcj2585PjD0qnEfXm5Ds0+xY1VMWIeXY24u9ZA8FFLA0UYweCqYcOI0EMvcvqA250HO62ovvU8tS37aTlr1VZoqaQ0q9tAO1gkJBqCbvx7YhQeExWSay1IgdK2Eck+p912wPcxV1VbQONh5yG6WD6vhe/2EQFku0FwTGRV3KKccOEqdDmGObrzV88CxwObjyuvr3+VlQGZcGa0bM4pS0E2lASxnI+C9qM/dE482uLrUOLN6XvDPeUQ3/rJG/3ooSzzaaMDFOUZitb4Uge0ovXxw/DuMelHZakO1BvzyRRIOz25YB1gx/EwzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 15:04:40 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:04:40 +0000
Date: Mon, 3 Nov 2025 20:34:34 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/irq: Handle msix vector0 interrupt
Message-ID: <aQjEgu0IhQzSOIOE@bvivekan-mobl1>
References: <20251030151020.2042207-1-venkata.ramana.nayana@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251030151020.2042207-1-venkata.ramana.nayana@intel.com>
X-ClientProxiedBy: MA1PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::21) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DM4PR11MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1474e1bd-5d95-43b0-7d61-08de1aea501b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eENkQmlOVDVxZFBnWUVhZjdyWE5mNmpZWXpKQzVEeWFUaWQwOHdQMmZXTURD?=
 =?utf-8?B?NWI0OUxJMVcvdW90NzJRU09JUEZTdU84UnhGbkpLZ3RWcko3a28zRVRnSU9s?=
 =?utf-8?B?T0t3L0g4WU42d0JBakFESnhzN3lTM0VjbTVDZk9RZHI0OHVJRE1NK2c2TXJh?=
 =?utf-8?B?STNteFNYN3lTU1R2YWVkcHc3NGFMWlk3YzVHY0QxWHNTVi9yeGtZMnUrY2ZH?=
 =?utf-8?B?SURTWXhSb2kwUVdDNFZ1Nkh0VG5nQXVaTlgvQWg0UWV5dEk5UDVnYjNVdmxI?=
 =?utf-8?B?SjU1WFF0UGpBMGQyczZPVE1SeHdWaUxpMzhGUzExQzdybTVocnA5SFBZRXAx?=
 =?utf-8?B?T0crUzBqMFo1bmZBK1hqeEtSM0NDblBNT0krR1hRM3hGNjJpNW91NktaWHdD?=
 =?utf-8?B?ckF6VmxmTHVuSnZQSk1SU3hZL0Q5blJnN2lNekpSYnFvTnB2dzRqemlVR1JJ?=
 =?utf-8?B?T2Qrc2tVQmxjUTNFTWpxWHlmZFIvejM2MSt6TllTdmt6MUlXbjNVNW1QWFVO?=
 =?utf-8?B?NzZPUWNMUSt1UVhnL3hJRkVWNElBWmtpMWh3R3lFQUxmSURYNGF1cGZ5ZTJW?=
 =?utf-8?B?c2wwU2h4YktlL3ArN0RLRXJIZW9ENWZHYng1SWZyV3p2R0orM3RXV3lpNFJU?=
 =?utf-8?B?MWdYSVhzRy84V3NxQkt6MytlbGp0d1AzZXBFb3V0dUlNVkZ6ODZSL2puaTFT?=
 =?utf-8?B?M29lKzhubXBxcXNIMzhQazRvWVNWR0x2Z3lKYWpvZXpVeFdtMEtuT0g3ekZu?=
 =?utf-8?B?Yk96ZnlXRllWOUZsSDM0OWJhdk5xRGp5b2hZVTFHaGpUbjhpMm1kVWFEc3Az?=
 =?utf-8?B?SnIxWmJHbHZXZVZrQzFCbzlJa2h6SWQvelc2bFRCS0YyaFdoWW5na3RUeURX?=
 =?utf-8?B?YmlSYklUYWxHZU8rSXZLUDJZRktCK0pYM1ZrKzNKdFAwS1BpQWVpa282UWc5?=
 =?utf-8?B?ZTdMbXRGcVNsMDNyWkkzQy85a0x5SUNDNUt2enZ1NnlZRU1IdERqNzM1MnRX?=
 =?utf-8?B?K1E5bXB6aEdHZVkwV3QwVVhBdDY0ZnFjOHU2NjhnZUJqWXlzOXg3cW5JWUp2?=
 =?utf-8?B?UnYzT1F0NDZmS2h5L2F5bmVxb2VRRXZqM2tURno4aGtadGF3YWJpTEs4ZjQz?=
 =?utf-8?B?VDUyYm9iSjBHR2tXazJBMFVJdmpzVU9YVkVBRGJENVdhd1o4R1ZkTFg4NWVR?=
 =?utf-8?B?aVMwbFhTUzd0b3F1YlhENWlZVUcvVjJnNld1d3QrNzZSQWkyc0tqb3pDeXA4?=
 =?utf-8?B?SjRiRzdiMzRldGxUTnFjZm42bWQzOXRPWVpBRk1zekJaKzRYaDlwSnhSN3F0?=
 =?utf-8?B?Z2E0dDNGN1F6SmJJbk5YWWo4YkUrbG9TcUttSUhacjVicWdUNE5QQVQ5eWRC?=
 =?utf-8?B?OWpJZjdsR0RSSVU1SVdPK1dvbUNTTjd6MUNrSnpHZzhuU0R0YTRvZWJQcU5Y?=
 =?utf-8?B?SnNEd1lnN1M4dms5R0lRVDZ0eFBrSnFmamVSZWozNW1WMVd2WmNTZHVyTHNQ?=
 =?utf-8?B?RWZ5WjNIbGg0a3hCME5OMEFVaHlibU5YUDVJb1BQdUxCd0xCYjN2RUY5bmcy?=
 =?utf-8?B?WGFYbzRySzVEVW5RbVptYXFtaDRnblJFWVpMM1k3Q2xhOE5CbWhpR3g0Y3dh?=
 =?utf-8?B?dXlJbUNuZGRhS1orWjRLcFI1VUtkZmpkMUJKYldRZmpwS0NBOGNVdVFvN1Zw?=
 =?utf-8?B?NzMxKzludldhS0FTT3pOd3BNeUtIWFl4U1dzQkh5Z3pCRHFMRTVkUXh1TW9C?=
 =?utf-8?B?d2J1Z1l4L0V5TlVWZ1UyZGdTREZqNURyMmg5UWhsV3VzanpvWFRJeDVnZXZv?=
 =?utf-8?B?dGt5Y0NwNFZpbHZ1N0RtdDY3cXFwaXpqYVJuUFdmR2hDOGs0elJUNTczdnI2?=
 =?utf-8?B?dndzQnVmWmxmTUdYdkErR0h3MGRkWW05N3BkeEVjbmxWNUt3Q1grTW13c2xk?=
 =?utf-8?Q?f11mru1bDsFwHV2QqokuTl0f+u1luXyh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1pWaFkrVVRRcUZId1BHT0ZPQi9sRmxmaVozQ0F0SldJc0hmM0srY2VPR0tw?=
 =?utf-8?B?VHRIMHQrTHhyb3FiOTNmQTlmcG5BY3laYnFZT3VvcEozOHNtdmJUd2gxVjNB?=
 =?utf-8?B?d3QwOXIwVEZpcXhDRVVubzVMcmZpQUZUeXRuUEhKOW5GMjE3THZ3RUlJaHRl?=
 =?utf-8?B?aUVCWXEycW16TEhqQnNBQTNNTFpKWUM5TVovemNNUytxQmtoc2FUdVN6cjlx?=
 =?utf-8?B?REU5MnVTV2VhbnBLU3E3cFZvQ1gvYUtSSUZZMnBtLy93aFRIOUs2THFUQ0lm?=
 =?utf-8?B?YWtzS1ZrbTZCTmU1NWZhR21lUjRnclA0eUR2M3JjOVkrQmd3dkViRWNoaEVQ?=
 =?utf-8?B?STI0REVBTHpMNUN2b3hERGxxMmZSUDU4ZDZSZHdYWlhwZ1Z1d0o0aFI4ZGVD?=
 =?utf-8?B?T0ZvMkdUK0wvb3g0QUp1TEptTk9nenhFczkvbkFrWUJLK0w0VGZWOExDdlFv?=
 =?utf-8?B?R3JCU3daM0dkMDNublI4OWJlM20rM1J2QjkyTjZLSzNXdXhJWEc2ellWd0pV?=
 =?utf-8?B?blZJYjBvV0hReEhoM2ptMUVCNzdMME40MkZ1c2tSaFc5Y2lXUFkvQUFQZ3pn?=
 =?utf-8?B?SDZ6aG01V0t2Yy9RUE13VnIxYThDYU1LNTJPdG9kdDFzZEgzTW5lVXBzMnEv?=
 =?utf-8?B?TG1WVUVhdXVURE13SVFWcGN1KzJNOVZkK3B4QkNUZ3NBaWd3bjJMbGRvNTl3?=
 =?utf-8?B?SVJPcnBod25DanZnaVlTRXRlNlc2U1h6UXJXRnBVVmxpNzMyVzRwYnBiMXhu?=
 =?utf-8?B?MGE4eDZCS1d5TjJrQkp1L29MbWdWdjdzVUl0SFo3RHFFOWxmeTJsRjVxMHVG?=
 =?utf-8?B?SEN2Lzg1TDlmY0tCNFhWRzExSTB4bTgyWm16QXNxblhFUmhmc2dPamV1SzZa?=
 =?utf-8?B?U205RC93Y2pFV1lQa0F6bGV0QmplcHJEU3BuMXJZR1JLZ1M2YklJNnc3STFa?=
 =?utf-8?B?bWVmTkxPZkRsQUYxS3VzVjlFaEhTK24zaHJNaWhEM3ltQVM1SUYzOHhyZWRG?=
 =?utf-8?B?K1cvaURjY0gyK0ZFNjg5aTdVeUZ0UkExQjFCWkNSTEo0SDhvR1pPNkNXbzFH?=
 =?utf-8?B?S3RqYnlPK2EvWVc4UTFOcnFpcnhXUHArdlNuckU3Qko0eWdmYklLWVFTa2RX?=
 =?utf-8?B?WjlCUDQ0MkN0WEhMeDV3QUo1eHc0Y1BRNXJmZnVuc0d3OXFPbm9oaFlnTlVr?=
 =?utf-8?B?WlFhSUpjTTZBdHpWdmFkRVAwSlNmQ2xYRXhuZFc3ZkE2SDdRUzd1UEtMT1NP?=
 =?utf-8?B?OXoydWZYTUZSb2NYK3dsTUI3U3g4SVVBcEhTaDBQcExSSlRReWExdlJCV0M4?=
 =?utf-8?B?U2ZHdkpUMDRSV3VTKzIxbytNYTZrNEVnRjVYeWN5Y2cxSUwxVThHNllDMjdQ?=
 =?utf-8?B?SUI1SktHUzhFSzBSNTc2MHgyY3Bsb1dkTURLQkpvdm9KbXZ4QlRza2xmQXlM?=
 =?utf-8?B?L2lEbWVaMEJ0T2dYT2NRQ1MzN3AwcFZqaDJMNzVzRkpIUWZjV1ByM1R6RFZn?=
 =?utf-8?B?aTlCeXFYbTltZ2JPcmI2TCs0aVVzK0ZUVHVFYTdIQWVIN1NleUUrMEwwSzZE?=
 =?utf-8?B?R3RvOFN1R0RyV0xWbmRmZFgxL0lKRnAxSTg1UDBSbVRLU0s2bmZYWFJMYjNZ?=
 =?utf-8?B?SlhXV3VZN1g4WGdTNU9BckdYL1pIRUZFRERHY2g3Q08yYTMvcnRuUmVpNWFp?=
 =?utf-8?B?QkNjZWs0L3J4cnl6NGplMm5CUGtzTjRDeVI4UEQ1UHZYRHlEdVFoT293V1Fj?=
 =?utf-8?B?TlorbkJXYkZjRlFuWkJkVkpNTzdxeTlLcXJwbjhPU2pQWUpQcysxdjFSSFFv?=
 =?utf-8?B?OHBid01BbkxWNmVGbk5va251VUs5YjlvajJBVHkrQ3gwZGloUG5ORHlYS080?=
 =?utf-8?B?SUdtQWx2SDV1RGRRcFhhNmw3cW1IeW41SFNpczFHQStUcUNzTHdtdm1JQ3hw?=
 =?utf-8?B?cVZvZlNZeTJWOGpFaTdtMVg2VVdnRGlEZGY3bSs3cTZ6aFdka1doM2RPemVQ?=
 =?utf-8?B?YWpUcDBYNndjUE5kck5haDJZVDMrSjlVTmlSTERydmEyY1VuWFRMVzhibUtG?=
 =?utf-8?B?bWJWKzVwUjFJOWNHNnBydVNYMlQzK1lLMWJDWngyb3ByY0FMWjE3WWp4RHlp?=
 =?utf-8?B?RXNhT0srOHdZY2lMK0pNeENrdFRNN2J3ZVNvZHZ2OHppYVRBOVNNcERweUJl?=
 =?utf-8?Q?fJC8acC80zKuZ0HRSttm/8U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1474e1bd-5d95-43b0-7d61-08de1aea501b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:04:40.5584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LR46rs0rRT6xSbW2EhuFuChuWo2dLcbyWSSYVAJ8k7SgxHjh8ZngC9X4DHIzHEoR1V8nX/vPISFTz2YLJmw2urIoxbY2IzSyddejT7n5l+KcLufniX63aJl+7wdmg/K8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
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

On 30.10.2025 20:40, Venkata Ramana Nayana wrote:
> Current gu2host handler registered as MSI-X vector 0 and as per bspec for
> an msix vector 0 interrupt, the driver must check the legacy registers
> 190008(TILE_INT_REG), 190060h (GT INTR Identity Reg 0) and other registers
> mentioned in "Interrupt Service Routine Pseudocode" otherwise it's block
> the next interrupts. To overcome this issue replacing guc2host handler
> with legacy xe_irq_handler.
> 
> Bspec: 62357
> Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

Please add the Fixes tag.

Fixes: da889070be7b2 ("drm/xe/irq: Separate MSI and MSI-X flows")

Few nitpicks

s/an msix/a msix
s/it's block/it will block

Rest looks good.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> ---
>  drivers/gpu/drm/xe/xe_irq.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index e5ed0242f7b1..024e13e606ec 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -897,22 +897,6 @@ static int xe_irq_msix_init(struct xe_device *xe)
>  	return 0;
>  }
>  
> -static irqreturn_t guc2host_irq_handler(int irq, void *arg)
> -{
> -	struct xe_device *xe = arg;
> -	struct xe_tile *tile;
> -	u8 id;
> -
> -	if (!atomic_read(&xe->irq.enabled))
> -		return IRQ_NONE;
> -
> -	for_each_tile(tile, xe, id)
> -		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
> -				   GUC_INTR_GUC2HOST);
> -
> -	return IRQ_HANDLED;
> -}
> -
>  static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
>  {
>  	unsigned int tile_id, gt_id;
> @@ -1029,7 +1013,7 @@ int xe_irq_msix_request_irqs(struct xe_device *xe)
>  	u16 msix;
>  
>  	msix = GUC2HOST_MSIX;
> -	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler, xe,
> +	err = xe_irq_msix_request_irq(xe, xe_irq_handler(xe), xe,
>  				      DRIVER_NAME "-guc2host", false, &msix);
>  	if (err)
>  		return err;
> -- 
> 2.34.1
> 
