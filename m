Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA1EC5518F
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 11:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB8010E7DD;
	Fri, 20 Feb 2026 11:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3++a/82";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CE110E355
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771587049; x=1803123049;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=3xIaNteWe49p0VeOnOsoSJRKbo76myTWvPB4B8qojAM=;
 b=h3++a/82sZXv0JxQHAzrChwW8S5okreULlM/LaQZBLVsz/mkzkLTRsaj
 4nZI0rgZrJaIi5Ji2z8AtDPJQRvZGzy5okGKga70VH7WHINRYH6IZyHOA
 3SWP2q/Zr5/Djn7vgcX8h/NgLiWxmnVDnu6j0jisNyIp9t/D4kc/VRyv2
 2B70eyFRfOei6lzpBk5IlLeQb7duuonVdvJADaWGVe0EdwHJJp76Zbr3M
 gbM1ed7V7EictuuwmYB++NWs1WC2QJTbj5VVQ/4GNZenrlO8aqOoUMGFB
 ZxnR6ceWgGrVI/pEXxGnZZYr3FUVjgSj1oCkkuamUXH7QvPGi3ZHNoSbk A==;
X-CSE-ConnectionGUID: T5CB7YG9R1CbAzyXCBTpAw==
X-CSE-MsgGUID: s0lGJ1LkRnSn++6BRTDEyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="84039844"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="84039844"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:30:48 -0800
X-CSE-ConnectionGUID: 93HtnpsdRmKzOjkiBJA4fA==
X-CSE-MsgGUID: VkqkJS4iTcS+0+my+DYAGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="219375062"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:30:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 03:30:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 03:30:48 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 03:30:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xa0/TFBPvbQaStk58KtfCNh9wf7QYAQRO4dWWxPeux6Jq4yyy3hzD71Lx4cWyJh0BQdmZvul70sy81B/uYJlt2v3BE174OZQc3YWVVCz07jyyaukavtp5M2EKwhzhGBn0W03zDZISIW+GNsFnHKBsdZEUkEjCXNuULU+E8CX4NAFCLTj21LC2WVTOJjmOeBJ1lkGcTU120aHifWjP0GSFu9Gau+Ilul5EUjUecadtLV3DfLH7lV5dcsbBEQac1dfqGRD2RmQttEc2YeJoz2rkaoC+pQc0+h2OSXCb/mg28I2BEQazahSNqFW499MbdOjrfAkgsNakXw8e6XGWmnHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bxkyFUBllxhDjlKcCU0bdFmiFP7nxK7EtgQd7rAJzQ=;
 b=HhwXFXRfReoj2gaE18ivKULq0BzqjtvBBBQkBp3S/uFB0JGDIgP1WFBaLjo7zaAknIK8KgCBTAny3CaeI/xvPVK2eW+AgCZo7UT/hjjJ2hjCvtM7Y/WLlKNrUOgqqBj8+W2X75/if7bcwKWX2hGPCjfl7LX6IYNHdsYmxWTAOJqM1PX7E3Xs/egVIA9f2FP+7bCjf/wpv3HhQlrhjSx5OzW0lTzOBO08lSkC8sXY5matkftos2WilX2YqyjSqCRtuvK5vzymWiNMG2DCcH64H7QqaAK8R0q1RWeZ0IegziCeP5xq8uQbDuSYsLZa+ixXKKb+VR5ZExl2IMze/SG2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by IA1PR11MB8224.namprd11.prod.outlook.com (2603:10b6:208:44f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 11:30:40 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 11:30:40 +0000
Date: Fri, 20 Feb 2026 17:00:34 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/22] drm/xe/wa: Document new policy regarding
 workaround IP ranges
Message-ID: <aZhF2hbWV_pCjjqx@bvivekan-mob1>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
 <20260213-forupstream-wa_cleanup-v1-3-961f2dd3a8e9@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-3-961f2dd3a8e9@intel.com>
X-ClientProxiedBy: MA5P287CA0097.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|IA1PR11MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: f3cdbb6f-4987-4b01-0f7a-08de70737a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejdSYU9FeHFIdkMyNFZoUUZIVjh4blA5UE5ITXBJSkk2MUkxYldrNjFkYWRM?=
 =?utf-8?B?RDFIb0gvMUVzdktLemZwSVlQNWdPL0w2Y2lTaVdRME1KbjU0ZnN5M0dBakZq?=
 =?utf-8?B?eGRXYzE5ZjJEL0djVU1jTkt5MWRCUjd5cXlvSjF4azh5RVRCbUw1MDFSdmhB?=
 =?utf-8?B?dFJwZWdLYUdyTWFwTGxVUWpwUHRIZEtvN3JPY2NXRFpLVGQxYVZ3ZGJuSE5T?=
 =?utf-8?B?ZzBOaHpKUWRHRTF1cEFiaTlOdFArbTNTTnd6clhEMFBsTHdpY0RlRndnL0Vk?=
 =?utf-8?B?QmRNTGdTb3NuZ01hSld4SnhNR0tnNEZwY3poWGNQRUMvVTNXYjdrWjJoWGJJ?=
 =?utf-8?B?cDRRSUNYTWRqSENWanozd1h3aHdjb1NXUVAza2I1bEQwRVhJUFpiM3MwVkdh?=
 =?utf-8?B?Q0ppaXY1ZEZDT2lWZ3lsWFdoeTJITzIwSGI5Y0pCLzhFc1RhR3gzRkc2TDZ1?=
 =?utf-8?B?NHU5cjY1QitNWURNM2ZNOEFtM2xMMDNTSHBTdVQyNlV4YVFXYlVxb2t0OFBB?=
 =?utf-8?B?VVl4cTAvVmF6cGVkbXBOZm5NZWlpb0Y1WldxUHdjSEFFMEp0Q25pcnlVNUk5?=
 =?utf-8?B?NXFNZzhINzUxS2FyMHdEeHZDWjR5bjRvTXhZNlhUaHBkL0dRenBSRlMzS3Bv?=
 =?utf-8?B?S1NIenZaUnljSmlIazZaakFaTTBTdmRMWmxHb1BMSUYvMWVFTXh5aHhSTFUv?=
 =?utf-8?B?dWdVT2Z0Q1M0Q2VST3hzdnRXUU5IalhPalNYS3ZGc2p1SkR1TUdQVE0xUEZa?=
 =?utf-8?B?RDQxY0pvTER0RmFPTDFKTmRjZ0JGemxQU0R4ZFJKMnM0WTlMeURNdjY3ZmFu?=
 =?utf-8?B?RmEzUXZhQngvTFNvTWVGMzhBY2pzbVdlNlVrN3hMSVZGb2pQR2theHlkbXpR?=
 =?utf-8?B?MnExTlZKQmRHSSsxQkZkWW9mQVJPc1MxNFlpMk05SVRVL0kyTC8rZ1hZdjFp?=
 =?utf-8?B?aWV6VEpFc1lWbHFrZmM0a1p3SUNzYjB3NjRzZmFBMVVLaHJpNi8zdG0yN3Zv?=
 =?utf-8?B?MGF0Z2hDaHBuSXk3amFCY3BUTlpQR2J3TlQ5NTF1Nm5uWU9Lem5FQ0YzekZG?=
 =?utf-8?B?QlJ0QkFkajU5NjhOdzdQU2dXc2Yvam5XbEl3dnZlZG5LNkRjVytibHl4WVBX?=
 =?utf-8?B?OWpTNWdIY043cHVuQU5xdjVPcGo4R05ZZitxK0F2cEFyN2lwMmRERDVrWWEw?=
 =?utf-8?B?bXFTZVowVFRnblhvanJnK0FsVm9PYVgwdXlFR0NERGtjVVBzVE9oQmpad1JF?=
 =?utf-8?B?T2E3L0lzWGd4UU1KL3RVRHd3eFNYMGREU2dTS1FWTXBFKzRkNjBzRWM4b0F3?=
 =?utf-8?B?cGtuTDNRTTkwMk5XV3VJQms1bCtQelpNMzRJb1VraWNUNXpReUxWL2V6NlN0?=
 =?utf-8?B?ZDYraHA0UHFqOGhpZ3p4cmNMbC9JRm9EaDd2VnNZa0ViYnN2UmR3VjV3YW1L?=
 =?utf-8?B?RnlhUnYvY3NhNDVEdWpJZ0FVMDE4UG1hdjgvVG5mSVIwU1pUVVVrL1hVLzBY?=
 =?utf-8?B?MnlGZm0vYUJsRmtOdVNsdFhTZkxuLzk4ZTRmR0dZOWM2Y0ppWFl5cUhVaXJv?=
 =?utf-8?B?UDZneUZ0Y0l0U3habmF6bVVJZVltU2trSk81T0JPUjhkNTd1S0ZJTk82cStH?=
 =?utf-8?B?bFBHTUlUS3M3N2hxR1I1TVRhUUt6VnkrTit4T1ZGek9ETmttNDFWMU43ZUJD?=
 =?utf-8?B?eU90OUlGNTRESHVFMFhhMitJdGxaZm03UGhnODZld2l0TjdIMU5VN1JjSGFU?=
 =?utf-8?B?bXZXQzhXL0pZMDBZdWk2YWFlOEFVb1RWT2dZelY5MlhSQjI4bFhaWUlFR2Vv?=
 =?utf-8?B?aE1lSlpkZVR5YkZMMTkyaE05dC8wMEpybkVBbjRQZVd0TEJFbEx3NTI5aGpJ?=
 =?utf-8?B?akFTNWFEclZUNEN6RkNWNVVDY2tuRlc5TmVMOHp0MjZwZ3NpeTd1RDhrK25W?=
 =?utf-8?B?WDFPUFQ3a3VWV3IzZlp6RTJhR1p6NGNQY3R5QVVxYkdIbndFRmZHV093QkF6?=
 =?utf-8?B?THdBdUlXVFN4aTZTNkg3Q2RpVnhjL25mTkhNRmh6Mk9MNFpWR2plTHJnREVM?=
 =?utf-8?B?TC9aQ0x4bW1yRnMvcEp2UkN4d244Q1FZa0ppRGt5bHBQRUgzc2Q1dElvOGdB?=
 =?utf-8?Q?7yAaID9v5+3Mt1MsyXwJPgyCG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk10REMrVEI0aWJYNWNHb2JGLyt5NjgyN0RIaUgweTRjandCNTRxaDFKS1E3?=
 =?utf-8?B?bVRGZmwyMXNQTnZWYUIwdUJ3TUdWZnRqMVZIaEMzdXQ5SkJhT1cxSXZQTklh?=
 =?utf-8?B?OEI4L29kT2MyMGRIZVVQeXVrSFBQV0Y5TzNldzhyQWpETXkyckEwU1JnWHNM?=
 =?utf-8?B?Y1NnaEkzWW84bGhhYkJ0SC9vR2FLYmVmbXdTSTdSeXpld1lzQzhGRlFJbGEx?=
 =?utf-8?B?ZTcrRUVTMGJxeDVabFpobzZ2Vnk0a2ZnVFpSOEtLb0gyMmdnRzRuZHBhRzNt?=
 =?utf-8?B?Y2ZUTlJISVdvYUovaEFOT0N1QnFNNS9zUXd4bDJjZkhTSzdTeDYrNTdSeW1P?=
 =?utf-8?B?SzQvSFkzUEpVV0E0Rzh6WWJwZGtQUkV2STBTR0lqOHRiajY4RGNhVU9KZnl6?=
 =?utf-8?B?K0Q0eDlydXFmSXJFc3ZFekJzejdoR21DcUdXRGZTSUFNRUxzOHhweTl5dWFR?=
 =?utf-8?B?dEQ5b0I2cy9vWS9YOUlJbWpBZTAvVzhpbEIyZ1U1VjJhN2RhcDh5TnNXTVlo?=
 =?utf-8?B?OGw5RnRHOTVPM2o4NnRBZFBKa1cvZEdhaUY0TTFkMFpBd013K0pCWk9kOGNy?=
 =?utf-8?B?a0luM3BiSmRFZFhOdnA0bWx3VGlyQ0o3cTJkZXRYQ2w3ZndGWWtFVFYzMFow?=
 =?utf-8?B?azVvdXMzcWE0Y3kvZkQrc09PenI1VXRveEF4a1gvMGIrSDBFcHpOY2xxNUts?=
 =?utf-8?B?UWgreldXTGd3TWpTNWtiWFNjWUZxSTh6UHdrU1FVMUZyRmN4RlNWdjZnOGxE?=
 =?utf-8?B?eDF6NDhzVWNibUNwaGE5WWJGbFNXY01GZU5ramgyQ2luYkk3MGg0cUNocGs3?=
 =?utf-8?B?QjkrdjVEY003TjAvZlRwQUVMYkxkd2xoeW1yUVgvV3BjTTAvdnhFTDE0Y3hI?=
 =?utf-8?B?dFJIcDVyY3NFM2FVaWs0ekRZMDdhTEZ0SzJVa252bWZZcTVLeTJRRHFHYkV0?=
 =?utf-8?B?eHhZNXkxRVNJODgvZmlVeXlPakJZZ1RHSXBGYlJTbGtxMUJ2V3lBa3pDemhz?=
 =?utf-8?B?WUlYTnFmTWZDVldwSHZOTUF4amJvODlLYnZvZ25lNFd0bm5qZEZ6VG9sM3lP?=
 =?utf-8?B?a0hTTis0eGMwOWs4QS9NakpkYTl5SHJpZVowalZzSXJlQVZuNXNkdVBKaW5M?=
 =?utf-8?B?cWpPYWNEdndEOWJSSXlnTW9aSm1hd0IxbG9tZndYYXRyaXFTK1g1eEhqc2I4?=
 =?utf-8?B?cGt1SVQ1UEQ5TVY0YlNReFVtV3ZhOEtxbXA4MUczSHF3a21PMFEwdjNQTjFC?=
 =?utf-8?B?ODFrbGVJcm1sUFZXMDFWckFOTHVyZTR3TnQ4WUdhVXhtQmlYL0RNVldneEVL?=
 =?utf-8?B?WTVFWjkyYXo0azZJT0lXNDhUckUzcmp6bDA1a3pVTjRGNzBiSkZwM1htNHlE?=
 =?utf-8?B?cWJka3hrTUhWOGhUYko2elBObzUwZXpNRkF6ZEl2a0Zrd296QkJtSUZjczVn?=
 =?utf-8?B?UDhWUFhWYVkrZldUVXpKclQ0VENxV2Q3RHFmSnJqcU52dzI5eWF0YzhLMG1D?=
 =?utf-8?B?NTVzZXBiU1lkZHNwcFhvTDRBZHdVUmRoelVFMkFTOWR2STFTQ1ZWbERqUWNj?=
 =?utf-8?B?R1NxUUVXY0Q3TG1iSUVwUjlJeEk2QmFLQ2FnWXpRbERtTnlZeHMzRDVSb1RC?=
 =?utf-8?B?c1B2dEtnT3N1VVVJU2d5WkVUQUI3a2VkaWw0UWE2bm1rc1dZK0NoWDRRanFQ?=
 =?utf-8?B?SlJkeGpHalo3RFFPQ1d6L0Q0Z25tZW9LQ01nL2J1YzdRZGs2dWtnek9nOGdP?=
 =?utf-8?B?N0NBMkZETUkzTzUvMkhCdmNnbGp0Wi8rK2lsTGJRVy9rUG5mMFZ6Y2pzNVNY?=
 =?utf-8?B?d0JkU2xScWEzV203VGZJWmxaeEVBQTlwQzFCdGZxNVA1YWdBRnZRUlhKaHNF?=
 =?utf-8?B?OU1NYnlDamNxbmxWUk1oOXR3aFI5NSswN1g5UlpMKzRuTWo5eXM1bWxpL0FS?=
 =?utf-8?B?N2xoaWRVT3ptaEwrQjBRQVdJQ3hsT3pGN2RTbWlMdG43cjVvWWQvVmR6OCsz?=
 =?utf-8?B?MDZwZU0zSk4wK08zZThncUE0OC9tSEhad1Q1dkJ1WVRlLzUvY0pxYTJDMHJs?=
 =?utf-8?B?MjhwaDV0c0l1UzN2OXRrdHRQMVBnWVVtVnhZdWRSZjA4SGZIeTNlVkM4Uzh2?=
 =?utf-8?B?bmt5djAxVUsrUXVPTnRsMWVtZm1OYlJqOVBxdHl4ZlVrRGswRUM0NGIvN1NE?=
 =?utf-8?B?NlhLTS9rVEQ4RHhrUVhXM2E2VVdyUjQxTGprRGZWNWo3MllzUTBpMUsrZ0JX?=
 =?utf-8?B?QzI0WDVwR2toV2hEaDNrQVJVR2dEVVRFRTI2ejcvK014c0ZVZG5Kb1pxeHIy?=
 =?utf-8?B?UXFxZWE4dnRWYkxTU2dZSmJSUEp0Vk1jb3ZZeHJYWTJxRXRKUU4zT3htUkNV?=
 =?utf-8?Q?9WTKJJU6UY3tNaxcit1sffzD/pDxgL/FKm23f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cdbb6f-4987-4b01-0f7a-08de70737a35
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:30:40.8426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9UioAMl42UNdUulbiD6NrXt6X4ktvAeOtf3UXkx18OAYXW87G190SW/kFHeFPH6kCtPZcrBreCBNjZkBNUWD5VsNEdzh/0gUkDV+eKJ/bZ+XK8W+7qqQKtK/d/iZ808
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8224
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

On 13.02.2026 14:31, Matt Roper wrote:
> During early Xe driver development, our policy for applying workarounds
> to ranges of IP versions was to only use GRAPHICS_VERSION_RANGE and
> MEDIA_VERSION_RANGE rules when all of the affected IP versions had
> consecutive version numbers; otherwise separate RTP entries should be
> used.  For example, a workaround that applies to all Xe2-based platforms
> would be implemented in the driver with two RTP entries:  one using
> GRAPHICS_VERSION_RANGE(2001, 2002) and the other using
> GRAPHICS_VERSION(2004).  This ensured that if a new IP variant showed up
> in the future with currently unused version 20.03, an old workaround
> entry wouldn't automatically apply to it by accident (and we could
> always consolidate those two distinct entries in the future if the
> workaround database did explicitly indicate that 20.03 also needed the
> workaround).
> 
> Now that we're a couple years down the road with this driver, the number
> of IP versions supported is much larger (several Xe2 20.xx versions,
> several Xe3 30.xx versions, and a couple Xe3p 35.xx versions).  When new
> workarounds are discovered that need to apply to a wide range of IPs,
> it's becoming more of a pain to create independent entries for each
> non-contiguous range of versions, and the general consensus is that we
> should revisit our previous policy and start allowing use of
> VERSION_RANGE constructs for non-contiguous version ranges.
> 
> Note that allowing ranges that cover currently unused versions will
> require additional care if/when some of those intermediate version
> numbers start being used in the future.  We'll need to re-check every
> workaround that has a range including the new IP version and check the
> hardware database to see whether the workaround also applies to the new
> version (no code change required) or whether we need to split the
> existing range into two separate ranges that don't cover the new
> version.  The platform enabling engineers are willing to take on this
> extra review burden at the time we first enable a new IP in the driver
> (see lore link below for one recent discussion).
> 
> Update the kerneldoc for the workaround file to make the new policy
> official.
> 
> Link: https://lore.kernel.org/all/20260203233600.GT458797@mdroper-desk1.amr.corp.intel.com/
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index fb1ce4479dd81a5fe91906948cd37a7e654b655c..8a9badb7f1085b10378ce410c2cb8ea495e53e7d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -111,6 +111,17 @@
>   *    difference of how they are maintained in the code. In xe it uses the
>   *    xe_rtp infrastructure so the workarounds can be kept in tables, following
>   *    a more declarative approach rather than procedural.
> + *
> + * .. note::
> + *    When a workaround applies to every single known IP version in a range,
> + *    the preferred handling is to use a single range-based RTP entry rather
> + *    than individual entries for each version, even if some of the intermediate
> + *    version numbers are currently unused.  If a new intermediate IP version
> + *    appears in the future and is enabled in the driver, any existing
> + *    range-based entries that contain the new version number will need to be
> + *    analyzed to determine whether their workarounds should apply to the new
> + *    version, or whether any existing range based entries needs to be split
> + *    into two entries that do not include the new intermediate version.
>   */

LGTM

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

>  
>  #undef XE_REG_MCR
> 
> -- 
> 2.53.0
> 
