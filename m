Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE1F3C9AD
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 16:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8E110E5D3;
	Tue, 24 Feb 2026 16:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGDvsWDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCE510E5D3
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771949567; x=1803485567;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AKD5RjTDIrPg4qA+lqPSJa4wNs2Q40ezDx2pYuv7l1s=;
 b=NGDvsWDsnsGGhO4Ba+nTm6Dhv4/DTZEl2H1/TvIEcUL18I7fV+5NLMQg
 CefI91DvSsLjwo5y3enuB9Fe/7+ada8QfbzvOXJDAwoxCJaN67YMoW5NA
 vba8raKVteCIej13KeWibMifiAOZiggZqK8zG/w3eDbbN4gcAws3xyTOg
 +++KH8GlHuEndV4aN+wo9y4Oiif/h4M4vGkCj6JeEYw1OoZAiWaynig/N
 lF0fWwyBSgXc/NOomN1x59dyGUE3XJEuB+IyCTlgWWMahV7uEsMTXKgul
 n47M3aaWq7sjcwAzvLXovF59a525r2z3tPqqme1sDQ9cRtQslw3r5ZxtK g==;
X-CSE-ConnectionGUID: U20Ajc+KTKyZtMPRg0z22Q==
X-CSE-MsgGUID: imDlbw8GRnCThFHTseJFSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="60547682"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="60547682"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 08:12:46 -0800
X-CSE-ConnectionGUID: xG/rswIoR4SQ+kyQs3YJwQ==
X-CSE-MsgGUID: IR3K5uZTRY2SYGKt4Szkpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220546921"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 08:12:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 08:12:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 08:12:45 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 08:12:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdi2Ta0z2QU7EHCIx5NavCI2gs/X8kGvGXwWsMZ5tQk3GtRkD8hG/T2S/Zk1zH9yEuyAkxa1C1SWwliNAkhU2AiMth8NW1qLbXrXSXA6NJ8YbfzbVuNFpYmhyJLR6so+yzXPyAxLxSmE5F335v/FPA9bT/mbUl3yByWByedSX5jFzHtZns1c0tjNwQM6HZpNTHNoS5gg0eelqxjx4uD6gtK9M3gZYlbXdSsDI7i4CaNakbVlW/D4sStlwqMIYvnv0yQX4jPGES/mdRKJ7TVtCoeIxYHulC9zs5aOIgSw8NW2nkpCQpNjx6sHkS6PbsNCBQKB5h04R2AkEvpozTqwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YymGtzIHXQdi1OEQqwTDADpGCS6+Klm/PflMYgwDuQM=;
 b=vrp0ERztHYUSRiu+r2RlRXO180Rs3eol3EkSRToKm7gs3Fz+yasCzwuiIFE9C+BPsqRDBpYnbdwGT789zUs2+XONZf8DUE7DpAFUi5oOWhYuDeWUrMw1r5Su6j6Dp6YfDIGb3njMOs7HVgddRBahOJ39X+gQ3mqAiycNYrXAncPnHplCkaI4t/WyFR+JmrHYOdvVJshFvI9GR/+aAh8XYwqZXi1dTIEEqakEyD4W2SA+C9Yf0YU7SAfpThwnh6CNIpI4eaWk8WK3fIHbW8h/O18PHdnLF1FABzFHGdm2XbmkA+c72iwKEjE3UGmYchD8FCOTrngOw779IJRF0yEV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB9533.namprd11.prod.outlook.com (2603:10b6:510:39f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:12:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:12:43 +0000
Date: Tue, 24 Feb 2026 08:12:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Split H2G and G2H into separate buffer
 objects
Message-ID: <aZ3N+CwyKRARMW6m@lstrano-desk.jf.intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-2-matthew.brost@intel.com>
 <3033abb2dfe6755ff3559a480e0d21b5665436d5.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3033abb2dfe6755ff3559a480e0d21b5665436d5.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:303:8d::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: 81be160f-5094-437e-f19d-08de73bf8aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWtkd3dGTEtwMEpZazJTenJhUFVVMmdrQkQ5WG1kY3VWZ1JMZ0xEcFVzRzNL?=
 =?utf-8?B?VytLUFZzaGRnOVJLMjFyMm1ZMnhHa1lMNjZCeVYrV3QrLzBSL3oxK3R1TWIr?=
 =?utf-8?B?UU5tam1Cbk40NjhIb05pWW9TdzVtUHZWNFExNkpMZ1I5aXhkNGtQRWlxRmVs?=
 =?utf-8?B?LzBQSXVIRkVVNXlYVWhMZnUzRWQrVVBBZ21va3Bub3lKWGVLcmJ1eXNKU0FF?=
 =?utf-8?B?dHBSem1EMEM3TmZRazBkZWw3eG40U0ZSb2VvUDhrOHlrOGhWUU44d1RhZUV5?=
 =?utf-8?B?Z3dOOG9oL0UreUNIS3F5emdHNGY3THRWOTZxbVBRRSs3eFM1Q3ovREllbjdJ?=
 =?utf-8?B?ZDMrK0tHNkx1TEFKalR6Q0tESlhVblVqTm5ESXBqbWExQStXOFlVZ3EwTlVK?=
 =?utf-8?B?Q051UEhZRjRjZTVMZUVPM1d1VzNHUjdUWnNOM2JHdWJ0ZktFWGxweGtaMFVK?=
 =?utf-8?B?M2hzbDl5QTluMFY0WFJwVWFFTW40SGdDT2ZPMHhzSUg4Y0Y4OHVsOSs0VnNl?=
 =?utf-8?B?WkZqOW1ZUXRwd3hYcXVlT0dvbjJzWlRicGUzdXcxMXo0QVRLVUU5U25kVlZt?=
 =?utf-8?B?RVdoOXorWjBOcUdRdi9VK2liRmcybURhWnM3ajF6SlpvTlRVWEU4eDU2QmFS?=
 =?utf-8?B?RkE3RHY1UkJnRUJnT2dza1hURkZ5bmJvbFo1V2YzZlpDODlZMksvRDVvWjBC?=
 =?utf-8?B?MHlYOFdtQ1RFN09qV1VyZ1FUYUVHVTNtZWhhTTZKc2E3NS9UVjhsamNqKzBl?=
 =?utf-8?B?OEZvdEVvRkJxY2tiaTVPcjFyQndFQW4rM001YlVjS2t0ZVE3TTdla2tlcFBO?=
 =?utf-8?B?WHZTY2ZTK08yeDJSV29DOExSVnU4SkFZNjNHNUhabTEzSXNwRHhocWJyNmV4?=
 =?utf-8?B?aFcrRmg1R2VBOEFCYkZtb2pPcDV4SnBJZkw3QnRXN3BnVXhCNzdJa0lPMkwz?=
 =?utf-8?B?TDNReFNiNTM4Tk9FMTY5aGg0MXlucVFjOEJWTGMxWmJpY1VJUWxYakJTdFdW?=
 =?utf-8?B?TGF4QUdJcVYxZVozVDNLbzZTVHlqZUlFWFZ4bmYyYUdlREZFbVgxSlFDajdt?=
 =?utf-8?B?QTVFMGpmVjVTVGFyQjNEVGx0OGx4Z0ZCSUxUUVp0T0xaVTZtOGE3WHo5TWpF?=
 =?utf-8?B?UHJYS1AwYkdUM1FRb0tQeUdhTFh5Zms2MURWdCtMbnV4eGNIL3RVYldTeitG?=
 =?utf-8?B?UGNpNDB3czVsS0RoYVp0TTZhYjVwNHdmemhhNEJCRnNic1dIZkZZMG9Qckx0?=
 =?utf-8?B?N1ZZZ3RybERydk5QMCt5aVNJeDJ0VXdmNW5XU3hERUhDcVFUcUZLaHdJUU9Y?=
 =?utf-8?B?bDVxbzI4b3VWN2YrU0hYdlVkOEhWNk1qSWtJeGY1OGU5dnJaT2tWNUlJOHJW?=
 =?utf-8?B?azRCU0UxWE9SRU90cHFHNkRwMjJ1bFNqdGUya0hxNFJ0Z1BSeXhSdjBPNVp1?=
 =?utf-8?B?R24zcTlHZi81Z3dzNnd6cmkxMXl1b0VQSktibktYYWNyNGFNaTAwbm9GOWJC?=
 =?utf-8?B?NExSUXZFRWJCbm1sU1YwaUt0RHRRTjJ3c0xILzNMRm9ZVkRjSSs0UkVDTitC?=
 =?utf-8?B?Sk1JQkZSK1RZTjlLTjV3VGZ1TzU2L0lxSzVVZkUxWFdLblZmbUZLSUhKSUNG?=
 =?utf-8?B?MVYvS1l6OWk5alN4WDcyYUx6c2FNMHVQWEpacGV6a2pXZnA1VllpV2FKZEZN?=
 =?utf-8?B?c3JIaUtsYTBtK3B5WEFkekx0cW02QWpmaWZvanVMNFlGVklvb0diUTMrMVIr?=
 =?utf-8?B?Q21aMWVoK0w5THNoNDMydnR3UkgyaG0rV3RJM25aT1JLRkhzbndzTkFiOHRX?=
 =?utf-8?B?UlAyNFRjdDVlRDdSN3VTRWVGL0dQRHEveExNNVdZdmFDQ3UyZ1J2eXAyUW93?=
 =?utf-8?B?VUVIODFQK2VaUjgyRW14N05KdGU0MEJQajFhbGVwWjExTXEwMlNOSk1FcmZu?=
 =?utf-8?B?UWdrdFJiYXcrMnU2bVJMY01XWHVaU2lxSnJYNnUrOVJzWVhVS2Z6N2p1WGpL?=
 =?utf-8?B?S0l6Vk1OK080TThpUHZoVW9md1lzMlpZaldBTnRVbkVFSlh5UXRNZWgrU01B?=
 =?utf-8?B?L1hHOWxqOWo1d2hsb092VlFVak1ITEpiRTh6cUEyK3JYNnorNlR4K1h6bVMy?=
 =?utf-8?Q?gVMU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDdJKzNlTnFuTE5tQmJtMG5aNnFSa3cyTUNDZnozazdYelNYelZPd3laekJp?=
 =?utf-8?B?cTVRcWp4WDhmTXpLdnN2WWRsRUVOTWtXcGNONGhyYnlDcWdZbllWcDlUWFE5?=
 =?utf-8?B?bWdNcVRTTTE0VWJlSHNtcWF4MGtIYVpBYzB3WmpwU29HdEVaM0tvcXI5QVE5?=
 =?utf-8?B?QmZIWFJFRDJYd2hXNk5CbmlwQ2VlNElQaXArUzc2NkJESVFwckEyK1l5UU1H?=
 =?utf-8?B?NkEvNUE3eUxKZkxEMFRmdHdseExtd2NqcDMxb2FvWnBYSlpwcHIxM3lsM0hX?=
 =?utf-8?B?clZlclNlTG0rTUZOdHI2bFkzTXE1aTVMQWhwM2Z0bXZQQ1htWVVoOVhFa3cy?=
 =?utf-8?B?ZDJuVk56c3VaaHJONGxxaXQ5OU81Nk83S293V3BDZThKNjZ1UlJ6bVFNdnUw?=
 =?utf-8?B?RGhyZ0NiZUZuS0VIalRQMzluOUpFdjJPajVyc0VDTFUyTEoxUVRNd2E3Y2do?=
 =?utf-8?B?aVl6Z1l3ZWFkN0VFZnZNNTd2VkxjRVB1NHJyemhWdkNUN3E0R0VSZ3hrTFpy?=
 =?utf-8?B?UkpYT3pGUFVtYkFnU0RsMGttelBGbUtxT3NGaGJBNGZuTFR6Zjl4WEZ6T1Bj?=
 =?utf-8?B?S2lWazNQZXpRY3praVZ2WkNsWUdjNnZRMERmNlFlMEhMWDZFRnRtQUFHRXNN?=
 =?utf-8?B?cVUzREpnMklGRjRweWdLNGZ3V0x4ZTVFeHU4bkZTWVpQVXU3Wk5nNnRpWU1O?=
 =?utf-8?B?SXE3V1BHbmx1aWxMNkJEcG81bGZMaVMwd2t4VmJremFYcnJiYjBYU0NWaGlD?=
 =?utf-8?B?OXRhR0lKdk1kUituR3dXdENDVHFsb2VqL1Q5ZzlpaXFVWTlhWTg0bFVSWTlS?=
 =?utf-8?B?ZFIwcmdOSVdZNUJoVWNZVkdjc0RTdkRveVVBWG1LdTFNWlEwUXZYMER3Umdi?=
 =?utf-8?B?aHVWd3c2V1ZMcmVDdGJQYjFHdkhzVkVIT01TV0lZMTFsZitQRzI2Z3FjTmFy?=
 =?utf-8?B?aVhTalFqYmtNbXJYWEs3TE84RUtEZWN0UVdnK0g1UW13OE5tcnBDUEFVSjQy?=
 =?utf-8?B?bnFWU1NRdVEyOXhvWGZFYTkra3lvc3V1SEFzNkd5MEozMFBEWjR6ODRyTlRa?=
 =?utf-8?B?WVpTNnZjeks2NDVoZmh0bHlUQjZVNDBER3dDOVU3VHRDWm5XTnhpYUY1bHM4?=
 =?utf-8?B?WGRQd3NjYlZ1cTAyNmlxbHIzMjFYNTh0MHRqRGZjZGY5ZDVVLzJJOGM0ZFhW?=
 =?utf-8?B?VlVYMFgxanJWTjVCN3JXWTkzR1VhOENhRnJxRmh6eURXTG5LcnplS2licE1C?=
 =?utf-8?B?RXBBbE5wWnRSSEl0bW16TytSMVFya1B1VVJmaVdTc0JFclRXOWx1bmlvS05i?=
 =?utf-8?B?aXZSNVFxU003Z2MvRnJsVXRqak5mU3J1VWFNcnpkd1BveTc4UWF4M3cwQXJU?=
 =?utf-8?B?bUVUTStiZzRQQTgyaEk3ako5Vm54LzlMYVg5bDVYUzI3OGF5eGVTUW5KMW9k?=
 =?utf-8?B?UElrSFhqRG50eHczTEs0M3JvWTlmYm9lQTJPbGtnM0hmVUMrdklKNUFRQkJH?=
 =?utf-8?B?QWdqOE1OSitZSmNoRk0vdHlhazNCYytQYlN6R2Mvb3I1dk5XWWVVT29Ha3Ez?=
 =?utf-8?B?RklxdEJKVU0xVlVYOWZLK2poYVhzSG54alZMVXcwMStoNlhoVTFIUk9LMExC?=
 =?utf-8?B?cUFFOXBRb1hMOHZlSmhORXBIYXRmUjJKcjNJS3pxZWtuejRKV3lxY3FUWVU3?=
 =?utf-8?B?WDUwdDNidmFTaHdiSk9mcHlPS2VycThuMW1nTzl6QnUwaHNjU05IRk5QbmtX?=
 =?utf-8?B?UEs2NGh3VllPVkhWVWZ6MHZRRldTdTFMemJzYnFrdkNuT28rbDUwQWZCeTNB?=
 =?utf-8?B?aUw1NU94MVR1dWJQWmtUMSswbzl5OGYvQlpQQ0U5c1d0Mkd0UUx3S2VScTc3?=
 =?utf-8?B?cG5XbE8raWxQNEdtS1JGTGgraXpYYTYzOWZNU3craWlDVkpLTEFNR1ZtV25X?=
 =?utf-8?B?a0Njb1NvdC8vSmNrZHhsSXRKWjhSY1BjVUhic3BJeUJZbE9SRVRuM1dLU2lL?=
 =?utf-8?B?TFNLcGlTVVhVWDVJZnZNK0ZHRHF0bjVOK3JYNDFoN2NMSWs3TDN6QUlQQmNP?=
 =?utf-8?B?cDZzdkZVZHkxc1lScEgvT0hUYXE4U1BmTzB0Tkw3Q1ZydGFkSjFlSWViemdQ?=
 =?utf-8?B?ODJYazAyWldrTHdsanFIeisxaHdVR1dpeTlqT1NMbXN5YUhWWCtpM2QzN3VD?=
 =?utf-8?B?UFhXeDVTeWZtL2F5QXUzdUp0WVk3WXVWMFhNMlpKQWhKV3BpUWF4SVlKUFVv?=
 =?utf-8?B?aUV5bjFoSlQva0RJcTNjeE0wK1JGRTdOUXowL0I4Tml6T3JIU29ibm9lOTha?=
 =?utf-8?B?d0NqallLWGQ4MWlCbEE0MDFVdFZmbnExOTlNSElsQ01OQUtNd2tVRS9wSkNU?=
 =?utf-8?Q?3a/IOieVFRUn78Sg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81be160f-5094-437e-f19d-08de73bf8aa6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:12:43.6281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nItLl0aXjTc0kd8p8unpJHe+vFyEX9NiQoliq2CVuA6dT7G0Ya/FbB+KDbqLqTFdmRdoAtK6aLtsstKgZxACWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9533
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

On Tue, Feb 24, 2026 at 04:58:35PM +0100, Thomas Hellström wrote:
> On Tue, 2026-02-17 at 20:33 -0800, Matthew Brost wrote:
> > H2G and G2H buffers have different access patterns (H2G is CPU-write,
> > GuC-read, while G2H is GPU-write, CPU-read). On dGPU, these patterns
> > benefit from different memory placements: H2G in VRAM and G2H in
> > system
> > memory. Split the CT buffer into two separate buffers—one for H2G and
> > one for G2H—and select the optimal placement for each.
> > 
> > This provides a significant performance improvement on the G2H read
> > path, reducing a single read from ~20 µs to under 1 µs on BMG.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Perhaps one could experiment with reading the data from the g2h bo
> using MOVNTDQA, like the write-combining memcopy. That would avoid
> caching the data and the GuC having to invalidate the cache line while
> snooping on the next write.

We can try that, but G2H messages are variable-sized, so I believe it
will get a little tricky. Once these are system-memory reads, I recall
G2H handling being something like 15 per µs of page faults (maybe that
isn’t correct — I’ll double-check), and that included my not-yet-posted
caching implementation, which also takes a spinlock, examines the
page-fault cache, and chains the fault onto a list. So I don’t think
this will end up in the critical path.

> 
> But that should probably have a less impact, but perhaps speeding up
> GuC writes.

We can play around with this and bounce ideas around. On the H2G side,
xe_device_wmb() before the tail update is actually fairly expensive, so
if we can use some asm instructions to avoid that, it might be
worthwhile.

Matt

> 
> /Thomas
> 
> 
> > 
> > ---
> > v3:
> >  - Move BO to ctbs h2g or g2h structure (Michal)
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c       | 67 +++++++++++++++++++-------
> > --
> >  drivers/gpu/drm/xe/xe_guc_ct_types.h |  4 +-
> >  2 files changed, 47 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 8a45573f8812..ea07a27757d5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -255,6 +255,7 @@ static bool g2h_fence_needs_alloc(struct
> > g2h_fence *g2h_fence)
> >  
> >  #define CTB_DESC_SIZE		ALIGN(sizeof(struct
> > guc_ct_buffer_desc), SZ_2K)
> >  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> > +#define CTB_G2H_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> >  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> >  #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
> >  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> > @@ -279,10 +280,14 @@ long xe_guc_ct_queue_proc_time_jiffies(struct
> > xe_guc_ct *ct)
> >  	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
> >  }
> >  
> > -static size_t guc_ct_size(void)
> > +static size_t guc_h2g_size(void)
> >  {
> > -	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
> > -		CTB_G2H_BUFFER_SIZE;
> > +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE;
> > +}
> > +
> > +static size_t guc_g2h_size(void)
> > +{
> > +	return CTB_G2H_BUFFER_OFFSET + CTB_G2H_BUFFER_SIZE;
> >  }
> >  
> >  static void guc_ct_fini(struct drm_device *drm, void *arg)
> > @@ -311,7 +316,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> >  	struct xe_gt *gt = ct_to_gt(ct);
> >  	int err;
> >  
> > -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> > +	xe_gt_assert(gt, !(guc_h2g_size() % PAGE_SIZE));
> > +	xe_gt_assert(gt, !(guc_g2h_size() % PAGE_SIZE));
> >  
> >  	err = drmm_mutex_init(&xe->drm, &ct->lock);
> >  	if (err)
> > @@ -356,7 +362,17 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	struct xe_bo *bo;
> >  
> > -	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> > +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_h2g_size(),
> > +					  XE_BO_FLAG_SYSTEM |
> > +					  XE_BO_FLAG_GGTT |
> > +					  XE_BO_FLAG_GGTT_INVALIDATE
> > |
> > +					 
> > XE_BO_FLAG_PINNED_NORESTORE);
> > +	if (IS_ERR(bo))
> > +		return PTR_ERR(bo);
> > +
> > +	ct->ctbs.h2g.bo = bo;
> > +
> > +	bo = xe_managed_bo_create_pin_map(xe, tile, guc_g2h_size(),
> >  					  XE_BO_FLAG_SYSTEM |
> >  					  XE_BO_FLAG_GGTT |
> >  					  XE_BO_FLAG_GGTT_INVALIDATE
> > |
> > @@ -364,7 +380,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> > -	ct->bo = bo;
> > +	ct->ctbs.g2h.bo = bo;
> >  
> >  	return devm_add_action_or_reset(xe->drm.dev,
> > guc_action_disable_ct, ct);
> >  }
> > @@ -389,7 +405,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct
> > *ct)
> >  	xe_assert(xe, !xe_guc_ct_enabled(ct));
> >  
> >  	if (IS_DGFX(xe)) {
> > -		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct-
> > >bo);
> > +		ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct-
> > >ctbs.h2g.bo);
> >  		if (ret)
> >  			return ret;
> >  	}
> > @@ -439,8 +455,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device
> > *xe, struct guc_ctb *g2h,
> >  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
> >  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct
> > guc_ct_buffer_desc));
> >  
> > -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET
> > +
> > -					    CTB_H2G_BUFFER_SIZE);
> > +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map,
> > CTB_G2H_BUFFER_OFFSET);
> >  }
> >  
> >  static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> > @@ -449,8 +464,8 @@ static int guc_ct_ctb_h2g_register(struct
> > xe_guc_ct *ct)
> >  	u32 desc_addr, ctb_addr, size;
> >  	int err;
> >  
> > -	desc_addr = xe_bo_ggtt_addr(ct->bo);
> > -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
> > +	desc_addr = xe_bo_ggtt_addr(ct->ctbs.h2g.bo);
> > +	ctb_addr = xe_bo_ggtt_addr(ct->ctbs.h2g.bo) +
> > CTB_H2G_BUFFER_OFFSET;
> >  	size = ct->ctbs.h2g.info.size * sizeof(u32);
> >  
> >  	err = xe_guc_self_cfg64(guc,
> > @@ -476,9 +491,8 @@ static int guc_ct_ctb_g2h_register(struct
> > xe_guc_ct *ct)
> >  	u32 desc_addr, ctb_addr, size;
> >  	int err;
> >  
> > -	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> > -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
> > -		CTB_H2G_BUFFER_SIZE;
> > +	desc_addr = xe_bo_ggtt_addr(ct->ctbs.g2h.bo) +
> > CTB_DESC_SIZE;
> > +	ctb_addr = xe_bo_ggtt_addr(ct->ctbs.g2h.bo) +
> > CTB_G2H_BUFFER_OFFSET;
> >  	size = ct->ctbs.g2h.info.size * sizeof(u32);
> >  
> >  	err = xe_guc_self_cfg64(guc,
> > @@ -605,9 +619,12 @@ static int __xe_guc_ct_start(struct xe_guc_ct
> > *ct, bool needs_register)
> >  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
> >  
> >  	if (needs_register) {
> > -		xe_map_memset(xe, &ct->bo->vmap, 0, 0,
> > xe_bo_size(ct->bo));
> > -		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo-
> > >vmap);
> > -		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo-
> > >vmap);
> > +		xe_map_memset(xe, &ct->ctbs.h2g.bo->vmap, 0, 0,
> > +			      xe_bo_size(ct->ctbs.h2g.bo));
> > +		xe_map_memset(xe, &ct->ctbs.g2h.bo->vmap, 0, 0,
> > +			      xe_bo_size(ct->ctbs.g2h.bo));
> > +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct-
> > >ctbs.h2g.bo->vmap);
> > +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct-
> > >ctbs.g2h.bo->vmap);
> >  
> >  		err = guc_ct_ctb_h2g_register(ct);
> >  		if (err)
> > @@ -624,7 +641,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct
> > *ct, bool needs_register)
> >  		ct->ctbs.h2g.info.broken = false;
> >  		ct->ctbs.g2h.info.broken = false;
> >  		/* Skip everything in H2G buffer */
> > -		xe_map_memset(xe, &ct->bo->vmap,
> > CTB_H2G_BUFFER_OFFSET, 0,
> > +		xe_map_memset(xe, &ct->ctbs.h2g.bo->vmap,
> > CTB_H2G_BUFFER_OFFSET, 0,
> >  			      CTB_H2G_BUFFER_SIZE);
> >  	}
> >  
> > @@ -1963,8 +1980,9 @@ static struct xe_guc_ct_snapshot
> > *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bo
> >  	if (!snapshot)
> >  		return NULL;
> >  
> > -	if (ct->bo && want_ctb) {
> > -		snapshot->ctb_size = xe_bo_size(ct->bo);
> > +	if (ct->ctbs.h2g.bo && ct->ctbs.g2h.bo && want_ctb) {
> > +		snapshot->ctb_size = xe_bo_size(ct->ctbs.h2g.bo) +
> > +			xe_bo_size(ct->ctbs.g2h.bo);
> >  		snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ?
> > GFP_ATOMIC : GFP_KERNEL);
> >  	}
> >  
> > @@ -2012,8 +2030,13 @@ static struct xe_guc_ct_snapshot
> > *guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> >  		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
> > &snapshot->g2h);
> >  	}
> >  
> > -	if (ct->bo && snapshot->ctb)
> > -		xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo->vmap,
> > 0, snapshot->ctb_size);
> > +	if (ct->ctbs.h2g.bo && ct->ctbs.g2h.bo && snapshot->ctb) {
> > +		xe_map_memcpy_from(xe, snapshot->ctb, &ct-
> > >ctbs.h2g.bo->vmap, 0,
> > +				   xe_bo_size(ct->ctbs.h2g.bo));
> > +		xe_map_memcpy_from(xe, snapshot->ctb +
> > xe_bo_size(ct->ctbs.h2g.bo),
> > +				   &ct->ctbs.g2h.bo->vmap, 0,
> > +				   xe_bo_size(ct->ctbs.g2h.bo));
> > +	}
> >  
> >  	return snapshot;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > index 09d7ff1ef42a..46ad1402347d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > @@ -39,6 +39,8 @@ struct guc_ctb_info {
> >   * struct guc_ctb - GuC command transport buffer (CTB)
> >   */
> >  struct guc_ctb {
> > +	/** @bo: Xe BO for CTB */
> > +	struct xe_bo *bo;
> >  	/** @desc: dma buffer map for CTB descriptor */
> >  	struct iosys_map desc;
> >  	/** @cmds: dma buffer map for CTB commands */
> > @@ -126,8 +128,6 @@ struct xe_fast_req_fence {
> >   * for the H2G and G2H requests sent and received through the
> > buffers.
> >   */
> >  struct xe_guc_ct {
> > -	/** @bo: Xe BO for CT */
> > -	struct xe_bo *bo;
> >  	/** @lock: protects everything in CT layer */
> >  	struct mutex lock;
> >  	/** @fast_lock: protects G2H channel and credits */
