Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31DFCCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 19:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28C410E559;
	Mon, 27 Oct 2025 19:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="laOHlL+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E3C10E559
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 19:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761593302; x=1793129302;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8Ny6HOI5d2rkFa/pdTGdel8qMGIqptr/m3eCRmDsa7g=;
 b=laOHlL+EA6LPlfUa1YfKrY3CKYLPRmbd+MV5C90r/UDUsffZz8Atqs+f
 uvedifZ+1VR7lGylJxOrdt9luBuMmMBHYBEBafsPsf4BJiyTrsPtW7Pyl
 bWfU41uQmqWI9zdYyCVmxBjCetthQ4G7AXhrdYR6PIm9HfdygskVWpNHX
 +To3jw9KxiX2pXwknF+AMuw+jTzWNw1MT5zM9AJ00YMs41vgAZle8OB8H
 +pf0hM4J3VWeFRQ9CsGtBCze/zlNhs5ZAl/r1V2pygOXwHC4XD5yjdqrq
 fXno4Xh7SsX7sL0OJuwy4JAvb11Hln38nIJ0ySgBSUSXwmQGH8UVrWvGt A==;
X-CSE-ConnectionGUID: RDpOBbYcT/CDqh2no4V47A==
X-CSE-MsgGUID: B2VL/db7R4qOCEIcnsA29w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89154121"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="89154121"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:28:22 -0700
X-CSE-ConnectionGUID: CtbqbEZlS8iTA0r7T7ODfg==
X-CSE-MsgGUID: 1ps8Xg9rTAuXeGLX7AdC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184832077"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 12:28:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:28:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 12:28:21 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 12:28:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAxOI0IwwjP3Fp2MVarFfYbW6k4j5XOFakwUnG/hOKFha6nw6+nGMVTRc6f1kUCOOHM93rldF2yZtxX4jGRGAFGxXxOEnyDiNmLu04rEV+19x0+vtycHEhXySQTUjE3rGg/a6YE1CXxhDMPQi/qBL4PYicAgioXSrTeeNjSgoq8ayMOFxDMeeBulHeYLQmBQgveMVtNGN4XOsiMlgmqaOezT/fLRQuZ42jyTT3u1XcPhdlb92l79ls9HQzv1kJZo9Ji0HSJuHLJkwl42Y26xByN5csr3jpKKo/8UVVXMSDk7TcLMvZfsi+t/BnzxA51n446hziCDkR4EsuYOiV8/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgOSxWEFBuW8DIQoN6ufiaF33wZcX1QJI6+f14yTXZ4=;
 b=L+B+EbZFqaNvmqLvxnrW0RzzqR/V/NztVHzACOvzvFroplIinMJ8qWenIE6/h+8JXNuZiO0EkHZ2VVMZWvx3aiFGKlqtML7G/xi7Y0Za+Px1bDGjhy3g+BoAkR2f0H02FJSWqeqSwitY9Eqv6ZvYcMexH9PSB6b4WzkOtSQpYg6Zemch/iJ/wxmgp4B8vXnmNEUmSfe3ZI9tQIfTa7DJyQdzKHxook0WgmkWOzx+i7ull7aT8ctx9ScKVSSQoq6uj+3qZzr+zavnNUeWwrtbm9RvdiS3DX+MoC4yz6hf8Lfqg+/lNK0n4hB78lFAefvjWvzHvpDQ0SPeLh8zTJhLzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8089.namprd11.prod.outlook.com (2603:10b6:8:17f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:28:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 19:28:19 +0000
Date: Mon, 27 Oct 2025 14:28:17 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 07/14] drm/xe/pf: Allow bulk change all VFs EQ/PT using
 sysfs
Message-ID: <ckmsitfkv6w6wmtbhdu7wjglnrvdpvcftxvzcvzj4lgrpsfamy@msxzfdoaczzk>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a5ef28-5139-4011-b14d-08de158efc38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckhSZ2txblIyWnhHSGhHeUhrNEIwTzhPaURjd1pxVlVFbUVCOFh4OUZlMnV0?=
 =?utf-8?B?SS8xZ0ZWTVBPclZVVEs3QkljTmkzVElCRjluYjZueGdFT3VUUmFmcU94aG0y?=
 =?utf-8?B?Y01kdy82dWkzcTZHS0tWclc5blcxOE10VENkUlh5VnVYSGd6NEFSbFJPQ29R?=
 =?utf-8?B?dS9mdm5VQ0xFWFN5TnU1dGxHZ0QrNjFIQmxETlpHRlBIWFFWQW5mOXZ4dGQ5?=
 =?utf-8?B?eHg0QzVHR21VaUkzTjlQclBxYVIzRGFpRlowbUhwWjFCLzBwS0VCWVMxNVV5?=
 =?utf-8?B?ODlSVS83WUtoanFaUDdKeE9xdm5tVU0rVmRTV3FjMEo4T0FrRHRtWGx1Y0Zi?=
 =?utf-8?B?MitObHk4MldmMU03cFdCbHM1dWxwZUpoRlR2ck0vSmxDZXVPZ2NnNzZlWFhG?=
 =?utf-8?B?SU40K1dJd0crbXRmUjRndS9KNkIrR1l6eFpIQVBJUHhmVDArWmx6SXVzNlg4?=
 =?utf-8?B?bFZHYjdPYUFNR1c5UEhqbTNYUkZlU3FHS3JpL1pWSTR1VGtSM0NFeXl2cFNS?=
 =?utf-8?B?QS9PNWlvejcxYVNKNWFNd2FwL1VKY01oL1Z0ZjhkYWZjMlJzN25ja2FUbUxT?=
 =?utf-8?B?Mit2b1hRTWdZZ2VBdHhEMDE3QnlpZVl3L0ZGeHdlemFiWlVLYnUxdklnZzE5?=
 =?utf-8?B?RFFQQjZDV2Q2Uk5XQVdvK3NaM1hlOWlFeml0eVVZU2loVmpML1JUU2g1Vy9X?=
 =?utf-8?B?UHhzQVlhVUp0YkNrQ0RxN3RZRDRhSzEvdldyUjJtZGtmdjBtOE9QNG5hcnQz?=
 =?utf-8?B?dFcyMEdoVGZ2alYrKzEyenNKbjY4UE5CcnFLeVV1b0k2dU9BM3ZyL2Q5NWlo?=
 =?utf-8?B?ZkhCMXJ6Z3Y5b2JuZ3g1SXBCN0hPa0lKSm1Hejg4QVo2aXAyL3hPM1hoZHRU?=
 =?utf-8?B?a3lKeUp6VURzL2ZKb2dwZHJESzRoU3B1M2NHQTdDazZ3VXg1RXE2TzJFNUNG?=
 =?utf-8?B?cjA3K2VrRDdYZWd4RXFHTFRVWkV1emxNdzhJMmhuZmdHbEJYWFp2WjhQd3N1?=
 =?utf-8?B?b1VEdGpnYnJZWGpPdVowd0dtV0l0TlFQYWp2Zm50U2U2dWJ2alZZaERwWHBl?=
 =?utf-8?B?WnhMcFY1VlBzODFVcGJ0aG94ZFRESHNjWGhjOHhDU3hLS2tROWpIWTRNWUtK?=
 =?utf-8?B?UGpua2pUb05BdHkxOVZWWUtZMThlYThKcGR4ODlURTlBQUlSS0g1dkUxdlVq?=
 =?utf-8?B?ZWo4Q083SUdUMWJ5aFZES2d2UDJaTlVGSWVldUhwRjl2RTJYbVZjR09VdTJw?=
 =?utf-8?B?Z0dXOEcxb01IMkJEVlUrcmI2ZjQ4ejJKN3RuREo4NVkvUnBNSndpYlFSdVFZ?=
 =?utf-8?B?TGFLd1V0RDZuYXd4Qnd3TVI0T3hUT3J2cEZBQW1zSHNIMU00cjZzd0h1dGE2?=
 =?utf-8?B?MDg2ZEVCemJrTDdPbC9zSWdySXlRL1AvTWRzTEhTbk05K3RNWnVwZnc4Q1VG?=
 =?utf-8?B?KzZnRzlSVGo2dksyYyswTytVaU1mOURIWkwxMUpKbEwwOEl5ek95b05PUXZJ?=
 =?utf-8?B?UG5ldmJOVGdpTnBkTUtyOGZobWtjUTJpN2xCZWcrSlBUbTZ1NFAvVVlsL2Jo?=
 =?utf-8?B?a21mNmJjalYxWW0yNlgxLy9XTVc4YWZ3VFVvcUtVcE9vT2JFclJ5STJQb1I5?=
 =?utf-8?B?VFI2aWVZcDJOS28zRW44VXdnL3o1WUo4VjZ1dTdkV2FUK0NDTWNsUFZvZzFM?=
 =?utf-8?B?Tk5DbUhWVk5LVFZlbUpSM2JXSkNaYlpVcE9NdXlnVnVIcFhxNHI0bGhHbFZz?=
 =?utf-8?B?M0x0Ri9vWHVRd2pNdEZwZm9KQ0RKMTZoYkpNZ0JQTTJPekVsN1JNYnVySXJj?=
 =?utf-8?B?Z1Jvb29aWm9qWE1KMGxhQlJXR3VDOEhBUDRheURhdEFhaWp5NlpvbW5aTG1a?=
 =?utf-8?B?Rk1yRlRaQi9aMjdRR01xNkw1OUpCS3l3eWo5dWI3RzdtYnYvc1FtUzF0eWlT?=
 =?utf-8?B?Z2Mxa09KNWRGeVNXKzh0a0xnTWgyaVU4OFBNek15WTBPMGJ0S25ZUytSMVFR?=
 =?utf-8?B?cFF2TkVMMzNUM3cwdmdGdDcvbHFDMWtZbVRMdUF1Z2FxUFVicEJSdHJwQzBD?=
 =?utf-8?Q?r6Dpdz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3p6aU9VQ2JMdGM1YkdDNTZOY1ViRWRla1V0UTZ0NGZEYTlUbUR1em9ZY04w?=
 =?utf-8?B?VTV4K01DWDR5bWZTVG1MeStsSkJQT212Q0ZEdWVSVjIwMTNzV3NlbmwxaWRr?=
 =?utf-8?B?dDY0ZW5BdjFTN3lCclNPVHltd3pYV1dwMnZzeWNGQklMUUd4OS8wcDRMcDl4?=
 =?utf-8?B?OVA2cGlYR2dic3FFL2pvN2xRNnlaa09ZMFVhK2tEV3E1M2JiWU8yS2t4ekhu?=
 =?utf-8?B?UWNkR3RKK3JGT09QUzMvSnFKTlZkbDNoNlIxVkJPdCsrTmQ4WGJQMnFPaTZ3?=
 =?utf-8?B?SUhxQXRQeXZRSkdSd00vVkNyeWFodUJGUTBnMlcrYkVrN2hIKzl3M2JSTDJI?=
 =?utf-8?B?dEt6cUpISlVxb0pLZ2hqeUVDNjFCTmFJVzJldjJxL0tpVEVNektXMWlKS3pq?=
 =?utf-8?B?UXoraWNsSFlkamV1azF5anZQWllZSVFKaXc3SmJOOXVIOGdhSXlSOVplRjkz?=
 =?utf-8?B?cW9YZFhmWjYzN2h0WFBGemZtZ3MzcXAzRjQvSmQ2VHhIRDV6WUs1bm9QRkVE?=
 =?utf-8?B?R3ZjaEVxNGtRYis0cGhRTnVSdHRxaU1jVTlEN2lEOFFTUlc2bjVYN2hYdm5r?=
 =?utf-8?B?N0hoYXh3d2xqTUdQMjhJOGRrZzYwZ2NoNU1ZOUFyYlVwN09hZmNtbmtaUDdK?=
 =?utf-8?B?UGVYQkt6WE9rSmVRbXBOZXh2VWtFTXMyckpOWUUvN2FZeXhxbGRBTE12RnI0?=
 =?utf-8?B?KzZLYkFSMVAxa1VDU3c3UGFCRmxUVDFwS2dMc0wxTlFaamg3Si9uYU9oZSs4?=
 =?utf-8?B?WVNiaXBNQnJ2eHdHcExzOUc3dWhmR1FVaXVGbFliQ05obWN2TkxMeGMwVHVE?=
 =?utf-8?B?blZrVmZMcWRDT0JiR3hNQmltdWd4NzVKRjFRMHVwOUpHVlkxblU3TU13OTZ5?=
 =?utf-8?B?RWFRdXZwQ1VQNWhzaU85cHA0RHR5UEw3NnAvVlR5U0VLZFlqVy93VytGYWpD?=
 =?utf-8?B?akNrMENwcGZkbjh5eVcvSU9qYWtTYWRFb1JLZlM1cXBiUHNhMzdXakJpQTZs?=
 =?utf-8?B?OTF5Z3FZZ3Fxd09kNjRGc3ZmeHJ0eHMwL1BQOGpIWUMyTlR0c2xBeHAyVGUr?=
 =?utf-8?B?YjNCWlRkcTNnSTBtaXFBZmF2Ulk4eVhIMlF0Vkcxb05ncXdHWkdiTlY0ODlt?=
 =?utf-8?B?a0FIQ1lCdUQ1UFFjTGk3MDJNME9Bd2c4a1YxTGV5a3RtdmZjL1h2L012NjRT?=
 =?utf-8?B?TGRDMnptdWozQWlpQXRUbGVUaDhtcThFNloyOE4zaFFYdjlQbVk2cUl6ZGlh?=
 =?utf-8?B?RmFJb2htUlpxOWxUTHNIMUEwUGVsOVlxZ1lGenFZbGluUTVCdlRJSFBXUW8z?=
 =?utf-8?B?cGZpbWYvK0J5OUprY090VzBNdFkxeUdLbitCM0Z0WXpWaWRhWnE4SHAwbDBt?=
 =?utf-8?B?T3lCd291Yzh1alpLUElRaFJ5UWlHNUlzQVVuNjM2ejZUV0ljS2hjdkNNb1dF?=
 =?utf-8?B?VlhxKzRHUEF3amdMM0U3OExZcHNTQnBDVnE0SDFBbHE0VDdoUFVaa0VicTBy?=
 =?utf-8?B?eE5NelhnblRDK1RsT2MzMCtsQVNBcEF2M2NQdWU5L3NVYU9veDFXOTRvekRv?=
 =?utf-8?B?c0E0YzN1SEdGRzAzd2lMWmVSWDN2aHpUSVFwTDZzQkpOSzUyMHpxUUlSaTQy?=
 =?utf-8?B?bFg4Yk9udHZVRzBqK1ptdmk3a2NZdDVHbnpocm9JVXJxSlZRK3dsRFFnUkov?=
 =?utf-8?B?M1ZIbzVkUGdzZFhJcUZ1L00wL3F6ckdzZUxMZGVJQ3Uzc3Riak1DZGZJNEdh?=
 =?utf-8?B?SVp1Vm9qdXNNU2p0UTBMOVN3WmpFYkM2SXhEeTRMdkkvUW5VTVM0UC9reENT?=
 =?utf-8?B?cmlLWENrUnlhb29GNmRtcjN6VHo5eTRoRytoeVdxZWhKb2g1dFBnVFB4alov?=
 =?utf-8?B?RUFndm1pM2Z6eEk4UzA2TTVLdWQva0lhNkFCWC8wRlAzTnpYcHBFcFpyUis2?=
 =?utf-8?B?U29pQ2UxUllHQzZ0ZmxnTXZHUlB0K0hoUjBhc0FxVmphalBuR2hOZmVCUk4z?=
 =?utf-8?B?eXNnOXdRc2Rnc28ySk95OVBOWWpPVEM2N1ZtU1RtL25TYnRxNGJla0V6SzQr?=
 =?utf-8?B?TVg1bmpZWFMzZlY4a2NXeVRNV3VzOU93WWxENEt2TVl0amdXZWNqdEw2aFRj?=
 =?utf-8?B?SmgxT3FXTDJqUTdlZWNpQjJ0YUR3MUFhUmFvSG1zTDhWSVd0WEkrU3hMNy90?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a5ef28-5139-4011-b14d-08de158efc38
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:28:19.5910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptfKjKm0pfJ3QhEZidX4YX5hDnZRH4QCjJCw5UntBODTAdg6fKetBgxqgkeTMLXktR1ftlC+hKG2VFOUskYxhyWmw19npdeE4alOvbvMzrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8089
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

On Mon, Oct 20, 2025 at 08:24:07PM +0200, Michal Wajdeczko wrote:
>It is expected to be a common practice to configure the same values
>of execution quantum and preemption timeout parameters across all VFs.
>
>Add write-only sysfs attributes that will apply required EQ/PT values
>globally, without forcing admin to update PF and each VF separately.
>
>  /sys/bus/pci/drivers/xe/BDF/
>  ├── sriov_admin/
>      ├── .bulk_profile
>      │   ├── exec_quantum_ms		[WO] unsigned integer
>      │   └── preempt_timeout_us	[WO] unsigned integer
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Are there plans for a admin-oriented Documentation/gpu/xe/xe_sriov.rst?
Besides rendering the kernel-doc, we should give an overview of setting
these attributes, provisioning, etc.

Lucas De Marchi


> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 36 ++++++++++++++++++++++++++
> 1 file changed, 36 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>index d5ad7aa7a899..5c445094e223 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>@@ -22,6 +22,9 @@
>  * :
>  * ├── sriov_admin/
>  *     ├── ...
>+ *     ├── .bulk_profile
>+ *     │   ├── exec_quantum_ms
>+ *     │   └── preempt_timeout_us
>  *     ├── pf/
>  *     │   ├── ...
>  *     │   └── profile
>@@ -84,7 +87,40 @@ struct xe_sriov_vf_attr xe_sriov_vf_attr_##NAME = \
>
> /* device level attributes go here */
>
>+#define DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(NAME, ITEM, TYPE)		\
>+											\
>+static ssize_t xe_sriov_dev_attr_##NAME##_store(struct xe_device *xe,			\
>+						const char *buf, size_t count)		\
>+{											\
>+	TYPE value;									\
>+	int err;									\
>+											\
>+	err = kstrto##TYPE(buf, 0, &value);						\
>+	if (err)									\
>+		return err;								\
>+											\
>+	err = xe_sriov_pf_provision_bulk_apply_##ITEM(xe, value);			\
>+	return err ?: count;								\
>+}											\
>+											\
>+static XE_SRIOV_DEV_ATTR_WO(NAME)
>+
>+DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
>+DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
>+
>+static struct attribute *bulk_profile_dev_attrs[] = {
>+	&xe_sriov_dev_attr_exec_quantum_ms.attr,
>+	&xe_sriov_dev_attr_preempt_timeout_us.attr,
>+	NULL
>+};
>+
>+static const struct attribute_group bulk_profile_dev_attr_group = {
>+	.name = ".bulk_profile",
>+	.attrs = bulk_profile_dev_attrs,
>+};
>+
> static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
>+	&bulk_profile_dev_attr_group,
> 	NULL
> };
>
>-- 
>2.47.1
>
