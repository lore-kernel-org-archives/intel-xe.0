Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C924FC3ABA2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 09:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3E910E10F;
	Mon, 16 Sep 2024 09:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBIvpAPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187A810E10F
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 09:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726480636; x=1758016636;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+a0yKXRl/n0LNgNTXmyQTSZXFXUOOaqCZT+AxmUgSkc=;
 b=TBIvpAPTP8f2Y1MF3wIWWFM0XRj//IyeQ/bnPd9gsUgc79X+FuItWisY
 3MM4uxUZmXNzkWCCUiKSo7Goi8RjZKd3P34TGLvFdh0BBouRIpuhRLV3Z
 HEVPXwyikqL09Secd2v2HLdQFF9VBsYtOrntBchAKYDxK4CD8CSfrfHHX
 pbJ6YTFztUi8VCHNjfgZ3vMR+ZFZdHo7oSrcaLrKFBuyW9q7iBFPlAF5b
 C/eSufWtnJK1SOk2HlnD0r51Q+5EFi4eg65MKWrL+r9JtgsFg+DJyYP5b
 1qQi/Nfu+lqN+uTNPHQUc7xRQHM9MRc55TLiR3wxGu13g7xOx2sm+9tXI g==;
X-CSE-ConnectionGUID: bJg74t+EQKOo8JHgl9+8pQ==
X-CSE-MsgGUID: hnQ9OHvLQ++vVnJAEidwnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="50716447"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="50716447"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 02:57:13 -0700
X-CSE-ConnectionGUID: oANPpseCTSKDopVqCc36Bw==
X-CSE-MsgGUID: 3wVOwW+0QkOYaoxUQzG1Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68815108"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 02:57:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 02:57:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 02:57:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 02:57:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 02:57:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trdQeTMW2lCAiq/o1H3nVOnCOZDTQ4ORRI6/jZonhOCM18VpEqq5BzUGX8VNAgXj4/YFfUVi2QelfCkHiCE5rd1hmCh7NylLzWhb6q5GBvizd8AH+NID1WDZzknVXiiO8yJ/ZkOh9cqoI0fHVngq/W48DRp9prMgZm6SYDBgBG8Yn6O196xvBfGTCijN47lADy5E+3fyAPymxUZGD5yAMzTdIlWwTiJmHt+E2ZakIgkTHJuUh34evukCd4A0DkrbpkmXPh0ZqCibPnP4/8N+jlP1afeXU5vsHjOgzkiw/iXN+VnDv/rFzSc/NQTwulaWAs96QgNJcV2IUjHfxL8+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S05kDAY1T8sz7hCaTV8HmxRCFGdEpwfImbHQ335ctYk=;
 b=ZIuhlLVwgtyZp7JlFJO13C+Cg3dAu44sVgAUsks8TUAIMOBecJtcoag3YZ8jgqSMt6hYt6WgjdwmXKlml3Xyf7plfZndR5RhaUXmOFEYaYu6Gafs2cep6rqQiu5OwdLEjz/yPnAmxvdsqufnPSpM6PW6mQ7N/j044p8Ad7PFIM/8CsqgtS/kGpsSCKowkSQQMp1cUJubfW0aB8cRg1xN25/ZHaZzVR/9BMySUZPDzrEVfdrfezkJYzRmspDutwAZpPxoQgxSDMuC2Yq/YovfEn4Xy60xgcdFBvxmi1PkZCAcVrWLRUoWj8VxWouMNfOvly5Brnve25w6MmTP0rRe4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB7875.namprd11.prod.outlook.com (2603:10b6:930:6c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.24; Mon, 16 Sep 2024 09:57:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 09:57:08 +0000
Date: Mon, 16 Sep 2024 11:57:04 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/6] PF: Initial support to save/restore VF GuC state
Message-ID: <jmzfdgehkhj26kcqdar6fjw6ttidhhmic2yjjyg4pnn6jabfdh@lw55rejsz5tf>
References: <20240912203817.1880-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240912203817.1880-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 0804d2e3-cbdb-426e-5bc6-08dcd635ecfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2tOYUQrNlp0YUtabEh4WkkwWlpvMTI5K3pMcnFVM2J1bDFGYnc3K0hVS3Bm?=
 =?utf-8?B?NEkxRVB6VEYxeVIwemR6V05MNWNDYXUyZU9IZUgxb09PQXhkQm5QYXlzQUJG?=
 =?utf-8?B?SU9vNE1CT3h3K3l1OTdJRGNQdWVOWENWSk83cFBPMmdUc0lZOGdhUVNuZjlY?=
 =?utf-8?B?bGQwdGtXVFl2R0pjMFRmZnlrVXVLbXY1dHJGMS85R0NOOFl2MytSNDNJdXFr?=
 =?utf-8?B?T1EyTWpWNFJyR1RhMmx5dzV3aHBKWENObSttUURaRDVZeHRNK28zUzQ3SWsz?=
 =?utf-8?B?UmNQS1A0b0RBWjl1NVFieXQvWlVmVk9FVGRHZmtsYmxJcGRGTk55VmJMRU1q?=
 =?utf-8?B?d0JZT3I1alBldGh4clhYWWxtZEdPZWZsSXNzY1JDVjdUenVidThDR0N2N0Y0?=
 =?utf-8?B?OVM1RGxNbEE4OHJNamZVSGhRQmxzcWh3RGg2cVllV1BnNnA0eFNGTk1xY1Rz?=
 =?utf-8?B?Q1UyZ3g1Y3o0OG9UbFMzSXl4Z2k5WGpSN0g2SFJhQ2NvdHBsc0gvbDNtb1JI?=
 =?utf-8?B?LzlhRS91NDZEQXFZUnJuMlJHcmJvUTdrUkNwNHUxQjdXMjhoaDZ3UEFwRGNO?=
 =?utf-8?B?LzRLeUNmRGxVWW8vUldwVVdDcEtibllVbWRhWFFabXFOd3d3bmFjSnlyMkFO?=
 =?utf-8?B?MGNTN3JSVVNvcEwxclFCRmtrMnUvRFRUYmtXdjliVTVjUUt1eklLYzJCajg2?=
 =?utf-8?B?WVRQMmU1UHNzMzBidzRMQWZpaksrYS85MjZQRzM4bGczeEFHOFk3UmN0TStH?=
 =?utf-8?B?dS8xbGFOL3RLdXpaK2hPZHRKaHBnb1c3dUd2ZittTnBXVXhsWEI3NDlnSVBH?=
 =?utf-8?B?V2J3SXROejgya3ZiTU9XN1ZJb2E1QWpMNHdnU2lzQUlrMEFvQjBiMzVGci8y?=
 =?utf-8?B?alZiMFlpNkRLVXRjOEdCWkpPdzZYbWVybkdpNC9ZdHFqejBqMXFMUmp6Z21C?=
 =?utf-8?B?a0tnb3JRMXJUOU9OSEhrRFpvbEFJUS9PaVBGUE10UHBkaEp3Y0pmb09HTExY?=
 =?utf-8?B?NTdJQzBlQ3lTZFE4Tk1aTE81czhsbk1hNGh4Wk9vcjU3WSs3SXFhcXBXZkQ3?=
 =?utf-8?B?d3I4dncrYjVYZTdRa0pMY3NOaHN4TGxCM3pNSm5VMHV1UGJtYVB3K250V1g3?=
 =?utf-8?B?R1Bud1dkaXQ4R0hqVmpvSDdpSjVDSGgrRXJhWmtJU2ZJVFlKdlA4a2U3U0c4?=
 =?utf-8?B?ZTBzZWxFeC95UHh3VnJ2N09KTmdNcHhHRkV5czFJTXc4L0E5Z2JPNEZIR3lT?=
 =?utf-8?B?akh2My8zYWdEdUE1UTF6TWMzK2VpRDIwMkQzOVQ5dnZJZ3NUWS9hckNIR1dM?=
 =?utf-8?B?TzhqSEdhS1pKUW53U3I4NnFDazgvNDdoS3hlOGl6Vmx4S0NEOTYxTCtacWxB?=
 =?utf-8?B?cFlLcmZOM0cvVWo3K1B3cEEwK3lnUjBXYVFqbmpNM09JcWc2T2JOZ1RWYjVT?=
 =?utf-8?B?QXZUYkl4RWFaaFhHSjhIK0VBY1JVRVFSd1FxNmVTdkN5a2F6VXpRR011ajVR?=
 =?utf-8?B?akZNSEVRQnZobVl3Q01NWEVOUVpTd3ZuR1BjUWQ5WUdXVGErZk5NUS9FNm14?=
 =?utf-8?B?eXE2eEhGWU1HUDZiWlRWczdkUWpoNUxkc3NsQ3M2YnRuU2xiRzNmdENxTHlZ?=
 =?utf-8?B?enIwcWVVQkZNaGIxWnZCV3dMMFJ5QW9POTVoK21Ia3RWMWpIUmVVeGlNbDFP?=
 =?utf-8?B?dU1QNVFFNXVWSTVXVlpONUpycEFXd1JSVnhGRUdEcVMxY0VTcXhYL3Zmek51?=
 =?utf-8?B?a3V3Mk05Qm9RUHk4ZnJSQ3l1L3ExcGdkYWMvd0hOVlJZN1I3SVFSSmVaZHZD?=
 =?utf-8?B?ZXN6NEJ2RzJUb1NRSTVuUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUxERzhTVzM3N1p4djdwYmdqcC9Wd1N6YkNSSmhOQ2FoM3NqQTRXLzFKQ1I4?=
 =?utf-8?B?R010clNLOC9qMkx4cFV0YUNPK2R3ZmZudzR6RXN3NGROSzJSdWNiR0hrVTZT?=
 =?utf-8?B?bXVrQjNwSHhwY05IcmtxYjBGbUpqVVI0bjY1Ly9oT1BuYkNLTDNtQWxkaElo?=
 =?utf-8?B?Mnd3ZUhURmJ0cFFHR3RlWFlLMGFvZzQ2VzNPYUlUU21DcW5VSnlPUldUdTFH?=
 =?utf-8?B?L3lMdnJUNTlsUktRcVNnZVAzVUlyd1ZVdWhBcmNEKythREZMSnBzL3dvRU9z?=
 =?utf-8?B?ZmtFeDJLRi82T1QxOFI4VjBiV2w2YUJJVzRYRDliS0lEUUY1TlZ0SHpKblov?=
 =?utf-8?B?dGZXaWNwTXVNSEVydS9KeTJWeHA2U21rM21LWjlFN3ZwR29pb2RYOWdZbks5?=
 =?utf-8?B?WEpVQ29SQTVTL1FacUZvOE4zVjdJd205K0t0VWdvUktqS0xmaWRUQWtTZVZO?=
 =?utf-8?B?OG5PNkdZRThzVGRhTGYwZDVwRU1ZMkZqZE5ITlJLRkFTazUvaTc1WUwwdFJz?=
 =?utf-8?B?MEs5cXIzVXg5dWlkVCt6eDE2S0czUDQzc1d3NW12eHltM3B1bVArY3R2WXdm?=
 =?utf-8?B?T1Y5V1RZKzkxV2dlb282Y0NmYzVLakN5eEw4UWJ0ZW5CQTV4WTM4NXV2MlFV?=
 =?utf-8?B?N3hWM3pCRTBjY05JclJ0NjVGTm9KMHhGZlBBN3NwSzVCbVZ1ejZsa3JQbHlS?=
 =?utf-8?B?dW5sWGRzUzRvQjdiaWJmTmtBbjRYSlhzQ25tcXkwZzdwbVNnVW1CSCtrdmo1?=
 =?utf-8?B?Smx3MXY1SVVSOHhhQVZrZ3VUR0tZUEFPTG9nQW1yUjN4Ynl1Lzdqd3RJWmhL?=
 =?utf-8?B?cG5ML1d5RDJMZ3ZMV0RvWnNTVTh3ZzRzamI1Qmd3eTAwNFQ3TEt3QVdEa3pT?=
 =?utf-8?B?Y1BDL1I1YTA4bExhZlN6M213YjVFRGhSQVNVNUFUMmE5WXBNMW56S0JaTFY5?=
 =?utf-8?B?NjdTbEtqMzd5Vm82clJoS1BpVHRWMHdEOG9QcW05YjdxeDFKZ0U5QTMvbU5G?=
 =?utf-8?B?L29qSDNGNjRvbis3aUdYSFAvRFpDeW00d1IvTkxHVmdmNE9ZTzFlWVJkSjNh?=
 =?utf-8?B?eVpNQ3JGRklMdHJOWUZTZ09XTEluQy94UXV2QTFrZUdwSVJTTlM2djNSdXlF?=
 =?utf-8?B?T09acjBJQWwvZnZsd0h0TG9UbUhkUzE1U0RrZHVFU2UxV1hza0Y5WkNVaDYr?=
 =?utf-8?B?V0RPMzhRK0FDVlZ0THJxcWRWK3JYRFcvS3pVZU9qKzdlYUtJRlp4L3UvSkt4?=
 =?utf-8?B?bmRzOXcyVDZFekc0YXRLU3YxdGNJUXI1SVpkOXY1WkJLTWxkK0pPSW0yNk52?=
 =?utf-8?B?L0JCcG1LWFl2NWFtWFlCL2tBQTIzUkFqWVdpRU5vOXBDVENaUHJSQ25HeVZR?=
 =?utf-8?B?cHhadnFJbDJvRlM3RGRyZWtCVW1yRHVGS1NUcG01UUsySVQ0d2tnL2d6RnQ2?=
 =?utf-8?B?cXR3emFINzRoNXovTC9FR3JkWjgwMVZjNlBsN212aXcxZFB4dGRIbnV4dkZa?=
 =?utf-8?B?L3NXaFdzS3RPTEZWazhHdlNBYVdaUm0rVWQzTEQwWUZwbktqSEV6cUtRS3cr?=
 =?utf-8?B?Q1AvcklyZGRmdVA5Szk1MVVSMS9PL3R2bFIxYkxJM1BJdXROamNtZTBxUmd5?=
 =?utf-8?B?enFYMXRvSVdRR01sMVpUTTJVQ204RzFyaTRnaC9UenBhem83c3BRSGdDOXo5?=
 =?utf-8?B?NFBNL2pJQXM5ZENzSHM4ZmZiMEVMbmM4TjdzeXlvb0dycTgvMlFRclJscHpo?=
 =?utf-8?B?TU9aR2k3R1FibjVFeTY1QnJzVzBTQ3VHWldiZXBVNlV4Y3c4NlMyZFV1TXhR?=
 =?utf-8?B?UXBtbjR5d2xDNXdGQ2FUdUFsK2p3NmQ0TlgrRUNYd1pyemJna1g1RkhNbi9w?=
 =?utf-8?B?dk5jTDRFODlwaUR2RUdwWmNINnNoR2lNY2xhMVBzTElYaTgwZFBDblVOaUdP?=
 =?utf-8?B?Y0wzVVI5RndjdzdGOERKMmJqVVRVU0ZBRzdmMkFHdUFFMnREaGIxSE1jSWds?=
 =?utf-8?B?YWwvbjN6VS9ZVEIxN3ZtRG9VWUFnb0hNVnlWOEg1SHpSdmltaGxZOGFrY1BD?=
 =?utf-8?B?YktETlNlR1FDSFFzV2wzdkJKNWd1QTROTHhBOUpscGVNMjV1NklpTGNZREtv?=
 =?utf-8?B?WGluYnFocnpFeUREaDd4aityUDB3ZmtVcncwTHdhRFc5aGxDSlFrSHBOd3Q1?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0804d2e3-cbdb-426e-5bc6-08dcd635ecfa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 09:57:08.4001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpwTBVZ2p/tWjbDi9Sf7fIi2VAKNMQxMVD8QqxQCUyViSpAe5OSrFiPZOeffgsD1uWpWsd3pAPFtvUG7UEMW/k1tDGhpcgUJELTjq8wVMY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7875
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

On Thu, Sep 12, 2024 at 10:38:11PM GMT, Michal Wajdeczko wrote:
> To successfully migrate a VM with attached GPU VF we also need to
> migrate VF's GuC state. This series adds necessary functions to save
> and restore a VF state and also allows testing migration flow using
> debugfs, ahead of availability of other required components that are
> under development.

For the series:

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> 
> Michal Wajdeczko (6):
>   drm/xe/guc: Fix GUC_{SUBMIT,FIRMWARE}_VER helper macros
>   drm/xe/guc: Add PF2GUC_SAVE_RESTORE_VF to ABI
>   drm/xe/pf: Add functions to save and restore VF GuC state
>   drm/xe/pf: Save VF GuC state when pausing VF
>   drm/xe/pf: Allow to view and replace VF GuC state over debugfs
>   drm/xe/pf: Allow to trigger VF GuC state restore from debugfs
> 
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  61 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  41 +-
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  49 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 419 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  24 +
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  40 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   6 +
>  drivers/gpu/drm/xe/xe_guc.h                   |   6 +-
>  11 files changed, 648 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> 
> -- 
> 2.43.0
> 
