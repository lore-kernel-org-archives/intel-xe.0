Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDB0D4335B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 22:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9831610E304;
	Thu, 11 Dec 2025 22:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfVxy5fw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF3B10E304
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765492883; x=1797028883;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Vk7tBxiMgq61qL1dcEnPVAuelQdex8w8jfnTHRHDbxc=;
 b=YfVxy5fwCneIR3MOEpKFcnDN/vhZs1mNO3Hzp0pMYHaEOJv5itw9FEFa
 quKrcbaz4v1xKdgc7FFdRhumrPHbfkGxf2pambPSaFm/wYMZYMeF4wEWM
 wheUiUJuDo7Yr51JGHOehYJ6tsVkZ3vAtp/jkOQo4g+Mjh2qVmE9ThtVB
 rMm5bKYmphuDZ9QOvLmdh8LvG2Pd4jgMRlyvkK686fRPnl7QUozUXIZm4
 WAAhdCLMILrQXUwvyVfrzwq8dsIIGaieTwCnvVNprZO7rReLkSFqCWIBB
 2TCs2IFcC0NokDg1Y8xjPaLbSp1Q0u8tiIy2Tvdv81lQSnm1n0iWRzvVZ w==;
X-CSE-ConnectionGUID: zx2HtbiZRwW/dNxcxRRitg==
X-CSE-MsgGUID: OBQZzI24QReBXiiy+v8b6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78106807"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78106807"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:41:23 -0800
X-CSE-ConnectionGUID: GoBy69KWQO2lvZHAPxPylQ==
X-CSE-MsgGUID: fiRaHB0tRgKplpFROzg9Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="227562946"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:41:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:41:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 14:41:22 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:41:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4DgED5Srpooj/BZ+dX+sDtuPyD/MTvSagqNstcBcJqtRob8lLpX0XbzJOgcXNYV4jnQ7DJ3TJVoSPyeY844eIgCF9tB6V5uXx0cCvR2ThNmVUCMYoF0YdfaulfIQRzk0OkutOF6JoSW8wmTP9pW0ShHSY1tztha2KLAPdlD6TgLMBv9NiEn6nYn31bKtqxqhnMPnZRXZSDubmbkUoGmqcLHrW/4JbThAghVciUYgqcpbu8ytmWf1B8csd8jcfc2qqb8gLahb94le39GayVc9y2ZrT5lQZV5b+NFqQsUHmC3+jHEAXbhVit/wvoAT6J/9pSjTwtJHJaBPnwO2j+FAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qENWTZ1wORk5hN/wpfMSo3x+4mcumiH6ToYmxb4p7yY=;
 b=hTcI2JkA7lz1/lOc8hY5vCvVyY6kvRqTEytIlCxHjxr0aT+Pnz/YJTr2s56QDJQPQUo+Rccb+AMFc0seXMr+9B7hyuaDZj/w/b04v1apaC68RFuD4EYvuNQp3PUowIujrS3oa12QQcAKN6QQTX08ReAy6zPBq5lVb55UmGU0eCAdCoKPU3K3KYSw4AOgELPm49++k317yLROoUy2COZl+k3QksOdGQ4Ki7LxMklvlrE1dBgXy0V5CMTOLzHKsEx+X4ghEXUzBspdMCoau9WFCcONMr7HpSbnaWwk5Esu/jzcv7UKiMv36Nffl+xKPkuPM1eCTL7uv6e8iu4mZwdphw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB8106.namprd11.prod.outlook.com (2603:10b6:510:255::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 22:41:20 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 22:41:20 +0000
Message-ID: <f05ce10a-285d-41f1-b7cb-fa9cd199b567@intel.com>
Date: Thu, 11 Dec 2025 23:41:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] drm/xe/sriov: Prep for multiple exec quantums
 and preemption timeouts
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-23-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-23-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0131.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb01ee1-9172-4839-1a56-08de39066766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ymg4cmZYN2UvT05aT1N5bFM4bXJjWklIV1dBaU0xZGxLTE9LdEsyL25hMXpZ?=
 =?utf-8?B?MzZvbGhJaHBFVWtkQVRhaU16MlEyWkZvS0RRTzYyVUI3Nldvdy94V3poN1lu?=
 =?utf-8?B?UTExN3VsRi8wMjhMNDRJUDZNSlZHTWs5UTAzRk9MbFA2T0VlNFBwTGtybVhy?=
 =?utf-8?B?Q001alFGTS90dVdGUUxHc3ZhMzZUZmdKa0RiU3pmOENBUCs1SVBmQ1VMWEFl?=
 =?utf-8?B?dEVLOXhIOTByamhBSm5CY0pjTWJVYUFzQW1zOEZueHBXTi9PT2t6b1FnNWxl?=
 =?utf-8?B?Q3BRY2R2cjZEM2hYcFR3RU00cWJpdjlOK2xGejduZGcrb1ZrQStiRE9BY1Jj?=
 =?utf-8?B?em5BQzdnY0o0WC9jclJmb3NqWnJMekNFR1kzV2RaS3dUTSt2MjRVaVJ3YVFM?=
 =?utf-8?B?OUxXV3VJdmQ3ZGUrMmNXZDNJcHA3V25LZUJTYldidUR5K1ZxSTZITmJxUnVk?=
 =?utf-8?B?WjUxVXVHZUJ1bXB6eHE0REU3UXRjK3BBTW4wNTJKV1dkYkxUSDJRRHRhcGtv?=
 =?utf-8?B?RDFsQUU4YkhpUTdzSXJmVEdtRjlKb3dCOFNGMnBJV2tQZW9DcmNlYmdxSk1M?=
 =?utf-8?B?ZFkyRThMYmZmTEFMdDZlNEozT1ZMV1RxSncxQVpqcDhnL1BGK3hBcnNidXk3?=
 =?utf-8?B?MVgvMG5PTlg3cnQ2ZUVXZzJLZnZqNGtZTDR3QXhoWnJPYmlydGNTaFRueUJR?=
 =?utf-8?B?Yk83dTNMS1MvNFpGTFhiTEFrNkcxR05kZThVUnhwVEc1YnNxS2QrQ1lIMjU4?=
 =?utf-8?B?aXVPRlJtbldkcStYOVlTR2tMVFE4ZkJSVlBzeXY5ZDRtNVlhUkYwMUExa3kw?=
 =?utf-8?B?b2kvNzh2ckRQclZpTFc0QitWZkdodS9zWGt0cGlBaWNjZmxxTks3d0htejM5?=
 =?utf-8?B?aXFlNDZlTW1HTCtGU1pGdk9MWHY4aEkyeXdzcjg4WDFwRnUzdzhRMVVaSWNs?=
 =?utf-8?B?WnpjWU40VFRMV2xXODZKMGYraTY2N290TXJXdks2eUdjSk5SMWhIWTlUaHBG?=
 =?utf-8?B?eDArblNCcWVJZUZsNUZQM0Qxd0ZuRUowanRBUlc3a3BiUEorQTdUYnRtVjVR?=
 =?utf-8?B?cFNDMDhvWGY0QUNmajF0OUU5cThMd21sWC93YUJUT2tJY09BTTF2Tkt6ajla?=
 =?utf-8?B?UndBM204eHdtaW1DbVd5VG5VelJBd0pOcDkxbUxZZzhOb0lkMkVsbXA1OUhB?=
 =?utf-8?B?cGdFZ2VsaWtwbU5OaTY0SjVNZHQ2MWV2N0N3Qk5yMmVqdUYvTFNuWXpEK1lD?=
 =?utf-8?B?Q1dSSG1FVUF6WDdaR04yZGJxVFU0dFJPNldLNlYrUzEweW14SUp1R0hDcmlh?=
 =?utf-8?B?RERsc05JeUtNb3M5YzAycGloUHJmeHkvdjFibUtlTUNHQkhTS1BXYTAzeTF5?=
 =?utf-8?B?c241Qll3NzVhTzdlV1I5d3VzSHk3d3c4bnVqMElHQWIxTzFLbW5NOEtKTG0v?=
 =?utf-8?B?bmp3NWNQNGVDNGFtb2FtbGVxdmIrU1dtVmJRWXJSMnMrK0hOa2xEaTRDTmdZ?=
 =?utf-8?B?R1lYVElEckJ6ei9hN0tHSmI2anladGVZWGsyM2pObmhKeVM2ZlY3VjRrNytp?=
 =?utf-8?B?MHo0MTU3RVpsaDhMdllnZ2pFUHNGRUpTTDNLcUJ1Tk9HRHZVUjlmdExUZDdM?=
 =?utf-8?B?SzJzTGZxMFErSEU5NEhlbHFpL0oxSWU0VUR3OXdxRTU4NVM2L21waU1Rbmt4?=
 =?utf-8?B?LzlMNjZsYjByVVlheGZENTNUSWd2OTlFUG1lcExZNitnUzlVRm9hYmxCbUJV?=
 =?utf-8?B?Um9yVWhEdVhKVCtPN2d1Si9vTGEwbTduVVVsV2svNU1hVjhiWWtkNjU3U1lT?=
 =?utf-8?B?VUJCVm1ZcGFKTldPeXVkaCt6eCtNRmQ5UWdwbkM4SjRPOTNTeU4xakRPVXBj?=
 =?utf-8?B?engxbFFHcEo3TTJKK01qVWswdWxJQ21oOVFQZ3JlY2QraFhwcWZ1ZXo2TXk3?=
 =?utf-8?Q?6UN/ip0+AtnleQ1cFwIBtzp9wtN8fVvC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eklUdXFpTnJxMEFPYjU1dGtmVU5FWWpwRDhMQUZod2R5TkxVMWZka2NCaC9G?=
 =?utf-8?B?elBTQWs4TFNRWUkvUGNkQ1UrK2t2TkY4Mm1LTmdjNGZESHJ1WCtTemNVc0ZZ?=
 =?utf-8?B?bVN6OEtyT1hDRE5VcTQxVTllOFE2a1NvbGFQS3VHTFJWcG9WaXNxZE55eDlX?=
 =?utf-8?B?UzR2YTMxS0lsMVUyVW1zNXdna05QdEV5amVvdzR4TU1uT0xGaUVSalptMUFY?=
 =?utf-8?B?SkEzK1hDZWttNXdGQnpQS1JNUlVQa0FTU1AzVVNqZkhSTkk5eFJ3aEJ0VTVP?=
 =?utf-8?B?Ly9Jb04wdDliNmhhTFRZb01VQ2grdWsrZnMrQlFINzEwK2RPRDFzZHV4OW45?=
 =?utf-8?B?TS91aXdPTTd1NmVqN0c4eXVUVTdUZnJ2UTJ5OUNIeC93ME51bldQdkhZTUJZ?=
 =?utf-8?B?VmFLWnFSU1NzTEdDS3ZWMUlzSnNPYXFRTDM0MXB4RmJYcmJtZ1VrSjBoSHJE?=
 =?utf-8?B?Z0xNZm91amRKem9xMkY5UWY3S0JiV3Z5bHY2QXg3VUFZcjJ2RnJZVC9pWWhX?=
 =?utf-8?B?RmVTWDNIMDNKQjVTWDN3Uk1LUFB4UFZzM3ZwN3Y5UXRlOG5rSUtJdjRpR2sy?=
 =?utf-8?B?bnl4TzFUMlcwQ3V6Q29SbkdENm1ETGxPQWlkRjNGc3RhVWpmYjBZa0dkWlVy?=
 =?utf-8?B?VERNdGlBMFo2UkZZYkJEc1dhbmlpWHovK0hFUjF4UEJpWFdYRkc2bi9Ebnh2?=
 =?utf-8?B?Qk44SDJNd25IdDY4SCs3dU9XdGNiUTNiUUd0UlROYmpmZnZxRmxLKzE1aytq?=
 =?utf-8?B?MHlzZEJuaDNBNnN4Sy9HM1Q0ZVhpR3lkbk1CN2xPZmYvZSs2WDV0MjROaHBX?=
 =?utf-8?B?ZE9OTXJYZWRvWDdybTdIeGJSQlZGeDR5RFZROHI3NmFxSDltOU52dHJlVmc4?=
 =?utf-8?B?aDQzeXhNNVllTDBldm1lbnptVU12MnloOWErTUNnZ3RTS2sxLzRHNnRZQzh6?=
 =?utf-8?B?N1J1YUczR0RVcGNiMGFYQlk4emJmemJGNExGK3hvRDlWbEFHUUs3clBXWm5C?=
 =?utf-8?B?SDQzSEE3TVdvdzZtZzRRM0xIM2ZMUzRTeDhOSjBiaWxPOUZYelNaSVg1TnFa?=
 =?utf-8?B?UDRtcDFkSjd1UDY0Vk5QK0QwKzBHOGp0eEYzTHYxYnVZeWJLKzd4YTZ5bnhQ?=
 =?utf-8?B?cFpCSVNNT2hVcW5NMVlhanE3Y1ZIS0VoRUdlL2MrMGppQjhEa0l0ZE9xbGRk?=
 =?utf-8?B?M2ExS0g4VUNVaTVlV0xFTHZBRnZCdS9IYmFiR2NMSldqYnZNWmhqQUJkbHJp?=
 =?utf-8?B?Q3h5eGFwNFgxRjg5NGdyeWZpMktBSXBvYzY3L3pFV0ViaTNCN0cySkMrdk8y?=
 =?utf-8?B?OUszQXVRc2NOM2tCZlRLMUo1VitoZ0lrTW11ZnlWSkJLbS9XaEpRajAxSWRN?=
 =?utf-8?B?WVVlK2gycUpFcUVvMjdKK050Ni9icWtVeE9FblozRGhKRjVOL1hXYTNnWVBn?=
 =?utf-8?B?UEZKcUhQRm4rb01meFFQN2V1cVFsRTBXaFZUU1UxYlNlWVFTZHM2VTQ1Mm94?=
 =?utf-8?B?aS9qWDdHZUdQczFRb01OcG9URGcwMDF6blRRbTNuOTcybU1FSmcxa2RFTWFy?=
 =?utf-8?B?Z3RabW8xL0VrdnZoNnEzMTBRVDMxeUZQQ1I1UHI0V2JrUHlzVmRCWkZYc2N4?=
 =?utf-8?B?NzFQMEVEZHN0N2NDcFptZFltU1ZGcEcyc2xFQkk1TTlNM3B0b1RjUDFzTVFE?=
 =?utf-8?B?c2lmbndDMFBpRGJRek5RUDNucWxRQWZOWVExdi9ldXZTL05EV211dFJFeGo4?=
 =?utf-8?B?M25CbnVYU1ZtZUxYQW5CS2RBdEhoQVh4aUI4bjQvT2xlbndTZjhBUXVYZ0RM?=
 =?utf-8?B?bitpUjg2dVJXWVd0eStiN0NoaHdaenFURTYwemNTTHJuaHFPZUdRKzhtQkda?=
 =?utf-8?B?eHlCYmYyNkFqUDVZeFZKZ0tna0FYK2UvbUtBaXVGZ1JDT0pyY0c4cThxdjhr?=
 =?utf-8?B?M2NjVzNncUhSRHNnYjU2Nk11bHRBSldtbkI4NXZ0ejZyQ3A1NEV3YzFSSVdT?=
 =?utf-8?B?VHZySUJlWVVpMlBHS2o4V2xDTzJ5MDJ4VndUTjBOL21LV3Iwa3hNVUMzTVps?=
 =?utf-8?B?M0JkSnJMbnlINDBDeHRqb0MyR1NMVVlXN1VHUWtNSDh2b01qRnJleGIvQ2pz?=
 =?utf-8?B?aVc3ejBJVGVGVHEwUTN0dmZFMURTbVVUeGt2SU9sYldYQkxOOUFGM1FOS2tk?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb01ee1-9172-4839-1a56-08de39066766
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:41:20.2893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3S+nAHreyg9h39TbcMzFQFA9kEPt0Y+myJyn+yjc2I03rp3zpKX1ZlGtKQOtqikm4pS4q961IN9OO/81NULdWXFG3G7r4nFY5iBFg843yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8106
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



On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> Each scheduler group can be independently configured with its own exec
> quantum and preemption timeouts. The existing KLVs to configure those
> parameters will apply the value to all groups (even if they're not
> enabled at the moment).
> 
> When scheduler groups are disabled, the GuC uses the values from Group 0.
> 
> v2: improve doc, use ARRAY_SIZE for loops (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


