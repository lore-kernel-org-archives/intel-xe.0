Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6120E7FDD8
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5468210E2BC;
	Mon,  2 Feb 2026 21:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOWjfdfn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ED410E2BC
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770067312; x=1801603312;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=znY6e/wXV+/CXOKg9Vc8QlpCI5t3coZ4Kq6eQuTmM5Y=;
 b=UOWjfdfnSJFDzOUqDL6IYKdMuTXMTysE46VcPUthTPxNIBhaexBPWM5C
 6YjF8IulsEFypvlkOPo6xgcq/UMi505s4/hDBZ5gXmtpcXoQRdEHiaf4x
 yqMizFVZLPYytDnC08IxbaM8jmk09Jz/SDS+EMHU1uZ7YY9Wxvbzztvuc
 1MjxBOBdZVmLTvBUGhfl4CTVdI9toBXErhQShMw2xjDl4t92RFDSeywHZ
 ucuK/elIzReDGd3je0iSmjJT/xjswwPiOT5lSC7nVFjK9DkQQITm5+jdf
 xrzAoBv+VED2qScQ7+zRy9SFUksF4ino2O6E9jxP+6e+6tcuq6mCtWvno w==;
X-CSE-ConnectionGUID: xN7EojEJTuiP08hDn1wTQQ==
X-CSE-MsgGUID: CMxHrNMBTZmbyx42Fs7nTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73831301"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="73831301"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:21:52 -0800
X-CSE-ConnectionGUID: 8utM/QVBSy6+umz8oogiPA==
X-CSE-MsgGUID: LGRpKStaSVGinY5Q6gr6FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="232543077"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:21:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 13:21:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 13:21:51 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 13:21:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXxeWlVsB+tJIhAn3j1dwUGAXGMsVBKjW+rnZvKe1RBtweZcyg6oJ1oQ80nMXUXIZI6gCPvbAx1W2DAq8ejG+0UKeV5gZb1vsQCPveNTClJmrfx1SL+f/OTIq4LzPNvGwUEr+yHXqXd3UAtpYCsmGy2HTUZ/h7nKA21ppwRt30oEB9rchZMfV1gwXWe7v2UNPNvgLGQKG+xBoDCe3Gw0gWAFGjI+25TkHeSIATITe3O7pzkKSQ9IzNDGZxE9pEF6uU8X1f7CqT5mWRVi50ys+uFUNWdJXgRFJeh3xwxzpRpnpZRQiTHjvTXoK/8ubZcjEY+bzMXisjFJM+TyJbvmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIYYNw6EEZVnEkAxbJIWiPBJZB0u0UajD6PNoaKjpyY=;
 b=qp6+AuIpjWrJpWeWt3dxozLPHFQSfM2tbroJnPy6WfkQ3yXwjMQMjH2KX9D6uL0RttGN4qewTGStcm4+3YF0rLQf9oFcxtFC39vwiQbkMGuP9xOaLxjSwwRu4HUk7orV9IDknc+oHP6o2DPGBghEENUiZBFQJslKSIjYUvWT39OWmWiewVyM5WV46WgHK9rNGjQHtlagxLGWtNKe4DklwF1+VoA6X71XO+pT3V681bkOD/bn4eiZDCaBNDRLPIWiXoSomLlYelLJXBEitB/FAZCJcH4MyDcxpTSmDxXjES7qRjcg54qcg/k9mWiDv9cMWoS8padabpyEhfpCZ76Dow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 21:21:49 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 21:21:49 +0000
Message-ID: <02283842-8975-4120-be6e-a73e1ae3f656@intel.com>
Date: Mon, 2 Feb 2026 22:21:45 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKckyBYZS5DSS5CQVQ6IHN1Y2Nlc3MgZm9yIGRybS94ZS9wZjog?=
 =?UTF-8?Q?Simplify_IS=5FSRIOV=5FPF_macro?=
To: <intel-xe@lists.freedesktop.org>
References: <20260128222714.3056-1-michal.wajdeczko@intel.com>
 <176964244951.203400.4954956577931515013@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <176964244951.203400.4954956577931515013@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::43) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 04813771-10bf-4e5e-6cfb-08de62a113bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjBhQ3JqbURnM2xqbVlUVWdtUDRWNkxHeGVFc05KZ3d5U01xRTJqbk1XU2pq?=
 =?utf-8?B?QTJTUDUzMUdWZ2QreGoxcklISXVSUHNkZUVGRGpEemFVU3pCZ2NYdDlNaUl3?=
 =?utf-8?B?RzVxakdUc0tNNWdKL1VhK1Bqei95SW1UYmp6elJIT2tjTWJ4dXJuMTVMakpu?=
 =?utf-8?B?OU9QNHpkQmJoODJ2bHl0Z1ZLdFowam5GREVVVjlpbHR1WjZmaFppbzBNdVR0?=
 =?utf-8?B?TnNCVFplR2drdCt2UUM1aFVlSW54V2pKZ2twRHlaRGR6eHNXRzJ6NFhyTUZD?=
 =?utf-8?B?NnNwWkJNR0VhRm45TFMzMUpJd0dHb3NPVTNKZHJwNnBac0xDYVJEckMrbzk5?=
 =?utf-8?B?T01qYU5McmNob2ZHWjA5V3VJa0d1RjRLTkEwcEtsQm1sZXFqcXdReHhDakU4?=
 =?utf-8?B?ZzdYM3EwUDlzbmdXMXRURW5jS2VQL05IVC9wMDJ5dFRteS95N2xibHFqUnVC?=
 =?utf-8?B?OVdwcUtqazYxZXVCblFNVXdOSmQybGR2dWgrcEZ0N1Vua2dVdzFpYWZOWmFz?=
 =?utf-8?B?SjBTNENnUFU3UVRuT3RiajVoMm9sbkdNUFJuczhKaGxzMHlDOTU2M2lmbHhi?=
 =?utf-8?B?WE02cjNRT0lWbXEwa1M0elc2ckdaQ1ZaVmdEU0NVM3ZuODB1V2tIRDR6MWZr?=
 =?utf-8?B?Uk04RWo4VTBrMzBLMDR6eGJ0SUxkNVJBZGJuREJsUVFXOElZMG4vQWk3Tm5h?=
 =?utf-8?B?bmQ4SkhSZEdEaG91R2ZRcy9RanVvZSs2ZVU1UnljOVlEQndNNUtkTE4xd2JI?=
 =?utf-8?B?eW5VQm9JdDNYdEVMaDBOUHhkYkVCSEpibkpTY0pwaG1veWhWSCs0NHovUk1T?=
 =?utf-8?B?NWd5YjZRUURmbUJ6OFkzK01kK1hEWXhEN3Rib2ZXQVljWFNUdXMzcXVhMUZa?=
 =?utf-8?B?encveURlcm91V1AvRHJTOU41Tkp6b0h3YW8vYlhlY3ErMFk2VVF4N0dXSEwx?=
 =?utf-8?B?aFFoSkg3cHBSbmFPek91Sk9BaTBPWG13ZnhXL3hnOEpPU0J4cXJ6Q003bnNG?=
 =?utf-8?B?UWZEQlcvcjBTOGNsNXNub0pZNGlHM1JnMVYvbWo0OVk5aG1iVHVvS214UGtK?=
 =?utf-8?B?N1NLN0xmZ3IxZzV6TVNyR3dpdkNvZTVLSFdyMTl2a2dOVXNzc0E1WTBhenlx?=
 =?utf-8?B?eER5aDQ5VnVpdEtORDdFaFFSL0VzL2VJMS9qcnhtbHYrdWUzU2NCNFlkRElN?=
 =?utf-8?B?SmNmUWNrUjJHQVR3OG9wbitSeGRTcmZpdW4zY3RnazZ1UjJhanlYa3NTUnFk?=
 =?utf-8?B?dlZMeThsWVZWc3JFTWo3VXlVSksyaXNmVGVRZm1OMUZxbGRjTmdxV0ViM3JG?=
 =?utf-8?B?SFV1RkJJaUo2ZStZTGtldWphVWhhRk5QOWFvcnNuN1JiVnd0Y1JnMG1UUzM3?=
 =?utf-8?B?bnBiNW4wK0FDV0RsMUJFTFhOeXk0TGZOdzZZTkVacE4wYXZqeW1hRkl1dGNs?=
 =?utf-8?B?UVNSZlJTMnpVUW9nSW9EUkJRMlM4TlllYitUL1BUQWNxbVg1bVh6MGtUQkpV?=
 =?utf-8?B?M1BQYjNINDlZNDY2Zm5vVCs5Mm01bFEvM3BhTUN2OVphWVA1QmwwRGZGcG9z?=
 =?utf-8?B?Sng5VnF1Q0FZN3FwNlZSeFVqZUhXbURwSGFpSUQ2Nmx4MEJ4cGIvUlZLWTlw?=
 =?utf-8?B?R1RJMHducVUrVW1DaHd4bXlLdmFzV01RZTVDUmR6TkR3OHlNVmVjNW9HejdP?=
 =?utf-8?B?eFZVcnBOTGUreHQvL1YzaXBmM1paOEhKL091WXgxUmlDRE9HbXFKSjlwUDhS?=
 =?utf-8?B?OHFSdjlkTVNqNW9GbWVXYWhrRVRRblFKa0RDb3NxMTB0UVF0Q3hwRktGVWRL?=
 =?utf-8?B?bEhIeCs3bzdCMjRzWW5ETE84V280V3hJeTFzTmtsNW43ZldNT1B2NjdaS3hO?=
 =?utf-8?B?SUVzUHJzc24rd2xYRFY4WDJLMUM2S3Y3M0g3MGlsSTBBL3drUWJXRmVnZno3?=
 =?utf-8?B?YVAxTE8wNmN2QVo3VzdUbGE3c3pRbnpxRGFxS1FLWUN1b01sbHdsT1M3S2R0?=
 =?utf-8?B?b0JxVGROZnloTGdvZjhGV3MvYjlQNFg2c3dSeXNvN3BrUkcrbmxYaFd2MTk0?=
 =?utf-8?Q?gxQXV+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUszU0RFUkpTSXNmU2dZY1E5cis3WTQ0UklsYzdnU3lWTHMvUjNHOUpVZU04?=
 =?utf-8?B?L3AwWEkxRFBHSWs3dzMyeGNHYVRHaGVPTUVQbEFRZHEwU3AyZkhsVHhrSmo4?=
 =?utf-8?B?WUswN1JEQzJhNm1IVGJobWkxT2lyRU1DU2d5ZXZoZDJzNmd3b1hwTDBrVlFs?=
 =?utf-8?B?Q0hZeDNMOW5WaW13ejZnZXVEVDBFY0JzRTBlSk1lQTc2c1U4TnlraGduMW44?=
 =?utf-8?B?b0V2Q1Y2Zkx4SVpKY0N1TzRxVitmZ2E5UWFVbitmdmhuV29JMFpuVElrQzh3?=
 =?utf-8?B?dWJaTVB5a1kwRDVySHhVTU1FYXBjUDU2SGNZbVl2ME0zbUdoVWFseTczVjNO?=
 =?utf-8?B?VkhmM3dTZDF0QldXNGVxNVNmVWg0OWVTcjBRQ0VQMDkxdU9VaGZkV3Y2d2Vr?=
 =?utf-8?B?LzZwaGFaVk41WE85VEZ2SXNqdjBieTFVSUhqdDNaOXgzWEQ0b01XQUR2anJk?=
 =?utf-8?B?bjI4K25iNTNSM0c0cHhxYWNLaEduTjlhMk9Ga25SWXdQdTFPR1gvVGF5R0ZE?=
 =?utf-8?B?UEtwZU9lajdGOGpCcnFyMXo2Nkl1QUpTc1JDVTdXTmw3UW5qVHNvcW5vQjAv?=
 =?utf-8?B?emFFLzdJNjlaeXpCUE8vdEowT3JaaWw0Z1paanZidnNXSElIVThpT0s2ZGN2?=
 =?utf-8?B?WlZHbFZFeHpUbFQ1aFJVbWREVVVKVmJHdEFTTElBT2tUZ3BTOWptRWg2N3Ru?=
 =?utf-8?B?aTBaeUhRUGtZVnlXaXVPdW9HR0ZGV09YaGdGYlZmWFhPNUxGVzFXcjJJZUY1?=
 =?utf-8?B?NVFRQjNIc1ZQdnBic3hMaGIwcitaZGxJZDd5Y0NYQ1pzNUhmL2xyT2FNelVl?=
 =?utf-8?B?RjBmS1l2WnRGSVJ6WXd5WkVCREE3Z1NubDBkSVVEeFU4VnI3L3VyZmR1dGh2?=
 =?utf-8?B?SC90M0hMbEFweS9YTjZ1QzZSWTNiQzdRM0preUFiWXdQUHVhaGRKS252WVRJ?=
 =?utf-8?B?c2JVZTV5QVNtUlBJSm1Ia1RMU05iWE5rNjRKWjljemZPQjE2TDdJcnBZRy81?=
 =?utf-8?B?b0JicGQvSnFVQkpBT20zR0Uvd0w1U2JHVWpmQUJ1ZVVKUFY2THA2R3prMzht?=
 =?utf-8?B?bnZiQVlMRU5vZHdZc1ROWXVIMnRrUkxOK0JUR2g1OGUrSVVUUnB0RHVRczBI?=
 =?utf-8?B?TnF3V29Sd0tsaDN5dFBrMGVXVCtUano1bC9SbmgrcGtoOUc3OVgwSzRSSnlm?=
 =?utf-8?B?RkxkYkVkaUh1amNCdkhjVjNrMlBlRGVRYUdSQnExZUhlckY4bWVoZWhJcHdl?=
 =?utf-8?B?Rld1MnErbEs5dXJCVTBCcytyVUlYMC9jSlJKYVZ3eTVDc1pzOEFRMVpsMG1s?=
 =?utf-8?B?VjJoUE13S0JGK3M3RFVsUEVxelFsakNJakJBcDNVZFdzRG41cDdFME4zQjNU?=
 =?utf-8?B?bERYWnRNekx4NlZNR1NvaTBjdlZTdElJbWRNbmFMbWszblJONkg2TCtpRk1q?=
 =?utf-8?B?b0owS1lTOVBxczI2SUNBVHRuTUR5eTVKOFl4QnF1bEtyZy85a1RBalNtUm5a?=
 =?utf-8?B?OENVa25PUjVwUnVNODIvZk9RTGZCaEZRbHhWSUtDbHZHclNYeTh2N1YxQjR6?=
 =?utf-8?B?YzRGak5jQmtTRWZVTS9YL3E5VjgxcGR2eTRVWWJ0bmpIR3FFS0J2bEkrZXA5?=
 =?utf-8?B?dVBKMndRTVl6bm15by9kYWY3OGo1Nlp6cWRkelc3M1d6NkQrejFVcTJPL3d4?=
 =?utf-8?B?aXdZbGIwNXl0a3R4aGx3ZGhnMUhnNFdYWlhSckxaWmRhV3JrZEl6YzN0Q3JC?=
 =?utf-8?B?K1dJR3VZYzlsbWtlRlVXU3J0Tk4wTnZJdDh4dmVuMUFUNXl2OXR6N2ZDYmVu?=
 =?utf-8?B?aXJNTThnZndqR2VXWlc0MEJ6c1Vya1FldklXeTlLT1NSS3pxeU4ybWk2RW1U?=
 =?utf-8?B?ck5GV0ovbXBQaDR3WStld2pzNXo5eFlwK2pOOWo0TGFhNElVR2VDUmszdC9B?=
 =?utf-8?B?dzRNeW94ZzV5NzBFblAyZGFVRllUUnJFR2tqMGJyZGZ3QkM1T2J4MW44V2J1?=
 =?utf-8?B?YlNKVU5JM2ZIblJRRzdvMzB1QktiQ1QzRDc3SEZtQm9CblBCbVFzU0k5VHJR?=
 =?utf-8?B?K3Z5QnhVUm51MzlnUmlMMTVFNDZCdkhldmtBY0xpdnlOL3JjMXNNY2pQRGsx?=
 =?utf-8?B?NldrNnJBaW04dCtUSEZTYm5EOUdSWWNReDdJN0NkYXVzWkJnSm1naVZtS3BC?=
 =?utf-8?B?RzN2YWlIRkJwZ3BmdnF3eWZLNUgwTWhlU3BtV3JiV3ZpOVlkY0RRbGRwYkNS?=
 =?utf-8?B?YnpyNjQvWlNPTVEwV2Y5VEVVTk1XZ2ExN09EMzhWMW5iM05LNnEyQ3NLR3px?=
 =?utf-8?B?QWlqU2JPdkJyZFhPMXdkZjFERENnVUhmdnRMMnB1VFNKZnRnMFlSN0hmN2cx?=
 =?utf-8?Q?xVGQQI2wl9jANsc0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04813771-10bf-4e5e-6cfb-08de62a113bd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 21:21:49.6166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8pb4iOxoXfMgx+aU0Au5GU2HUMgiZiqgHl9411+btP1VAWw0rkU6yIUX05rs13JK8I/NMV0IMzHlCXlEnm/ossM8ykikuCInh5fOuvfPLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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



On 1/29/2026 12:20 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Simplify IS_SRIOV_PF macro
> *URL:*	https://patchwork.freedesktop.org/series/160794/ <https://patchwork.freedesktop.org/series/160794/>
> *State:*	success
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160794v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160794v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-4465-8059f097e25f736bb3da09af6a9b283079abfd4f_BAT -> xe-pw-160794v1_BAT
> 
> 
>     Summary
> 
> *SUCCESS*
> 
> No regressions found.

It looks that the report from CI.FULL didn't reach the mailing list, but it can be viewed on the patchwork.
While there were few 'regressions' reported, none were caused by this patch.

