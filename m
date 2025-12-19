Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A15D78784
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 14:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D16010EC47;
	Fri, 19 Dec 2025 14:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hhxmy0lk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819B810EC47
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766154473; x=1797690473;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7e+ytP01RAPF7U/hxn40YQC91xi8QLOfJXyGeE393+w=;
 b=Hhxmy0lkjlmbtGH9JnKAGmFAuWP8ZUZvV8hVWrkpjTKpoHGi3EORwpgG
 1LQ5uQBPoLAFytCZEdNOQV0ujLmbE4+c2ecKEApGH+bh8oq8WliGdobIk
 f6O5/MIMPecnSOXfSJVMiLB35abIoThPGGlOHl0tR6Uc1qniVhgjr8lrb
 MZDeqhf7980hcHdeb45Yh/u8tLx0ljZFR8sbczJK2SEzUdT17aMPgRV2F
 uxg8n5DIrfNeHT6ckiCR4nRo//wq2JilGAc6ELVEWDZZ0uLQ5x8MOTgMC
 pakiSDhbcHvAeH1RMH2qI4ILxcltz+yE8hnxkukmVyFfE98QLEn6cfM9t A==;
X-CSE-ConnectionGUID: oyITJxgOQ6Wn7eLfy24PVQ==
X-CSE-MsgGUID: XGjY4xRJSjmApYXRgGE/XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71960084"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="71960084"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 06:27:52 -0800
X-CSE-ConnectionGUID: QgfKNkqWSaCGnmdjFTixAQ==
X-CSE-MsgGUID: dXSCxXTzTwG4QiLIM11cTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203961141"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 06:27:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 06:27:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 06:27:51 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 06:27:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBD0UQEvaSKcN1136cPulm6z8CEX9DIaSNdy2/RysUndV6zvCp3vMcOtgBDHtpzgZI62sYb0dLsr/owyq4YBcNc79ll83eePucD9wk7c64OOth9SxUtb/niFaM9twvF32FgIilV9CvQ6kd1DJu21EH6kjDirqC4F1u5mVRzbPIIpkwIi6RoGafbFeuFg6IbY5F7GiKu0SVGB5x4FR4ZTOsR1LJQuk9Jyxy0QJCHAapwE129nzRoVZ+QTPnSwdUxPOb21i1ydBPiriA/oNHcyJo2ZAYvyBBkBx8lE/INjWqHdl5oc8B90SWzcTtZkB1a1ldCErjpCLITO1xsuCiL1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDEVj+CNucyWh/Nsv4BborVPr7Z+cVa61i6Jlzh7qUw=;
 b=Dj82cvK+DSIarrD2zWWyMwxC6hLRXHD2vjMvsJDxcJMzIauAFe8Vt66ssHEKmnWGHkO4vRM3bK3v/U4GOIMd172hwLQVvqPbTvi9+gkFtL8klzbn/H6dwMn2H3Hy8dpv3oQRT8WmCN6jUu2l4jPpauW4Fi//YPfH79ztH07TadS/OaoU3IgIu9gPQgf8exYKjeQyaSn9ZLMGNhMjrVLP4237nypRdNcHYI3L/68td1xtvyPSLR8K9fhbUu1GA4LOYMj389SppX5weRz6M3CofhE5A3tO1SjH5wtL3qwAGKBbqA5TWqvzQ3ZiJ9n+T19s9Iv0nQiQY8GapfTkd/HYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 14:27:47 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 14:27:46 +0000
Date: Fri, 19 Dec 2025 19:57:40 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/device: Discard check for lmem_init
Message-ID: <aUVg3EtDPVJ9hnm7@bvivekan-mobl1>
References: <20251217125143.2430557-2-balasubramani.vivekanandan@intel.com>
 <20251217231229.GC1180203@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251217231229.GC1180203@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MA5PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::14) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: fca966bf-9883-4719-0ada-08de3f0ac79b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MCtLazJQK01Kb0J0K0RXNzRPNnFRaWZHaVhydCtCVWJyU3FKdnVraDVBT2lW?=
 =?utf-8?B?SnhNZnhqOTVxb2FrKzBFcFBTRUFxU1ZqdzY0SWppcG4zUXloZFIzMU13K2Vl?=
 =?utf-8?B?WXNrTnZYV3F0WmVMMGpWOTVzbGl6TE9MRCtJdmplU21hYlo1Yk1KeXdmeVMv?=
 =?utf-8?B?azJReXBMSnRTVXZzd1lxaGpORzFPWlgwYzNWOE9GdDk1NmNnb1M2c1BIZGtL?=
 =?utf-8?B?L0VnVFNWVWprY2FUMGRTU2tSR3NER0JpdVlNWHE5aW9NNGpkUjdQaU9WMDNE?=
 =?utf-8?B?TmdBV1JrTklWWFFaeXJaYzhoR1EzNzFhT1RGL0RtMHJ2ZmN6RHN2SkI0Vkk5?=
 =?utf-8?B?TDNROU9tVytqeHNkbEhPNElUanpEUmV2d2tMS05XTmRPVmpFNGtzNXhuYllK?=
 =?utf-8?B?SUVpVXVLWlFCbEk1T3hqK2xBZGY2RjdTaC9xaWhQZEpuTFIzeTJoYjlnWXgw?=
 =?utf-8?B?THZxaFljVXMxZ3NlUCt0cEoxZXE4ZldJMkRFMHNTWTFEVndrU2o0QXY0TGVC?=
 =?utf-8?B?QUpmaU55Ujk4blBQQVR4Ry9lOWxvemc5blJicFRTVDlocUsvbUMrWHBiTnVC?=
 =?utf-8?B?Qllqd3lHQzVxUVp3STEwUHUxMktoSlVQRzI0cDdJK0FlMTd5YXZ5Z2F6dGNF?=
 =?utf-8?B?R0lBVXFPYzNCWEtyQVVVOHFSaWZzQVlrQkk3YWYxaW9KQmRrVHFjVi9UeXNF?=
 =?utf-8?B?QzU0RTVRYWVHS1MwYUgrS01TcW4zMjFnd1VFY1dqQjJmdTM0MEZZcnlUUGxs?=
 =?utf-8?B?ZjBZZjh1Y1BaM1lHaXR2OTZ3WVp2RWxuc3dtaUVGRXBhUmhIN0Q2a29nbmFl?=
 =?utf-8?B?UE5DZ21mYytYd3Y1VTZsZUtCMWdrYS9ucmpEU1k4K2xOQkRIS1BHNDRITGhE?=
 =?utf-8?B?OUFqZkx2Mlc2RllzNUlIMVJGM2ZPUnNZdmJMOVd1MFUyREtOVytYVWpjWTI3?=
 =?utf-8?B?dmJFN29hSjc1UHZKaEJUaFpVL2hEZ1BpaVdMbEtqZUpnN1J6M3NJdXAyR0dR?=
 =?utf-8?B?L3dTNEFYQkFQV2FkM0prZWJ6M0d1em4zTXV4QVhXbTZWblk1cXlDWk8rb3BM?=
 =?utf-8?B?bk1MM0JyblUzRlIwMzdyZ2t3VVYwS1N2Y3ZtSzR6TXg1aHdhbWwzZGExN2wx?=
 =?utf-8?B?dmdqeWoyV3RpMGhKdyt4T2p5dDFVYkNOcU1Cb1BQaUQ5Y1MwdE54eExHS0JB?=
 =?utf-8?B?S2dFUVdGZ0hsUWZHdDlRN245VEVHcG5RTVZkWStyc3drNWxLTk82Z1NmbktG?=
 =?utf-8?B?NHFaRnpVSks4a1NORkpHRUQ3aXFKRExEYXREZ1RhNTFaYnUzL0ljLzAwTy9t?=
 =?utf-8?B?Z2YyNWt0YmZ4T2pFNnZiVVlMS0FZdW52TlRVYkZkQXltb28zVHRndE1lclJw?=
 =?utf-8?B?Nk40aHpBNUtHeHFGTmlteVdYRExiL0hBeDliU0VycTRWa0cxNTR4cmpQQnZZ?=
 =?utf-8?B?OUcxZHAxcXJLSVZuN0JMTFN3MVhYaXg5RDdiRmZRYkdHQXF4bmQvN3hVa3Vw?=
 =?utf-8?B?bnBWakZHNDlpdS8wR1RTKzNYV3ZiMyt3Z2U2RVhtQS9CeER6OFU1dnd0RjNs?=
 =?utf-8?B?c3pKYnhsRXpubzZLelg4elpHbDR3T1k0a2ZHZS81amliVFN0R3NGOUpVTGhy?=
 =?utf-8?B?MmVhN2hUMERPbXNZL09Ic0xhd29ZSWtJelBESktGTVQ5eDNNZGQrNThTeGNx?=
 =?utf-8?B?ZGN3NHhENm81S1QwUTZXQVVCVFVPcUhGbHRXUFhnZXJUaFV6ekh0emd4ZTlp?=
 =?utf-8?B?QkJuZ0RVOERYUXhrbURpbkhOaEdQL3g2Qm9KY01hbWNUenFKUjJycjhpeG9R?=
 =?utf-8?B?UHNRWHhGTXgzRmtiTnhib3RKQlA2Y1MyR1hoaytYby9LZWRrNkloZFM4SEZZ?=
 =?utf-8?B?L3NTeFo1akZFNjNsQnNOd1hPSEFSMUpua1FOZ2xTdnRYallHNldZMGFRR2dX?=
 =?utf-8?Q?mUlK+mQ/FE3YxvsZa+HzjdF6LLo2mPkd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3FKYVk1dXJXczJPMHFRc3k3RmhPV2xpV2RzWUEyZ0g5TXdRU3Era1pJVGJi?=
 =?utf-8?B?cFpOUlNMQnowSncwYnU0OFh6ZGU2SHI1eHVvaEVGdUpxSHJmc0ExNTdlZ0J2?=
 =?utf-8?B?ekozK1U5d2pDRGdWVUdBU28xUjUwS2NCVnhlZyt3a0RGVWVYSHlhTFBvaFpi?=
 =?utf-8?B?a0lPdnpBTnFMNmJkV21ManB5dk0zUTBZOUtoQXFHWnZiRU5KdDJmS21jaGZ4?=
 =?utf-8?B?bUlndjE5a0JISjI0WDQ5aXZCRW5udW5GcWxOUVRSRENpM280a21tYy82am54?=
 =?utf-8?B?WW1FQXRRcVJqbC91dk1TSjlvZTUzaUg0NVc3YmhmTUhzTVRVcFJQa3lIZHlK?=
 =?utf-8?B?bVJpM3pFVXE5TFlmd0tNLzdySy9FK3J6UXVOMzN4Y1VOSmQ0SlRBMnhycFRC?=
 =?utf-8?B?amQrbjVoV25QYmoxQjBrWXR4amx3c3pZYzFSQXltSjJUT0MrbWpwNmdDQW1Y?=
 =?utf-8?B?R0s1TmVjb1lzVGxwREt4d2FRNlhJYVhpSDRtR3MzdWlyMFZ5VEJPd2txZFJs?=
 =?utf-8?B?eUhWWndoT0hnVHF5OVBhaXpnOEdKS3hlQ2hPM0F2ekY2cll5UDVWdHI1Y1NZ?=
 =?utf-8?B?WlR3N1RSRTNJV2lKSjRvR2ZCZ1pKR0IrblNna1lzNGNyeFRsRW5GY0dteEtX?=
 =?utf-8?B?Q0kvN05yeThaYVZHQ01vNERJVlVXQUJxTGlwMUhIT2wzL2tsUDk4U2tLbEl1?=
 =?utf-8?B?UnJFNm5HY2FiaXA2V0VTYjk1RkMwd2hDaTVNa0dOd1A2ZUFtaEtvUWZ0VytD?=
 =?utf-8?B?NmFXTXZPMmdicHY3c1JhejJNUGxQa2JLNWlDTWQrbVVMbHFGdDE4aXplb0Zn?=
 =?utf-8?B?enFiRUVMaFpXVkU0MDVNQ2tWYUx0am1ERElmWkVIeUs4M3lnYld3MTh5MUNa?=
 =?utf-8?B?NmJLQUorZWRJRisvWDNseS9CU2tzQzFQNUNHZW5EL29leWtuUzlVc1ZPT3JT?=
 =?utf-8?B?NjZGK0VpMitzeXZvdjltTUEwaUZpQTg1UVlYK3paZGE4RVpKVkw2cHZXSUlG?=
 =?utf-8?B?d1d5VlY5STd5ZDJ5VmhUVnJXQUJEbmE0QkZIeVhSRXRNMEZEOHVSb0UyWXVI?=
 =?utf-8?B?RWZPVFBSWm5hR2NnK3FxaHJOalNFMnNnejZKZDhGamcwTm4yL3NRQnUrWnA3?=
 =?utf-8?B?UStLc3ZuQVlTSG5SYmw3R3JHRFFCZmxUTytZZk9Ec3NXSjVpemwzU2M0WU91?=
 =?utf-8?B?ZENkSGYzTkhCQUhReUE1QU1BaGlXOGkwS3MzYXlSazZralA1UTA1aDA0a082?=
 =?utf-8?B?Z1VIOG5TV3p1YTFLTUo0bklXM2wrZVd5N01ZdkU5WCtYb2plYXJtdElEY2px?=
 =?utf-8?B?S3pVSnNKTy9ZN3F5SmNPZm50bHpFNG9rV0NydFVhQ1Fvb2lIQXhXY2t4c0FX?=
 =?utf-8?B?eDMwVjdQUmdNR1o2a0swcy81T1lnRCtMcmpVUk55Um1ueHRkMnhTRkpFS3hO?=
 =?utf-8?B?VVEvSGEycUN4Y2NLVm5WTjByZXU5eU03RWZoNW5KTjk0VjZEM3FZVUY1VDBZ?=
 =?utf-8?B?ODFqb2dzYWN0NExoOW5lRytiK0svUDl2QitBRFA1R2RZNzQ3MGhCck1JcWZK?=
 =?utf-8?B?ekt3VE9vRXcyeDlxNE8rdXBGN3prMDVqQ1dOM3RvRlV0QlVwaWE1bHhWdDN6?=
 =?utf-8?B?REszYkQzbHo5Z3lUdmZyRGk2dnJ5L1Z1VENvZk5vWWo0WUdScUFkWnNaVkUw?=
 =?utf-8?B?YTNmakFPRStXSzRVaS9mUW5NeHVhUzNidEJDbzROUGZocFd2OThsRFNmbVNJ?=
 =?utf-8?B?eWhjcmtXQUNSKzBpQ1lKUHlOMi84K2NZNHBtcEYxYkVyZDFHRXg2M3ppMGp1?=
 =?utf-8?B?TUwzRWFVaUlyRERyOXdtWXJncWhoMVdpc2FVV0hoSEFJb3V6SnBpK042VWxa?=
 =?utf-8?B?eStuNmlpOWQyTjBuREpCWEp2akZDVHZDQWpuMGhkVnl4STdiQVVsSGhxQ1Yv?=
 =?utf-8?B?RjJLSWNhTVY5ZmMvdDZuVnY5RzJXMkRmTUJpL1RJeFF6YlVHenRFUE4yc2J2?=
 =?utf-8?B?TWNHT3ZVaFlkRFVTZlNKTnIrTStBVlY3WEpKSFJrYzh1N1VtcVNRU2kvTllt?=
 =?utf-8?B?bEFGWUNCTDhkU0hCMUZIbXlWNkJLRG1oV0ZscDlsTVhDTDVhdjhqOXBTTzND?=
 =?utf-8?B?Q2lPS1BwVWZJMitQcmtSbm5HTi9YYTJGZHc2VysreFFEaTU4VVJOSDlwenh5?=
 =?utf-8?Q?b9m7yaqQLoVjqemudeHotAU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fca966bf-9883-4719-0ada-08de3f0ac79b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 14:27:46.8246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHST+LJ7Mbxd5QL1OoZhsjb4cXr72ly4Uqu94O2hvLQeKyqoefeIFWVT+zn+aeQHsAUTzKBo0QYFnkl9WqKIDt/bsacu+3GgoMDEwnGA7mAJHFaeVTHxijBYyEZOodvm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
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

On 17.12.2025 15:12, Matt Roper wrote:
> On Wed, Dec 17, 2025 at 06:21:43PM +0530, Balasubramani Vivekanandan wrote:
> > Prior to lmem init check, driver is waiting for the pcode uncore_init
> > status. uncore_init status will be asserted after the complete boot and
> > initialization of the SoC by the pcode. uncore_init confirms that lmem
> > init and mmio unblock has been already completed.
> > It makes no sense to check for lmem init after the pcode uncore_init
> > check. So it can be removed.
> 
> While I think this should be fine on our current platforms, one thing
> that worries me is that we'll bypass xe_pcode_ready() if we ever have a
> device that sets skip_pcode in xe_pci.c.  No such device exists today,
> but if one shows up in the future it may not be obvious when enabling
> the platform that we'd need to add back the GU_CNTL check (or something
> equivalent).

I agree.

> 
> A couple thoughts:
> 
>  - Maybe we should have an initial patch that drops 'skip_pcode' from
>    xe_device_desc since it's not being used today.  If it becomes
>    necessary in the future, then we can easily re-add it, and the
>    process of doing so may help remind us that we also need to do other
>    checks to make sure the device/lmem is fully initialized and ready to
>    use.

We may not be able to drop skip_pcode because it is used for SRIOV and
going to be used for a future platform. So I am not dropping skip_pcode
in my upcoming revision.

> 
>  - Maybe we should replace wait_for_lmem_ready() with an
>    "assert_lmem_ready()" function that will just do a quick sanity check
>    on debug builds.
> 
>         static void assert_lmem_ready(struct xe_device *xe) {
>                 if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>                         return;
> 
>                 xe_assert(xe, xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT);
>         }

Thanks, this looks good. I will update.

Regards,
Bala

> 
>    That eliminates all the looping/polling logic, but still helps make
>    sure we don't miss anything if we ever need to skip the pcode step on
>    a future platform (or if the init flows change and our ordering
>    assumptions are no longer true).  And since it's an xe_assert() it's
>    only active on debug/CI builds and will be compiled out on release
>    builds.
> 
> 
> Matt
> 
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 67 +++-------------------------------
> >  1 file changed, 5 insertions(+), 62 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 1197f914ef77..3818d0cccb0e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -8,7 +8,6 @@
> >  #include <linux/aperture.h>
> >  #include <linux/delay.h>
> >  #include <linux/fault-inject.h>
> > -#include <linux/iopoll.h>
> >  #include <linux/units.h>
> >  
> >  #include <drm/drm_atomic_helper.h>
> > @@ -630,63 +629,6 @@ static int xe_set_dma_info(struct xe_device *xe)
> >  	return err;
> >  }
> >  
> > -static int lmem_initializing(struct xe_device *xe)
> > -{
> > -	if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT)
> > -		return 0;
> > -
> > -	if (signal_pending(current))
> > -		return -EINTR;
> > -
> > -	return 1;
> > -}
> > -
> > -static int wait_for_lmem_ready(struct xe_device *xe)
> > -{
> > -	const unsigned long TIMEOUT_SEC = 60;
> > -	unsigned long prev_jiffies;
> > -	int initializing;
> > -
> > -	if (!IS_DGFX(xe))
> > -		return 0;
> > -
> > -	if (IS_SRIOV_VF(xe))
> > -		return 0;
> > -
> > -	if (!lmem_initializing(xe))
> > -		return 0;
> > -
> > -	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
> > -	prev_jiffies = jiffies;
> > -
> > -	/*
> > -	 * The boot firmware initializes local memory and
> > -	 * assesses its health. If memory training fails,
> > -	 * the punit will have been instructed to keep the GT powered
> > -	 * down.we won't be able to communicate with it
> > -	 *
> > -	 * If the status check is done before punit updates the register,
> > -	 * it can lead to the system being unusable.
> > -	 * use a timeout and defer the probe to prevent this.
> > -	 */
> > -	poll_timeout_us(initializing = lmem_initializing(xe),
> > -			initializing <= 0,
> > -			20 * USEC_PER_MSEC, TIMEOUT_SEC * USEC_PER_SEC, true);
> > -	if (initializing < 0)
> > -		return initializing;
> > -
> > -	if (initializing) {
> > -		drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
> > -		return -EPROBE_DEFER;
> > -	}
> > -
> > -	drm_dbg(&xe->drm, "lmem ready after %ums",
> > -		jiffies_to_msecs(jiffies - prev_jiffies));
> > -
> > -	return 0;
> > -}
> > -ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
> > -
> >  static void vf_update_device_info(struct xe_device *xe)
> >  {
> >  	xe_assert(xe, IS_SRIOV_VF(xe));
> > @@ -740,6 +682,11 @@ int xe_device_probe_early(struct xe_device *xe)
> >  	if (IS_SRIOV_VF(xe))
> >  		vf_update_device_info(xe);
> >  
> > +	/*
> > +	 * Check for pcode uncore_init status to confirm if the SoC
> > +	 * initialization is complete. Until done, any MMIO or lmem access from
> > +	 * the driver will be blocked
> > +	 */
> >  	err = xe_pcode_probe_early(xe);
> >  	if (err || xe_survivability_mode_is_requested(xe)) {
> >  		int save_err = err;
> > @@ -756,10 +703,6 @@ int xe_device_probe_early(struct xe_device *xe)
> >  		return save_err;
> >  	}
> >  
> > -	err = wait_for_lmem_ready(xe);
> > -	if (err)
> > -		return err;
> > -
> >  	xe->wedged.mode = xe_modparam.wedged_mode;
> >  
> >  	err = xe_device_vram_alloc(xe);
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
