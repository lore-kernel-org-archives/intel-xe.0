Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD134CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 20:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6216D10E23A;
	Tue, 14 Oct 2025 20:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3zldbTe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB7E10E23A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 20:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760474386; x=1792010386;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=99O7K4krRYt56q5fFIswOa1wJeUrq7nz6IfK5Q/l2fs=;
 b=Q3zldbTeyzaxmo19QiCOfHO2bDbCOWE9TQWXFjbIKBZRyJ+e9IbpYcE/
 /rUcmVOopvg98vzFulcYklof/LyxqRi44hPxCMG4hota5cDqKMw6eguK5
 VBQ4QC4lgPHAUW41fsmANNx0bQ2yQJo8JrtOyBfnT661JNaS4CJb7p+2D
 G+T9cLmUbFoFhz6xuCKPqD+geebworAHmSIwBRXRqNu8SZV7Ek3+zVmOH
 qaHqiT432Z+ewFGUQcCbmBRIo+52fy7X8cPj+XYVxI81rE3j6qxSx0PUU
 qTfcVKLRGp3vfLXjxwLawJpPyBZTffKujkcnOTANksTuUYD6iL5Bl6ZiQ Q==;
X-CSE-ConnectionGUID: i1sMt8bXTnWjFZUYHM/c3A==
X-CSE-MsgGUID: NgrHMHGERPi0kPfUEzbl0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80276849"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208,217";a="80276849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 13:39:46 -0700
X-CSE-ConnectionGUID: YszJmd4KSVSGRirsB7ho3Q==
X-CSE-MsgGUID: oz06DhECR1ijy1vU8ifKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
 d="scan'208,217";a="181198119"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 13:39:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 13:39:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 13:39:45 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 13:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvlYRpnnKv5nybzu90ZGvszmrNwRZF7RnNjka0o3tLmtkrilI3zJnYe2bpGMY5j5veYbree1xsrdts2EIaCJAIp0rW4M56vhvxOQU1FjKWCd2CSZJCsU41mdiyNugk7TbwNhxsruYUMLR64+Zo/8Jqi28lUWIrwkPXCinM4EiKsSFVH7uw1OnBbJbyHuci/pE/8I3dCzQpzPnmjwmlCLZWqACmTSLUtpsYW0AGdv0h521rmdzpm/mlJ9rJ0fJBA7LmiDFNRNAgYKvokudaoETYnHauai61xNSFfWLJoshA3hHtgytpDG1g2k42Mf7JjsHISsXaGlQ5uE0/7boWcimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11ga3nArTXhYt8mD9EAN3Wo7r1Ks0wn0cqKvlT3VuSQ=;
 b=YrmESK81TQM6ljkqMr9B+rVyxj827IYEwZyxIeqCfKc8X7kqpwaEjyPpcxREroOQhl8wmKHkeIvf+071Xrw7ivEtr46S6Cq1gt4nKL7D3aIB/IHDZ1Fid8d1ne8kIz4VfaJDUkPbGlhQF1B9yUPgb8hXwS7WDriFsM4J3aU62UViXSqhiTJmMoS83CJ7JOgq8rlDhzEBTqQrQM8WxOTuTgYvtcdps9WDc7f03sMmfpvKnR/I9TmwLqDW1GZ3jI9o2r/Cc93aBhrSmL4+DsnombOMXC0p2LGAzJUiHkvurt8ot1r6HEgpwJv4AIXag/QdKwdIJS27eZwnQhw0aNF6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CY5PR11MB6485.namprd11.prod.outlook.com (2603:10b6:930:33::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 20:39:42 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 20:39:39 +0000
Content-Type: multipart/alternative;
 boundary="------------5qLIV5lFr0pWpJzR6t4s03Z6"
Message-ID: <b8d280c9-0930-4fd1-a933-c59a89f299e1@intel.com>
Date: Tue, 14 Oct 2025 13:39:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Eliminate RPe caching for SLPC parameter
 handling
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20251013064214.926115-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20251013064214.926115-2-sk.anirban@intel.com>
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CY5PR11MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a1a081-7fe4-49d5-6956-08de0b61cbfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amkrZ2FyVzZCa0FsYkFDTWdhdlBMbjREcHlpNXdUeXIxeUZ3N1pDWXUraXZo?=
 =?utf-8?B?WWlWRC9EQytvMzBqMmlkS0V2UTBjaFpBTHo1TENjek5xYlB6MHlYazQ4T2FD?=
 =?utf-8?B?WFpJdUV3ZncxSFpYSGJSZ1NpNDA1alYyd1plR1FVTWliYVUwcEtoOWR6RDNj?=
 =?utf-8?B?RVRWNklhbDRhZStZQ2dLemhMSUN3QWhoaVp0NjhrR1hUZ2xjR1pybjhyTkNU?=
 =?utf-8?B?VDEzUnFuVUcrWXF1cVZmc29mcXF3amw4M3F0empTWGRiT1VMQjlGSy9sV1k1?=
 =?utf-8?B?RjI5MmhwTTcrYm5Ga3ZQV3R2dCszTEJxM2xIVmlCdUlXY2RuS2xyZHNhWlBC?=
 =?utf-8?B?NVlrQTJxak9wdXA4aFNZQjViUm5vcm0rWXlpOXI0WUIwZUFRTEt6Z0tXdEVG?=
 =?utf-8?B?Zyt6MVJwMnltQzBQKzE5eUIrUGlqRDdkTU9kblI2ZWlnRm5tQmFLN3ZJSU53?=
 =?utf-8?B?bHN1WUkzRGovUmdoODdRdmx0MUVMYnJROHJ6d3NJbml0V0N5OW81NEp2cXk4?=
 =?utf-8?B?TFl2UlBqSnBGbHNqV2V3ZEdWRjM0ZDlncHBaRTNJVjdUWnQzU0trYUpTbU1B?=
 =?utf-8?B?TmNPTWdjeHpkZG5TU0cxaUV5SjRFa2Z0Rkk0alJpTG9rd1FmOERnTCs1TXJm?=
 =?utf-8?B?MGVuMEFDNk1KSFR3Qm1nZ21XcmZiTitoTVU2d2dLOG1ydUZmUVd2WWlXaURI?=
 =?utf-8?B?bUVpc1F5dmpQOU9GRXlSMXozTUhPdGpPOWN5NzBWUlI1RFZnQmc5ME4zL0JE?=
 =?utf-8?B?Ylp2VHEyYmlQNVRMN1ZUbTdocndKMzY1bGRPdXVKb0NWaFFVQTNITzJ3dElU?=
 =?utf-8?B?Zy92bEl0Tno4SytNZ2pVVW5iR3ZBb0poQ2t6NENoYWlpVzBIcUhjTk1YNUJp?=
 =?utf-8?B?Tk53YWxmSkw0WUgyeVZtVmNPaGg1d0hkd3M0Y1BKRmVuUzRQaU1sWXQzbzg1?=
 =?utf-8?B?UUFmYnhKMkZwRnRnMEFTUjhHeUtxNjMzeU84bXFWdWRESUhMTGQrWnBQamk0?=
 =?utf-8?B?NStSY1l6QXlYYTlPR0g3VTMrY3U1WEZiOE1RTnYxVUFtRmFwT2JKSWpDOG9R?=
 =?utf-8?B?VUU5ZzAwZ21mTmFsWVg1dC9oQzZ5OW52bVhyS0FSVVdkQkJsMEo5akYyamQ4?=
 =?utf-8?B?bXgxejhMck92dVhTYzRNQWcwU2JtWmpldGFMWm1QVllHK1Zmd2o0TzFGMFdp?=
 =?utf-8?B?aThuSmJNMlVJRHRyaDZuWm5XM29yTlNYVVNyUmhvQWZTUEp6YWhGL0lTRkwy?=
 =?utf-8?B?b25MbGNPUHVxd1dWQ0h4RjUyZ0k3dzhKZ1lQekkzcWs1YTJtTlRoeXJJckpJ?=
 =?utf-8?B?SW44blZkU3JqdjJJZ1N4Y0Y0a0FjV2E3L2xvY250N3JQTml1UVJtWmxTcjBH?=
 =?utf-8?B?M3FlSkJ5NG5yMlFjVEY5bktqMnl4c0pNR3k2MVJkNnZCMTV1K1N1UlgyLzV1?=
 =?utf-8?B?ZHdCNXV2Z2J5UWhCckNxalZEREFna2RqZEhhNVoxejBENXpXRlU0SW1vVHNq?=
 =?utf-8?B?UDJoVDJabTZvL0wzNU1rRWZvTHFsa0RXNHNQZjJCV0VZdzltQm9hM3orQnZt?=
 =?utf-8?B?bEV2UncyUFNXYXBwWlZXTVQwei9JR2xBTTl3VUJvb0dSL2N4Y3I5RGJhdnI3?=
 =?utf-8?B?cjRYRjBmcitIbzMwY09Hdk5NS0wxTWZBK3Z3Q0lSNS9PbXZnbkgrc3Q5K2pz?=
 =?utf-8?B?SDc0WFRDeXg5U0JaN2Z1QklrWmJ5KytJSGxDeDI1dDQ5K2ZuazhkNk90a3gx?=
 =?utf-8?B?SjhzaDVqMy9kVjR1VzBIU1Y2RkYvYTJoTk1rem5qZXUrVDhwcmxTSjliYnBD?=
 =?utf-8?B?WG9pcytSUW1EbERMeG9yMG1qcEp5eEtvWkl5QjV5R0xzVXNJSUhUKzdaSnVj?=
 =?utf-8?B?UVo4djNLN1NmOWhlazNNa2MxbStyK0Nqb3UvcEZvVFdEaUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdxbjZnby94S0hwQXBRcUVQelZMQjRvaWJONGVzOW4vSlQzN29GYmhRWjZa?=
 =?utf-8?B?WFdtd1pjckhuM3g4S1JVU2FpaWp4ejRqZmpFeXFFWko2SmJTTnJockNGUGJF?=
 =?utf-8?B?YjVMcXltVnJaSk5EajVnN1ZRbTFKdmhrTXJwWXZqMjIyYzd0RDQ4NVNaVFFD?=
 =?utf-8?B?cGcxRXlZbjlmSDhRVmpDdWFlcEdIRGdKTTJsT21rd1hzb1QvU2ZRSGlxVy9R?=
 =?utf-8?B?Ty9kSStWeTJ6VGVUZDdYeUhCbTNFRHdBSTBHT21uekxzcWxkcTFSN2tTUXVF?=
 =?utf-8?B?bTZCSXI1N0dPeVRtQjR0MWhBaFIyMVhQN2poQ3NwUXlPOVhNUFlEMC9yOEFj?=
 =?utf-8?B?ODVNWFhtUGZYTjhZQVNkVG1kck8yY0hYRE9yUzZrT0hSNFBDYm5JN2xuMExl?=
 =?utf-8?B?WjR2bEpLQllvMW5mVVZDd21hN2pTNGJNSTdwYnpoMUxKYjlrbGRUUVE0bnVR?=
 =?utf-8?B?KzdHbW1UWWFVRW9QUEVxdy8vMzBXUHpDeCs1Q3FxMGkxb2hCd0NnVTRmclJr?=
 =?utf-8?B?QnVhSVBlMldXb1JScFp1RlRuZW5jTWJWamNDRHFSVmdkVDdKZWJlZGhxQzJv?=
 =?utf-8?B?TXFWR293V0JLeFNCQVRnWnZSbjVHcEptOHVOdSsrVTl0bEsyYmgrSXpQYkVY?=
 =?utf-8?B?dGhmZEZyTld4WmE4cFpUMlA1dTNNbHlxb1NXWXNhKytyMmZVdGgyY3UyTEVv?=
 =?utf-8?B?ZjhVMGRqNjJQa2QzYitaRkpMUWV4S25oRmFnUFgxTnJ0UDhQZmJweGdXZE5Z?=
 =?utf-8?B?dUlpMG5uU2hZR3hPQVNxNUVwZFpHUmpRMGJnVVhIWmJ0dmw1ZUhNbjBSMzlm?=
 =?utf-8?B?akFxTzdtMCtDcWNjaTAzRW9ITy8wVkh3Rkh5OHlXMUZoMDhyWWJLUnU0YjJo?=
 =?utf-8?B?aFA0cjVUZzUzdm1ZOTUvaHZjcU1GdW1DbHcvS1hPUXkrS0orOHplOE5Od21q?=
 =?utf-8?B?YlhOT2djT1dyV3hwSHNZME9ud3Fkblh2dWpoVCtMZ0x3RWF4UDA4UWNxUEdK?=
 =?utf-8?B?clNpODhsRGE1d1ppcHhLVlZMZnczRWFpT3pmbTJrT2xWMnBNQ0tYRDkyTEEy?=
 =?utf-8?B?SHhhQkNJdjAzSEFjT09UTW4wRHFSMXNqdzhidktRVVY2allLT1UvVEZIOUdk?=
 =?utf-8?B?VGZ4WVg4Nzh1ZE5YNWVqTXRsK1M3Q0tYcGNQMkhhdFVwVFR4dElhS3VYZXBz?=
 =?utf-8?B?cGhLTy96UjcvNnRXc3NZTm1FMzJaeW4vUnN5UWJmdkEzTWllNlBPL2JNbDZG?=
 =?utf-8?B?UUJpRTdreWdrcGsybVRkK1JSVjYvbi9QT1BxZE5Mc0N0WEthM0ZRcXNFWE56?=
 =?utf-8?B?bm12aUhvcDlleWZNZUx5S1lsYTFOcForV21EZWJGenZLcXR5R29yY09Ja2Uv?=
 =?utf-8?B?NXd0VVdDKzYxVjZBVElxT1YvMHpGZmpvWDJRWDNZVkIvRE9KN3ROYWoxT0Zi?=
 =?utf-8?B?dG00RDFRWUoyalNXTTFpMUdFTU4vanZ5S2pyQi84SHBRS2VUWnZqS29hN3l0?=
 =?utf-8?B?UEZOL0hyRXlaUkN2VnR2Y280ZXhCWk95OUJsUDRLTldsNUJzaHcvV2hoNyti?=
 =?utf-8?B?WkthaFBjek85K2MxbnhoYjJrNTA0Q2gzK1BMOWdaR0VsUlg5a045cUFQTnQx?=
 =?utf-8?B?RzNRUUFEK3NERExiVzhpVXBBSmU3aXMzOFNUcVFoaDlzNnVIYTF3azBoRUd0?=
 =?utf-8?B?WWNBMkRGdkk4OE5Ga3BtWExYSmJrYkg5b3Q3L0x4ZEkvZGEweXZxRmVGanNt?=
 =?utf-8?B?TTd0ZzJ2MHpjUnVldVN5bHVLblJ5K2N4aFpyZnZkVytZc0RMOTlzNDZKcGdC?=
 =?utf-8?B?TjE1V3loRFFsbWd3VWErOUYvbUhJdFdoOU5GMVRORnZQMEV4TFpVUTMrdE1P?=
 =?utf-8?B?N1ExVCt6eUR2enRZenNNVnU5ejdNT21la05ab2VRVkVNVjJEdmF3UkF3U3A3?=
 =?utf-8?B?Nm0rcEVkRWgwZEVDT1FEdmphQ3Y3WkF1Smx0UnltVEIvZk1UUmRYYVZFbFJt?=
 =?utf-8?B?RkpiY3hneU9PNjJsNVNNWnFuMVVNSEduY1EzLzNiRjdhN2M4aEYybkRHVzVs?=
 =?utf-8?B?cDBlYXkxTFlpb0hQaWR5QnZ2SHNoK0NhdnFXYU4wUlJ0eGtodmUyL21jbmNK?=
 =?utf-8?B?eC90VlFyTGIraERMSEdydVpjMFhUOFk1U3dnTUNYdnczV2RVV2NEdzZHKzM1?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a1a081-7fe4-49d5-6956-08de0b61cbfe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 20:39:39.7495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ls1+TLrFap4ZkURUKLEEdpBbqf/xpDt0RM9Z8Pj03LNOpaarxQNStUt5QupEjEi8VBL6ELVrzriwv4D0pypahbzqb0vvTRAGyF0jQzsr+sU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6485
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

--------------5qLIV5lFr0pWpJzR6t4s03Z6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/12/2025 11:42 PM, Sk Anirban wrote:
> RPe is runtime-determined by PCODE and caching it caused stale values,
> leading to incorrect GuC SLPC parameter settings.
> Drop the cached rpe_freq field and query fresh values from hardware
> on each use to ensure GuC SLPC parameters reflect current RPe.
>
> v2: Remove cached RPe frequency field (Rodrigo)
>
> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 36 +++++++++++++++-------------
>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
>   2 files changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3c0feb50a1e2..2d1d5121555e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   	 * Our goal is to have the admin choices respected.
>   	 */
>   	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < pc->rpe_freq);
> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>   
>   	return pc_action_set_param(pc,
>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>   	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>   }
>   
> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 mtl_get_rpe_value(struct xe_guc_pc *pc)
while we are here, can we rename these local functions to 
mtl_get_rpe_*freq*() and tgl_get_rpe_*freq*(), since both these 
functions return the decoded freq?
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	u32 reg;
> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>   	else
>   		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>   
> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>   }
>   
>   static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> @@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>   	}
>   }
>   
> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 tgl_get_rpe_value(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>   	 */
>   	if (xe->info.platform == XE_PVC) {
>   		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>   	} else {
>   		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>   	}
>   }
>   
> @@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   
> -	if (GRAPHICS_VERx100(xe) >= 1270) {
> +	if (GRAPHICS_VERx100(xe) >= 1270)
>   		mtl_update_rpa_value(pc);
> -		mtl_update_rpe_value(pc);
> -	} else {
> +	else
>   		tgl_update_rpa_value(pc);
> -		tgl_update_rpe_value(pc);
> -	}
>   
>   	/*
>   	 * RPe is decided at runtime by PCODE. In the rare case where that's
>   	 * smaller than the fused min, we will trust the PCODE and use that
>   	 * as our minimum one.
>   	 */
> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
> +	pc->rpn_freq = min(pc->rpn_freq, xe_guc_pc_get_rpe_freq(pc));
>   }
>   
>   /**
> @@ -560,9 +557,16 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>    */
>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>   {
> -	pc_update_rp_values(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 rpe_freq;
> +
> +	if (GRAPHICS_VERx100(xe) >= 1270)
> +		rpe_freq = mtl_get_rpe_value(pc);

just return mtl_get_rpe_value(pc) instead of storing in a local var?

Other than that,

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> +	else
> +		rpe_freq = tgl_get_rpe_value(pc);
>   
> -	return pc->rpe_freq;
> +	return rpe_freq;
>   }
>   
>   /**
> @@ -1021,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>   	/*
>   	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>   	 */
> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>   	if (!ret)
>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>   
> @@ -1339,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>   
>   	/* Bind requested freq to mert_freq_cap before unload */
> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>   
>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 5e4ea53fbee6..f27c05d81706 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>   	u32 rp0_freq;
>   	/** @rpa_freq: HW RPa frequency - The Achievable one */
>   	u32 rpa_freq;
> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
> -	u32 rpe_freq;
>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
>   	u32 rpn_freq;
>   	/** @user_requested_min: Stash the minimum requested freq by user */
--------------5qLIV5lFr0pWpJzR6t4s03Z6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/12/2025 11:42 PM, Sk Anirban
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251013064214.926115-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">RPe is runtime-determined by PCODE and caching it caused stale values,
leading to incorrect GuC SLPC parameter settings.
Drop the cached rpe_freq field and query fresh values from hardware
on each use to ensure GuC SLPC parameters reflect current RPe.

v2: Remove cached RPe frequency field (Rodrigo)

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166</a>
Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_pc.c       | 36 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3c0feb50a1e2..2d1d5121555e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 	 * Our goal is to have the admin choices respected.
 	 */
 	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-			    freq &lt; pc-&gt;rpe_freq);
+			    freq &lt; xe_guc_pc_get_rpe_freq(pc));
 
 	return pc_action_set_param(pc,
 				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
@@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
 	pc-&gt;rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
 }
 
-static void mtl_update_rpe_value(struct xe_guc_pc *pc)
+static u32 mtl_get_rpe_value(struct xe_guc_pc *pc)</pre>
    </blockquote>
    while we are here, can we rename these local functions to&nbsp;<span style="white-space: pre-wrap">mtl_get_rpe_<b>freq</b>() and tgl</span><span style="white-space: pre-wrap">_get_rpe_<b>freq</b>(), since both these functions return the decoded freq? </span>
    <blockquote type="cite" cite="mid:20251013064214.926115-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg;
@@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 	else
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, MTL_GT_RPE_FREQUENCY);
 
-	pc-&gt;rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
+	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
 }
 
 static void tgl_update_rpa_value(struct xe_guc_pc *pc)
@@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
 	}
 }
 
-static void tgl_update_rpe_value(struct xe_guc_pc *pc)
+static u32 tgl_get_rpe_value(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
@@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
 	 */
 	if (xe-&gt;info.platform == XE_PVC) {
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, PVC_RP_STATE_CAP);
-		pc-&gt;rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 	} else {
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, FREQ_INFO_REC);
-		pc-&gt;rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 	}
 }
 
@@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (GRAPHICS_VERx100(xe) &gt;= 1270) {
+	if (GRAPHICS_VERx100(xe) &gt;= 1270)
 		mtl_update_rpa_value(pc);
-		mtl_update_rpe_value(pc);
-	} else {
+	else
 		tgl_update_rpa_value(pc);
-		tgl_update_rpe_value(pc);
-	}
 
 	/*
 	 * RPe is decided at runtime by PCODE. In the rare case where that's
 	 * smaller than the fused min, we will trust the PCODE and use that
 	 * as our minimum one.
 	 */
-	pc-&gt;rpn_freq = min(pc-&gt;rpn_freq, pc-&gt;rpe_freq);
+	pc-&gt;rpn_freq = min(pc-&gt;rpn_freq, xe_guc_pc_get_rpe_freq(pc));
 }
 
 /**
@@ -560,9 +557,16 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
  */
 u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
 {
-	pc_update_rp_values(pc);
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 rpe_freq;
+
+	if (GRAPHICS_VERx100(xe) &gt;= 1270)
+		rpe_freq = mtl_get_rpe_value(pc);</pre>
    </blockquote>
    <p>just return&nbsp;<span style="white-space: pre-wrap">mtl_get_rpe_value(pc) instead of storing in a local var? </span></p>
    <p><span style="white-space: pre-wrap">Other than that,</span></p>
    <p><span style="white-space: pre-wrap">LGTM,</span></p>
    <p>Reviewed-by: Vinay Belgaumkar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com">&lt;vinay.belgaumkar@intel.com&gt;</a></p>
    <blockquote type="cite" cite="mid:20251013064214.926115-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	else
+		rpe_freq = tgl_get_rpe_value(pc);
 
-	return pc-&gt;rpe_freq;
+	return rpe_freq;
 }
 
 /**
@@ -1021,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	/*
 	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
 	 */
-	ret = pc_set_min_freq(pc, min(pc-&gt;rpe_freq, pc_max_freq_cap(pc)));
+	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc-&gt;rp0_freq, pc_max_freq_cap(pc)));
 
@@ -1339,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
-	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc-&gt;rpe_freq));
+	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
 
 	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 5e4ea53fbee6..f27c05d81706 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -21,8 +21,6 @@ struct xe_guc_pc {
 	u32 rp0_freq;
 	/** @rpa_freq: HW RPa frequency - The Achievable one */
 	u32 rpa_freq;
-	/** @rpe_freq: HW RPe frequency - The Efficient one */
-	u32 rpe_freq;
 	/** @rpn_freq: HW RPN frequency - The Minimum one */
 	u32 rpn_freq;
 	/** @user_requested_min: Stash the minimum requested freq by user */
</pre>
    </blockquote>
  </body>
</html>

--------------5qLIV5lFr0pWpJzR6t4s03Z6--
