Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40447C982FE
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 21:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3B410E07B;
	Fri, 16 Jan 2026 21:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGFVobye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8377610E07B
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768598345; x=1800134345;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TqHkL/WquRO+zS+ln7mC/1xO5SnkWBfQHqZxfGj/0YE=;
 b=BGFVobyeiDxi+KFYEGpMMgX0r1MY5627HmgxzS1BwNLhcSMoNAPWLzA3
 1MsYSe2i1D51u9euHofGvXUKidnFw7TenJlRk3xzckEy8vWtBdWQHSbBT
 ERORwrkSc4l0keLhb/xFRpl7SJ6q0LZyFAXvuZNo66p7TtAb/lOTIETOM
 1I/5licDFHvaR4qly0nDXhdD256ZtHQFi59lilJkXfcfABcb+BrE/ES0J
 zokkBwjsepf6caZUteAdErw/vfVuQop7iQKwhWNZ+Rk2xZu4uVkbZR5Ku
 0C5cTiYKrUqwlUg+8ZmLkOpsiEJj6ItKDp7wifSVp4H+sNRhF0xPEn+aG w==;
X-CSE-ConnectionGUID: py7cS0/+QAi5kABiZ4Y8LA==
X-CSE-MsgGUID: D0JRQhvgRxKlsW5GV8x6EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80639316"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="80639316"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:19:05 -0800
X-CSE-ConnectionGUID: S16UrKEOTmWPwAOGzOYdCg==
X-CSE-MsgGUID: TrPL+I8bSty5GgfhSPC8UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="205136596"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:19:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:19:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 13:19:04 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:19:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATnUoyusw3nRxjPFS5AYKgWAiQHFhdx6K8oXmZy/RmHGSYgt6O2TQGPNbzNdGoRcLp8E4++epyqGczfb+9ZvB6d/k477GB5Yp1437kEEMaHAY++YUAOi49rfZ5BnkZqCGtHrIXnsSuOBhsjqeq8ZGrwgFPDvFkQo6xtl9SU8R0AjKKuSLxCcCmHgywmLyM38Jb+nPPsQxytNqpvVhTQvrNfq4fcYE5J4/R/PeCl3ZvoO5Oxtx61ZEWFgsmS40XgeEWJjbAHu43kJ/P7kykUBk0IwpQHo05/40LaenefaW+w/Y55D8/ZUf2rqt4XOUG+k8Ho4GIprVYapaGrLF3r5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaHa6jGuyppwfcmNcSRpRUNHM68MeVRhDU1GFtW8J8Q=;
 b=GQEkl6SSxubfU2kHNX43we4s6yh2oXttc6kbQx45nunUulDUgfenSEFE9FwQ4FUiIQSBtaQ5/q7FL4kQEXG91x4bYT/NXfTZxbeSNNhOhP6FtR6RD67fP8SmijN2sl1btslM9bQa9nLuZR018ifQ5uMa5z4kdU8N5ykyTprf7P3xDDmsNiNYG1nieQmeJ9IKmy5FpkzIEiSCy4yU8WO4XWHM9+qKtO3GVLaBv1yPsXWNmd4ZkUMphnxFPZ7pmec9L1mUggxqi2vsHokHgfpC0Knw4M2O+OOJchWCUu2xOG7I4UMYUkvYDNp8tUSP8oimjuEMLET0C9DcNnHoTNFCQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7978.namprd11.prod.outlook.com (2603:10b6:806:2fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 21:19:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 16 Jan 2026
 21:19:02 +0000
Date: Fri, 16 Jan 2026 13:19:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <aWqrRAVxFULdHqRU@lstrano-desk.jf.intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWoPKWxu7zIqZPog@fdugast-desk>
 <c0d127d4-4219-4d92-8398-e971a815822f@intel.com>
 <7379f92d177312e90ff27df2a088897a1da920cc.camel@intel.com>
 <aWqjOp2yaIIxI287@lstrano-desk.jf.intel.com>
 <c71e46b5f818f3ef5c1d255b65d6fe4b7489804c.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c71e46b5f818f3ef5c1d255b65d6fe4b7489804c.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 6615f6fa-3715-43ef-155a-08de5544df29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGtKWUw0ak1vMTZpZ0N1cGRjSkUyTmxBZUdYMEEydVVsR25UeXNBNkxiS3Vs?=
 =?utf-8?B?Qzlra0pOT3M2MG5QQmE3M1hRWWFBZXpqYlVzSkVrUzBNSjgyV2xTOTBCdi9p?=
 =?utf-8?B?Smp6L3NMU1J0bjVManlCdkNIYnZGaEY0ZzJEVWNrak1heWJYTlJSWXM2cVRo?=
 =?utf-8?B?VmtOKzFrQnoyVWtiNXRQTGdBRGdYNUMxMXptSmcrWDNUcUZ0cFBQWnNzYUhQ?=
 =?utf-8?B?NzlCSndQckxrVUFBc2RhczdTSUQvVVlaTjJQNGw5N2VkUGZjMmxybjdlcmJX?=
 =?utf-8?B?Zzd4eE9pTFJSeStrY0c0NzZucnRjYVdsY2JjMzF3VU0raEsrUVlVODBmM3Y5?=
 =?utf-8?B?Zi9yaXFPTDU3Wnc1N3VuOVZUeTdKQi9xTmlOODNZRGdCeXJDWjArSmgrb1NF?=
 =?utf-8?B?OEp0SkdzcjdZTDhacnFZcGN2bHFUM0s2d0taOTBsbzVwWEFFektVY1lOa3RW?=
 =?utf-8?B?cHJ0UC9lZStmTVhVY0R4VDgySWdhZlE4L2lqMEhtRWx5VU1tMEQvTU0zSkxz?=
 =?utf-8?B?MkdQeHMxVXZNWGF6QkdjTmUydHVZMDJ1bkZQNjFiY2dyMnlJTEF0VUMvZ0FH?=
 =?utf-8?B?K2VDeXJMaUhtK3pNbmNzb3YyMUtUQklDZVovcXdndzV0cDZMT21pRXF5bXcv?=
 =?utf-8?B?YUFHMlJSOXFGdVRFWlh4cS9aZXlwWEFRNjc4TWRNWkJITGg0TEZHUlFBTnBq?=
 =?utf-8?B?M3BtOGhGV0VXSUkxRmRrVmhYb3pPWkhlYk5RS0U1Q2xKYXFOQXVOZUFoOThC?=
 =?utf-8?B?OGFLY3dzRW1lNE9kbFdqbWJRbUJlSVNQbU13b0ZFY1VrSUs0d3l0L0xLQ2RF?=
 =?utf-8?B?VGRQSjRHVmN0WFQydVdQZnNGZVlITGYweXdhdW5kU1VaRUlyL1NhN1lWSERp?=
 =?utf-8?B?cWxBeUpiZVArQmVMQ2xLVE8wcEEvOUNNYkFuS2JKNFVhVGpyZ0cycDRyTHBR?=
 =?utf-8?B?cGhHU3dRekN5NTEzOEN6UWQvOWU1YWNENk4wT1l5cmgxTFZtenpXQ3p6RG5o?=
 =?utf-8?B?T2c5NE5Jb1VnSXRhd21kODRwUTZDcWpkWGlKTUVuQTVtaTBVbjk0MnVCNFRq?=
 =?utf-8?B?WXp0WCs0RHRuSGdzblg0dmxsOFJNanVwMDR3cUM0eUd1VXZraEUranZlWHNN?=
 =?utf-8?B?anptWDcrYmk3bUU2anozZmdIWHhjMi9lZERsMGVLL2VFbjYwSktHcjVPMVRl?=
 =?utf-8?B?UEtIRG1JM1RETXpGdkw5MWVxMDBvdWlJM0VUclZYTnlnY2x2NTh0ZVc5UkxR?=
 =?utf-8?B?bFNCakZqU3FSNWNjbnZnd1p1ZE9MejR0blNlUG9xNlUvU1JWWkRmVW5qVFZZ?=
 =?utf-8?B?WlFGVnJ1c05ldVNUVXkvanRPZXRPaGtRQUsxV1RjVFJ6L2hxTDJYV0R3Vytn?=
 =?utf-8?B?REYzUTJBS0RjZHZVK2FtTDhrT2FTZlhiTDQ1a2ZFRmFHUWtFcHE3YWkvRE5y?=
 =?utf-8?B?Y0I4VzlEY2ZiUnBFZGRZNUZoSFlhN253MW5HU1RSQStka0I3eWFCQUFzdTRq?=
 =?utf-8?B?L0ZxdGE5VG5DenQrbURLM20rY1BYN0VMdVBqbUE4c0FjR01KbHp0S1hISk5I?=
 =?utf-8?B?SXZJWGhsZndiR25oNjR3NEtqNXp2N2dIYVZDNGVYaHBrWVZDbURQS2RnUytU?=
 =?utf-8?B?YkxpNkFBWkNqWHhkNEtSd3lMdWFDMFJidzdicXpGaHRsMXV3M1lxU25GcHVW?=
 =?utf-8?B?T0pxNU9mNmUxR1VOQncxQldwd2ZHS29lcE94STlNR3cvcTB6VC9IbEdMek5W?=
 =?utf-8?B?MkNoTnFqVnphWFdSMjhhbC80QXJkUGh4S2tOUEpNSXNIS0JjbDBNU3dqUGdj?=
 =?utf-8?B?RDVEK1JzVTBZd1JoTi9lYklvQVMxNVFib0RvTDkwb3dZWk4zeUsvRms3SnJN?=
 =?utf-8?B?WG5vUVk3M09VODErSWVzRWttZ3MxOVZwTDR6N2tJYmlIbk9mdmtiYnVOOVN1?=
 =?utf-8?B?d09sMnFuUHYrR1ZxM2xiTkcyT3ErZ1pLejdZSU5QV1pmVkJseGhsRit6cVNr?=
 =?utf-8?B?akdqMjRhMWZ5L2hubXJCTWVBQnFoUDdUaXRVbkcydEpPYm1lZmVPTDNhSHF5?=
 =?utf-8?B?RW5tejZPREpFWDNBNm1pQzB1UTYvUUozUWtnWkVYZzZTN3JiZkxENTNxdVl1?=
 =?utf-8?Q?xhms=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3JRY0NLbXJvSzhBK0tZRitKUFZCVEdNWm5hYVZXb1lPdW9kQVdha09DcTdU?=
 =?utf-8?B?MUFURjNNMVhmVXJ5VmJNRWhrNDVTMWpaYTB2TUZvd0JVSG1iVjVNK2U1TW8w?=
 =?utf-8?B?WXVuV0pFNFdWZGtOazVFRGR1VFV5VWtnb0VUbi85Nzd0Z1hpMktnWGZQQnps?=
 =?utf-8?B?UVI4bFg3TXlmL2lScEh4akxIcWxWMjZ0a1RkaDVkS0I1SlRIM3l6Z1Ruc0Y5?=
 =?utf-8?B?ME1LWnM3RGhVOUo1NjVCN1RwL2JXazNuckF6WVMzZ1BPamh0Y0JkdVliTzBi?=
 =?utf-8?B?YXV3aFVqMmJhT3llM09DNm1zYndwTHhVMHFUT05XemRLRE16em16TjhRWVJL?=
 =?utf-8?B?MjBJMkJvaitrN2NTKzduWStRUG41RitLWUJTVTJCZkRERFo1ZzlxSjB6Uk1j?=
 =?utf-8?B?M3hqNlc3VW5nWTJvdjVtajQweXpyL3I5M1lEZ2FyZ2tMNWVsbEwyaFM5VXFr?=
 =?utf-8?B?M0kxZlZXUFhTczNlMVBqV0l4RUk2VllnYkhJOEFmT0dEVXZjc1lGK2hITXFN?=
 =?utf-8?B?bkNCaC9pRGhoSkZXdmtFYnRSSThvRzVCMDc1am9hVWsyOHpsN0JpMFM3SUNP?=
 =?utf-8?B?SW81TXJrOUg4WmFHMUd1dDN2QmxnKzR0VWE2M1VXOXVkdlM3MTY1Snl6TDhw?=
 =?utf-8?B?UWlEeDdpd3U1cDduSU50N2x0QkNDeEI2ZG5pUk1GRTJJSERhMkJnQXp6R3ZE?=
 =?utf-8?B?eGxhTzN0aFpPdmhvNkd5QXhkQ0NjRjlEdHZoT2ppSkZ6dnY4cW0vRzA2RVVG?=
 =?utf-8?B?b2FkdGFqTTd6VmhRbE0xTzFzeE9aM21wNXFMVzVsUVdZcVpmbmppaW9HcFBq?=
 =?utf-8?B?Z1R0cFNiM3NXUEgzellNcE5vbzB1eW1CekRrZHB4QXUrLytoS2VmdGZLdkNi?=
 =?utf-8?B?MWppaHJYOHVVNjdOejhlejMzckF5VGZzLzhJNFNyWDJibWNuUlpSbzMzY0VH?=
 =?utf-8?B?Sld3M1JOVkV5YnhQS3hXSUFYcTR5TVgwMlZuUXM0SzBsRDM4YWdWOUpLQVZM?=
 =?utf-8?B?MGRtMGh1TC9xaEM5c0E0bXJIODhNdVhML0hNYmhTWVFGRFljditkSXRucHA2?=
 =?utf-8?B?Y1NCUlA2SkVlbGZvQXFkeFQ1OXlqbi9WYzQ5ajIxRlRkeWRjTUFtcmNvSmha?=
 =?utf-8?B?KzdEWklmNGtjTDJXc3VzdkZQYjV2cWJHZ1hsV0xRWkw1eTkxYlRkckJNVHJP?=
 =?utf-8?B?VXRvV21EaFJOcHVUYkx1TkNxeVpCMGtDMWFsV0NZcUprN05CS29wejRnV0Rm?=
 =?utf-8?B?NXhjQmJQNkV0bVFzUFcwc3RraERSN0NVbStIb1VmckZ1RW5zVVV6K0lXbXEy?=
 =?utf-8?B?bWJMeVd5V2MxQXAwUTdaNElqV3RiSlVJQk5ZV1BxNVk5Y0E3MnpabnJkWS9Y?=
 =?utf-8?B?Qm9UZTBMQU5zK0lleS9TVjdqT1JJemlVV2w2ajNsWWE0TGhwU3M3M3F0aDJq?=
 =?utf-8?B?RzVXRyt3NE5Za01meXNWN3lqdGtwamNVZlh5SkxCVWluek1kT1JDdGZhS1Rz?=
 =?utf-8?B?cHB4SldhdU01STA5R3YxMytmcjd1bUpQemU4akIzTnRqTmtuNmRHRUhkVnRG?=
 =?utf-8?B?cDdLNzdvcHNVdGFMNk9RalRDUEFKeEkrek9Ndzc2TEhsSHhLWCtpZDYvUTFC?=
 =?utf-8?B?OURFRURsNk1YYi9JV3ZtR1FEUFBUK29BZ2REV2dzT29NN0M4d0tXNENUblVG?=
 =?utf-8?B?SmdUNWVybndMWnJ4ZDRqeGNkK2hEQ0NVWldxZEpDaWpxVkZFdnYrT3E5UG9m?=
 =?utf-8?B?NXhadkUrQlY5WDhUVlpDZENwN3ZRS3NvMHFjWTJoYm05YkJzMEpNVURnQ1RD?=
 =?utf-8?B?QTRlTDNoM3d6Q2dpcjBKaGxyd1lKbkpMNWp1MFBuNUFUdEhZaHI0c2NVWGdM?=
 =?utf-8?B?L2JvVWsyQWc2TVlKeTZSLy9VQ0lKOW80aWMzU3lTd252TDJvb1pIa3Nab0h6?=
 =?utf-8?B?Q1JxdHVDam5ZQlFPbVlhbWxPMGVTV1dFN3I2MkVOaEQvdlJRaSt3dHU3dzJm?=
 =?utf-8?B?Z1E0alBmSXhxc2lqSE5wa0JwSUxOZlArTHNma3E2UHdJVXVwSDE1TExmdk53?=
 =?utf-8?B?WW9sVmJmOXpXYU51T1U4VCtJSUl5eFYrN2ZBcm1rM0VEM2duYUNQQUlJMi9t?=
 =?utf-8?B?NWVBb0FTblo1dS94bkVKeXJXOVR1Z0EwM0VDZkpuUDdOOGVxSTBTMjA4NWh5?=
 =?utf-8?B?UnBqQnFja0VGTTZpaDJMWEtoTWlOa1VmTEZ5c0lKWTMxSmFHd05LYmQwM0hC?=
 =?utf-8?B?WldTSDd2MGFsTmFyQ1VLemxMWEF3SDNJL09IalFRVWFpR0hzN28rbmVXeGhN?=
 =?utf-8?B?N24wTmlBUTk4WFltR1lCWGQ0WFBWa2ExSHpGZ0hrZUxzMjdVLzgyZWhQdDd2?=
 =?utf-8?Q?N5KaKrEHzI7g6U4M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6615f6fa-3715-43ef-155a-08de5544df29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:19:02.4687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djX1QaXjcOXJxCWn9MKJfpR+cagfmcQm6q+EPZyZqdTwagSDnhJX5hHD+UAuW7rcUP592GzySlla7IkovhqyyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7978
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

On Fri, Jan 16, 2026 at 02:07:57PM -0700, Summers, Stuart wrote:
> On Fri, 2026-01-16 at 12:44 -0800, Matthew Brost wrote:
> > On Fri, Jan 16, 2026 at 12:51:46PM -0700, Summers, Stuart wrote:
> > > On Fri, 2026-01-16 at 08:43 -0800, Daniele Ceraolo Spurio wrote:
> > > > 
> > > > 
> > > > On 1/16/2026 2:12 AM, Francois Dugast wrote:
> > > > > On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński
> > > > > wrote:
> > > > > > On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost
> > > > > > wrote:
> > > > > > > If a batch buffer is complete, it makes little sense to
> > > > > > > preempt
> > > > > > > the
> > > > > > > fence signaling instructions in the ring, as the largest
> > > > > > > portion of the
> > > > > > > work (the batch buffer) is already done and fence signaling
> > > > > > > consists of
> > > > > > > only a few instructions. If these instructions are
> > > > > > > preempted,
> > > > > > > the GuC
> > > > > > > would need to perform a context switch just to signal the
> > > > > > > fence, which
> > > > > > > is costly and delays fence signaling. Avoid this scenario
> > > > > > > by
> > > > > > > disabling
> > > > > > > preemption immediately after the BB start instruction and
> > > > > > > re-
> > > > > > > enabling it
> > > > > > > after executing the fence signaling instructions.
> > > > > > > 
> > > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver
> > > > > > > for
> > > > > > > Intel GPUs")
> > > > > > > Cc: Daniele Ceraolo Spurio
> > > > > > > <daniele.ceraolospurio@intel.com>
> > > > > > > Cc: Carlos Santa <carlos.santa@intel.com>
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > ---
> > > > > > >   drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> > > > > > >   1 file changed, 9 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > index a1fd99f2d539..cd645ee400b9 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > @@ -282,6 +282,9 @@ static void
> > > > > > > __emit_job_gen12_simple(struct
> > > > > > > xe_sched_job *job, struct xe_lrc *lrc
> > > > > > >   
> > > > > > >         i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > >   
> > > > > > > +       /* Don't preempt fence signaling */
> > > > > > > +       dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > +
> > > > > > >         if (job->user_fence.used) {
> > > > > > >                 i = emit_flush_dw(dw, i);
> > > > > > >                 i = emit_store_imm_ppgtt_posted(job-
> > > > > > > > user_fence.addr,
> > > > > > > @@ -347,6 +350,9 @@ static void
> > > > > > > __emit_job_gen12_video(struct
> > > > > > > xe_sched_job *job, struct xe_lrc *lrc,
> > > > > > >   
> > > > > > >         i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > >   
> > > > > > > +       /* Don't preempt fence signaling */
> > > > > > > +       dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > +
> > > > > > >         if (job->user_fence.used) {
> > > > > > >                 i = emit_flush_dw(dw, i);
> > > > > > >                 i = emit_store_imm_ppgtt_posted(job-
> > > > > > > > user_fence.addr,
> > > > > > > @@ -399,6 +405,9 @@ static void
> > > > > > > __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > > > > >   
> > > > > > >         i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > >   
> > > > > > > +       /* Don't preempt fence signaling */
> > > > > > > +       dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > +
> > > > > > IGT tests which calls compute-walker, then bbe are
> > > > > > asynchronous
> > > > > > (don't
> > > > > > wait for completion, pipe-control is necessary to wait on
> > > > > > compute-walker).
> > > > > > 
> > > > > > May you try to put arb disable after emit_render_cache_flush?
> > > > > Thanks Zbigniew, xe_compute_preempt tests do pass with this
> > > > > change:
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > index cd645ee400b9..d8cceab97fa8 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > @@ -405,11 +405,11 @@ static void
> > > > > __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > > >   
> > > > >          i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > >   
> > > > > +       i = emit_render_cache_flush(job, dw, i);
> > > > > +
> > 
> > Yes, I also confirmed that emit_render_cache_flush() is the
> > problematic
> > instruction that hangs when preemption is disabled.
> > 
> > > > 
> > > > The pipe control in emit_render_cache_flush is preemptable, so
> > > > having
> > > > that before the arb off switch invalidates what the patch is
> > > > trying
> > > > to 
> > > > do (i.e., no preemption points after the bb completes until we
> > > > signal
> > > > the fence).
> > 
> > Yes, disabling preemption after emit_render_cache_flush() makes the
> > render/compute engine change in this series useless, as
> > emit_render_cache_flush() is preemptable and the goal of the series
> > is
> > to avoid preempting if the BB is done in the fence signaling
> > instructions.
> > 
> > > > 
> > > > Why does disabling arbitration cause this specific pipe control
> > > > to
> > > > hang?
> > 
> > This is what we need to figure out. I looked at i915, and they have
> > preemption disabled around sections very similar to
> > emit_render_cache_flush().
> > 
> > I ’m raising this up the management chain to see if we can find an
> > owner
> > to debug it, and perhaps even get an SV trace to figure out what is
> > going on. I believe this series, if working, would make our stack
> > perform
> > better, so it would be good to get something functional here.
> > 
> > > 
> > > Are we enabling/disabling preemption from the batch too? It seems
> > > like
> > 
> > We are not disabling preemption in the batch, only in the fence
> > signaling.
> 
> This was exactly my point. From bspec, MI_ARB_ON_OFF "remains disabled
> until re-enabled through use of this command." So if we are explicitly
> disabling before the batch is running, we need to explicitly re-enable
> if we want to be able to preempt later for whatever reason.
> 

We enable preemption after signaling the fence. See emit_user_interrupt().

> That said, this command is also marked privileged, so honestly we
> probably want to make sure this is enabled for batches that might need
> preemption. MI_ARB_CHECK on the other hand indicates it can be
> "programmed in a ring buffer or batch buffer".

I don't think we ever want to disable preemption in the BB. Mesa relies
on object level preemption which is preemption in the middile of the
batch. 

> 
> I don't think there's a way we can only apply MI_ARB_ON_OFF only to the
> fence signaling and not the batch signaling.
> 

The i915 disables preemption in fence signaling like we try to do here.
It seems to work in the i915 but we immediately hit CI issues in Xe.
This the part we need to figure out.

Matt

> Thanks,
> Stuart
> 
> > 
> > > the batch preemption control should be owned by the user and not
> > > rely
> > > on the ring configuration here (which might have other intention as
> > > seen here).
> > > 
> > > Also would be interesting to know if the compute/render UMD
> > > compliance
> > > tests are passing with this change.
> > > 
> > 
> > Agree.
> > 
> > Matt
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Daniele
> > > > 
> > > > >          /* Don't preempt fence signaling */
> > > > >          dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > >   
> > > > > -       i = emit_render_cache_flush(job, dw, i);
> > > > > -
> > > > >          if (job->user_fence.used)
> > > > >                  i = emit_store_imm_ppgtt_posted(job-
> > > > > > user_fence.addr,
> > > > >                                                  job-
> > > > > > user_fence.value,
> > > > > 
> > > > > 
> > > > > Francois
> > > > > 
> > > > > > --
> > > > > > Zbigniew
> > > > > > 
> > > > > > >         i = emit_render_cache_flush(job, dw, i);
> > > > > > >   
> > > > > > >         if (job->user_fence.used)
> > > > > > > -- 
> > > > > > > 2.34.1
> > > > > > > 
> > > > 
> > > 
> 
