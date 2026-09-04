Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F10C79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 08:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE2310E4EF;
	Fri,  4 Sep 2026 08:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kB9AanEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A092210E4EF
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788510361; x=1820046361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BnAXY0ynHPBRYlgrsHYfh6lZ0AF8bsNVOSvtxCLOzSM=;
 b=kB9AanEX4ANQ9bMU6ThGpiAGlns2eeowBnorj5L3mqBMUissRgE6TIPq
 eQ3E4CQeJQdj9JAEVV8RNBnzb9ScUOQMYNALqJungrid2hvX27vLm0sHA
 Lgvn2jiXb0l66OJm3Reg3Gmfm3hjyit3EftXO1DPlRmDlXg/HmIn3P91L
 uhFuw5+opTNQezhx4o7jzEl1xzI0NsBsAnvG8+hFpsI7hdtOPkV0wEIpI
 kQBh7mqz6QzXC7HGVwnFf+41seY9vOfgE5wu5hvKCxDwI7/uk3VVhWyQZ
 j6NmE1RqhG5Qu7FPZPQ6Z3TZ7pg0HZaIUfFnHMaEV40w0zaDBz1xquNOS g==;
X-CSE-ConnectionGUID: jCn2HvN0TYejoBKpBljr5w==
X-CSE-MsgGUID: G1L3fjmeRYWiLovuMwUG2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88888623"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88888623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:26:00 -0700
X-CSE-ConnectionGUID: CtMalXY4SXiiLJ+lGxbD7A==
X-CSE-MsgGUID: qBGMrzc9RS6FML4ER1NYBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="265637513"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:26:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 01:25:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 01:25:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.31)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 01:25:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMEE4mlCLxGwaU6Daxob63eFh7UlM4CujoA81cgqY80MeBj7Y74UxHkIZXwtC4QXOu1ST9NPji7C0V+Xl5aQZ2kTJqQppgXDTMzFyn7ytWUxsKth4PhUiuGn8S/p0+nPXcJd4UrtKtSG5ZJxHzQjOt2LZqsu6iLD5YOS89x5iQaQqHezyryNuYCnnHaWA8976pktSv+2fkynlN/Wt7lshLXsk+UdZPchuD82C/qjsluI0Wj8O4bloUjTpG+ndzvWDE1KwfoskKsh+AnbzoXvzbpzSYZFb6sbZBVzEpLTblrRnPQHS6HLmOjZJL2dIaF5L8/OFpBbDmeklW7n0ZLn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/HxQqHnuSvt8TldXAndPgWRcCIDsJzcIU6Zjk2ia18=;
 b=y6rXtYW0wzTplGfDO3Z7Z+6kdh/dHjGIK8NAGuYEtcVoTW574ZQlB1MT9/Y4UjJSmLN5wdoC20O1FkdqRQrAA/+b4JNT8QFgJGKPJZogptUFv5CGedVW12acVI/mKVTD1YAXLMQ3JSz3YMEfhP/ZvrwJsF9tcv5Mrv//aI9oWS/SRHFSk7qJdYpoRvFItwt1IWBpfAHcO7UQ0foqU3xtwl2lG+bK2YvPrhNwlLyvnFffq2BYan3w2itys3FaIxbnUwgoGK1Oj09P7DqnBuwaDMAWNl0vd4tMq3VKz7atROAX/tfNp/s2HwsRfgERtjAsq8GgU4y0qbvxDAv4sK6sqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ2PR11MB8515.namprd11.prod.outlook.com (2603:10b6:a03:568::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 08:25:50 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 08:25:50 +0000
Message-ID: <87216310-a723-43ce-ae62-6b85d2525bbd@intel.com>
Date: Fri, 4 Sep 2026 13:55:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: "Tauro, Riana" <riana.tauro@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
 <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
 <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
 <292aaec1-662d-466a-83a6-dc820dace637@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <292aaec1-662d-466a-83a6-dc820dace637@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0298.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ2PR11MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: e009fbce-b5a8-49a5-679a-08df0a5e20c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: yWWyl1UiMhwtkGHkbJhjnjlBABQavcMkQlF6+CthYvQF2tCzV1VoP/DDrmSBDlsqIW+QO9pEwSkJiFaG3MwVJFjEwAFapRU12ob232wUBN1UdNjMzhAH/9JBGMnQwUgIdcJv5xxotfJyFMGUXldR7IxR8rk20zaHdTcRAVyWRwKeKOffOBK3sLHNomQHtvBX5dAHNfhVTdPdfCkFEjO/pyMWTKDTEjut7qRt3J2UpowBmnViax+nyZ5TQC6XRE+cGkNnq2vy5Aetan2MV3AyxkDU+Yviy15mwtNDdtPta0598RH+Q8kC6zlXU5iYgctAOP9v+3h+eZvibzLvjrmVh9wn/9fO+Qbzy/xwH1ywDW0yovr+qIMi0af+Nv97/5tM6EGIUCHifecpiMMQXoweep2xF0DIXb04F1dsDnvCkmsnFYE/EOaHyogqIE4MoU9jbffTtXAAIIG+geNwK4vMTnjIkfU5rbVmGpYJrRRCIP7ozrnN+v0IyoyPaz7SV8o+5QtTJeDRl7wNlUY1Cvm+VMvsCSK1Xuc/dleNcdnRQfCIBSuSuBnX7UzwBsi5DLEKeMSLQwg9Qj/bBD+bR9G4r5uL5ke2Axgsz4bsKj8xXsrQkkF9eBrndkcc9le7+X9tOFfvOygdIyVaMRHiolhtmzRHfJF2GzKHz7sDL/ejp6k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blBGTVdPR3B3eCtuSUo0NC9mRHBNaTQ0SUJPTFYwSjRLMUIxNFIzUnMwTlRT?=
 =?utf-8?B?UWJmdTdpZzFHSFVud2ZZQnZEbFR0MEZQQ3lseXg5cXU3Mk5GZE9HWEFpcTRT?=
 =?utf-8?B?Mk9BN1Q5cHRnYStxaUtRZWQweVEybm5hem1RSXhYL1E3aHEybzF4WXpBZWR5?=
 =?utf-8?B?d3RKMUpBSUtMWDA1UldILzJkVy9xTlA3UDNDRWlyampwOTE5NW9TR1puek9m?=
 =?utf-8?B?NFlVV1FYNjV6eEFNWm8xellCUGhMVVo0SVEyRXNKOC9EcDJON3Y3N0psY0Vh?=
 =?utf-8?B?dUNoMStPcVRWbEpuaVVYUEhPUUtkekJlSnhLeUdnUkphdTVrSkJ6R0J1UlY2?=
 =?utf-8?B?UW5nWEJOK0I2MjhWdW5uSEVBUXYvLzZuWW9KN2FiVTJGbWlUa3BKYTd3VmRV?=
 =?utf-8?B?NFZVMG5RalNoMXVRRWwrMFBINEJDc1R3clRaOStQc1dvaklBZnYxWVhFRlJ4?=
 =?utf-8?B?ek1xaWVQK2lOVlpTU0N1N0FxeWp1SGhmTU5YV01CTndrdkI2V1R6TmhJUFor?=
 =?utf-8?B?S295ZGk0aTRkUnBOZE9nMWRnUkhoSy93Z2kycmpVVnY0eUJydHY1NGY3VG9k?=
 =?utf-8?B?RkpvU3Zyd3VDcVlseVdvbFZqYTF6T05RRndkaVYwOEg1MXNXRytGTmhiTXVz?=
 =?utf-8?B?amdxb3hQZHhTb29MRWlqcFM5T3pnaXFOTzlLY0ZQaXliSzZMQU1WM3RWV2lz?=
 =?utf-8?B?YjlEMHI4SXg0UWxKME1PQjV1aFdxWjBvbWN0YWw0NDhHRVBvaThPdXdVSnAx?=
 =?utf-8?B?ajZqS2YrdTNTdHFUR01Qb1FFL3BIMzNsMGdTeUxxZHVJSTdpSy83cFJIMlow?=
 =?utf-8?B?cXhrRlNSMExmSU9YczBBTUUyY2hkSmIyRldYbDF6b0FNN0J2TE8rcDgvZjhq?=
 =?utf-8?B?RURzOEdxK1pVTUplRGw1d1BrU01aamxQVnlRSG5xOTQ4YXNBb1IybHIzemhs?=
 =?utf-8?B?dDBiRWcvVHgrQXJ1TU9ZdkxwQ09CdHhLUEx2OWhPODE1a052YmdSNW1PRlV4?=
 =?utf-8?B?Um9YdWtiV1FJTDhhMnNJRVBRd1VXNE5JQURtanIrQXdJd3NkZnpGNVJES1R6?=
 =?utf-8?B?Q1F6RDJ5OE9NTTVXM0tORnZkczR3eFFsMzUyNFVtcHdZK0lDTlU1TkdCTlI1?=
 =?utf-8?B?MGVoYnZnTkZvem5vL2JDTWRrdGtnaFMvMkN4NUE5dHVXUkZNVml6VmdTZzVn?=
 =?utf-8?B?TnFzbzJLbU10cG9TQnFjOUJ0cHVnUVNDSjhHeFNFS3pZSUdSd0dZNWVENnRj?=
 =?utf-8?B?VzV2d2hMZGkxNTZIckRhaGFBc0JxL25nWnhZWFNZVHptcDdEN2Y4cHpmamVM?=
 =?utf-8?B?N0VlSDF1ZVN3VVBraW0xQWdaeGlvaHUvalE0dkRhZ3U3WlhZZWxhRnpDeG9C?=
 =?utf-8?B?alZHTnRtb3E2VDdGS3RrNk02Mld3U09TY3hlczhVdjJmb20renNyRmFBRWQv?=
 =?utf-8?B?YytyQjZuUHRhamMwcXY3R1VqVjJIMG4zc0RBRmNwVWd3ZzBRYzRXeEhySzB6?=
 =?utf-8?B?VTFGaHJxcURMZFlLN3doQkNvWU5xYkFuSkN0QWJRTVAvQm14V2h6Rk1hSWwy?=
 =?utf-8?B?TW1rM1BiQWNEWVRXV2kzN1RsQmV6MU5KWFV2U2tGcmNOTExITFY2TGdYSDNO?=
 =?utf-8?B?TVdHSG5XRzM2bTRBbGxORlNXV09QcjZJSnowSEEweUJNUU1aU1Y4dUFha0Fi?=
 =?utf-8?B?b2doMG1JUU1sZjFLaEpNM0ZaN2RpbWcxTkhXZWZUMGdrU2tqcHNXL2xtV1N5?=
 =?utf-8?B?dHdvRmt2SWNDMy9pcHdjcVVBeGd0aTd2Z3hOaGdrK215WDlvUTQ1TjQ5cnFN?=
 =?utf-8?B?NUFrT1JHZTlzR3FMRUlsY3I4QndnbE5MRDhHOW5Hd1I2MGRXZzBSSVk4Mzhk?=
 =?utf-8?B?TG5MbnQ1N1cxeDZSdi9CNGZkV2xqbE1ENEtkdWNHRDhBL2pQR21tSWtxY2ZP?=
 =?utf-8?B?a1JxaCtTVWZZeFB4MVFueW5PdXlsR0FtdmMzZWNIOFdkZk82Y0ZrOE9wTVF1?=
 =?utf-8?B?RHpEUkhMTktEQWVPVEg0NGlMb3RocWZMTEJuRjBZTnd6S1RVSEpQQzg2OVh1?=
 =?utf-8?B?ajl2LzR3RkRNVzVJTVJCRWY5bk9oMmMzUU5xSW1BenNnVXFidDRvMDZ4akVy?=
 =?utf-8?B?WU95d0xjZ0VDSGxhTDd1b1NYaHIweEhIazMvU1ZkTTJhY3BPbHNmbTRCbGJp?=
 =?utf-8?B?VTd0ZlpSayt6b281UWFuTFlFUE9wQkRqb1FrMWQ1T0VlckIwQStZNVFJSXI5?=
 =?utf-8?B?ZlNMVEZRNGl3dU5ZZytHT1JMdzRKbVdETXkvLzlraTN4UmpZcUJjNzQzTHl5?=
 =?utf-8?B?RTgvUzI2NjZNblBLVTZITWhZbzZGZFYrQXl6Y0ZzcHJ1dm5Ebk1uUVZhQ2VZ?=
 =?utf-8?Q?pRdPorT6Vl4+Jr6s=3D?=
X-Exchange-RoutingPolicyChecked: kpqxaCMJQeYBHEDoRR3pVvPublUvarP3qhYdZq9axWfns64fFtu/bR1EWBSjxulxmdhkIjhB/EOn5bmA3NPnnZscjlAd1mUykqE/htu6Fs3g2ay2a/pg737GhruOZy6ZenLibVZDsVisbs4EtPg4HBG+9abSD3AO3JOISdKK/Jl1LwRGJUTZ5FlC+wng5OlbpE4+ZgdkDqvezEXrcZdugywxddPGegdDVQ69XX3mFeb6cJKbaPh13xbl4Tdi+3wARFsmY7GqPMR+N4l3FHpB0R2+lH205Ag7GRm/WTugY7EbVCNB/fXLQ43Cw7OeC4jgGyiaUOI3Wd+qGJecBflT7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e009fbce-b5a8-49a5-679a-08df0a5e20c0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:25:50.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDkAysYK5K/3qoPSukIPE3sPB/QMcWIjnR1aP1OkgP8CtZ3OuRmaXGIbTbusN8vrpXq/4GyozA8OdiosBD0ffhEYOON1xB1K8GJDwsC27UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8515
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


On 25-08-2026 01:05 pm, Tauro, Riana wrote:
>
> On 24-08-2026 16:34, Michal Wajdeczko wrote:
>>
>> On 8/24/2026 7:44 AM, Tauro, Riana wrote:
>>> Hi Mallesh/Michal
>>>
>>> On 20-08-2026 15:46, Mallesh Koujalagi wrote:
>>>> Make sysctrl_wait_bit_clear() return an error code rather than a bool.
>>>> and update callers to use xe_log_err() with the propagated error code.
>>> Bit confused here on the usage of SIGID. My assumption based on 
>>> documentation and discussion was
>>> that SIG ID is only needed for error logs based on severity and 
>>> requires a resolution which can be documented.
>>> Am i missing something?
>> from "How to pick a SIGID (the uniqueness rule)"
>>
>>   * A single underlying failure therefore legitimately produces a
>>   * *chain* of reports from different layers, each with its own SIGID 
>> -- e.g. a
>>   * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by 
>> the firmware
>>   * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, 
>> and an
>>   * aborted bind as %XE_SIGID_PROBE by the probe path. That chain 
>> lets triage
>>   * follow a fault from origin to final effect; it is not a duplicate.
>>
>> so in this case, some sysctrl timeout may eventually lead to a reset 
>> and/or
>> wedge and/or runtime-survivability-mode, and this intermediate FW 
>> SIGID may
>> help in any postmortem triage, and if we don't reach that final state 
>> then
>> we can still provide some generic resolution based on site and errno 
>> (COLLECT)
>
> What if the paths are also used in non-critical scenarios for ex: 
> sysctrl commands are used for
> general counter telemetry, gpu health querying and firmware status.
> Wouldn't this be lead to a lot of sigids in dmesg in case of some 
> unrelated failure ..
> Why not only add sigid for critical paths when we are sure it will 
> cause a chain of failure
> instead of these prints on every trivial command failure.

Ops I miss this.

I agree that we should not add SIGID for every minor or noisy failure. 
The intent is not to log every non-critical cases,

but to capture important intermediate failures that can help explain the 
real root cause. If we log only the final critical

failure, we may miss the earlier cases that actually caused the issue. 
That makes triage and postmortem harder, since

we lose visibility into how the failure occurred. The idea is to use 
SIGID only for meaningful failure in key execution paths.

Even when these failure are not fatal, they can provide valuable 
context, make debugging easier and reduce

mean-time-to triage (MTTT).


Thanks,

-/Mallesh

>
> Thanks
> Riana
>
>>
>>> How do these errors indicate the need for a resolution.
>>> Do we need it for all kmd logs with components or for errors that 
>>> need a recovery or can be recoverable?
>>>
>>> Thanks
>>> Riana
>>>
>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 
>>>> ++++++++++++-------------
>>>>    1 file changed, 13 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c 
>>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>> index e13eebaac1d0..ef847f0a8f2c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>> @@ -11,6 +11,7 @@
>>>>      #include "regs/xe_sysctrl_regs.h"
>>>>    #include "xe_device.h"
>>>> +#include "xe_log.h"
>>>>    #include "xe_mmio.h"
>>>>    #include "xe_pm.h"
>>>>    #include "xe_printk.h"
>>>> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>>    #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>>>        FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>>    -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 
>>>> bit_mask,
>>>> -                   unsigned int timeout_ms)
>>>> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 
>>>> bit_mask,
>>>> +                  unsigned int timeout_ms)
>>>>    {
>>>> -    int ret;
>>>> -
>>>> -    ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, 
>>>> bit_mask,
>>>> +    return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, 
>>>> bit_mask,
>>>>                     timeout_ms * 1000, NULL, false);
>>>> -
>>>> -    return ret == 0;
>>>>    }
>>>>      static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 
>>>> bit_mask,
>>>> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct 
>>>> xe_sysctrl *sc,
>>>>        struct xe_device *xe = sc_to_xe(sc);
>>>>        u32 ctrl_reg, total_frames, frame;
>>>>        size_t bytes_sent, frame_size;
>>>> +    int ret;
>>>>          total_frames = DIV_ROUND_UP(cmd_size, 
>>>> XE_SYSCTRL_MB_FRAME_SIZE);
>>>>    -    if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, 
>>>> timeout_ms)) {
>>>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>>>> -        return -EBUSY;
>>>> +    ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, 
>>>> timeout_ms);
>>>> +    if (ret) {
>>>> +        xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>>>> +        return ret;
>>>>        }
>>>>          sc->phase_bit ^= 1;
>>>> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct 
>>>> xe_sysctrl *sc,
>>>>              xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>>>    -        if (!sysctrl_wait_bit_clear(sc, 
>>>> SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment 
>>>> timeout\n", frame);
>>>> +        ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, 
>>>> timeout_ms);
>>>> +        if (ret) {
>>>> +            xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment 
>>>> timeout\n", frame);
>>>>                sc->phase_bit = 0;
>>>> -            return -ETIMEDOUT;
>>>> +            return ret;
>>>>            }
>>>>              bytes_sent += frame_size;
