Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD7ED3901B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 21:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70D710E1C8;
	Wed, 14 Jan 2026 21:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YD6PlyBC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1621710E1C8
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 21:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768424880; x=1799960880;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MB0zVfjxmg39YYKZh8WJZtK345cjq/bX7PulwwLCFT4=;
 b=YD6PlyBChr0lNSJulR1bSTIrxU7KQVMXuhP1CKRoYpBIHOqFCEHG7NUz
 efxM0doLsrxyzsJ5YIF8JEPkkH9ks09ix7Wqpn0uo9B20QR+QbpL3Ljdb
 tp3p5T+EZ66OeogSD+eHBw3IimlJ3+ujWtKd5jsxTNOD7xwXa9fpE4wOQ
 aI2opzosifU9gH6r2aUWkGDm3pIfobhzE5X5tMXgKovq2R2QpuqsFPxAE
 26YonHZfJnafs4Ty5en72IuRlIKbncekBGMkVHIbHYUoxL1+IovZ3F6vg
 OiNnsHWRVvZHlEHHchG/yMtP9wINC6YAY7IN42s90CF32Mzb9VlWz7aOv w==;
X-CSE-ConnectionGUID: 3QkjtkKfTvW+OUgefpgxFA==
X-CSE-MsgGUID: mvg2AzjmSNuk9m41xROf8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68941540"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="68941540"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 13:08:00 -0800
X-CSE-ConnectionGUID: l4SsXaU9TGOjaX/6BohPhA==
X-CSE-MsgGUID: AgzPV+vcQgyO4Rpzka1RmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="236027706"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 13:07:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 13:07:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 13:07:58 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 13:07:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svuNlf3gvH1MvxToOZnHTAroN8I7RrGiDZvdBj8X7NjY0Y54hZBwRU33rBZvtoWo27ExZeA75tDEyapNjnBfP/0fqMLhngUcFbTYAd/marVPujMaaa3rwW4j9+tHdThZDomQduQxO/Phof/wYq5q6csM+FLzljIJMiBe6F4B6PRy2dXJrsANfpdSeFE5igW+csCc6ufi1SrmpPwsrvjnavO/lfb6RPM6AoeJoA0fIHYFf4Nbv2IgOMNjT+cTOSNsfFHfEpu/cI9cy1OtySMA7Erk7SG2jcpwhRKsoWgoXU4FWcHbncVowMYA0EosbR3H6sfMqhZKhE6oMps4AzDVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaQQiZP+kUAFTk/EPdZRGnbU0qR13WhhwIZpfIfS2tQ=;
 b=hLdppdXm4kRZeN71ytZ0YXAQapRx9Gdpd5hEZoQYPGCnX6X8ngYUuqUllAOwsaPtJrpTwGdT8gyUd5BjvW9E1sTfIwhmpiqJSCKkqlSjprO5fTxXClriFAux+S5UMSZwiUKdjbz3w5M77YWj/NosEDsHimLAKM3DYudWWQdBlxwueHwTeeCBz8uYDrMmuLpDaN3zmsLf19Dz4l2ynMlxUpCFkDkgaxANW1jRhqCrntG3+0+gM2Xv9HSTTQbZg6smHUwzjVfmQEV4C6yPXr4DneQfbABqhRMLiMTRDeV2WnNCaKvoZfzCCogLPfRZysfKtQ88fS86PqxFdFoXZQYZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 14 Jan
 2026 21:07:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 21:07:53 +0000
Date: Wed, 14 Jan 2026 13:07:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe: Reduce LRC timestamp stuck message on VFs to
 notice
Message-ID: <aWgFp0N3XQ0Vk75I@lstrano-desk.jf.intel.com>
References: <20260114184905.4189026-1-matthew.brost@intel.com>
 <cf8ccdcfa6e3e22b0979d88f6eeea5f2cf4e4a2b.camel@intel.com>
 <aWf+tGpSKfxmaQ+g@lstrano-desk.jf.intel.com>
 <563ccee86f66c06aa0eebc9430b06641eff36857.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <563ccee86f66c06aa0eebc9430b06641eff36857.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: b35d1c90-5841-4a76-1505-08de53b0fb6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTV2Yyt1NWtGZEk2ZmF2YWl3dzVjRjI2S0w3bzhicjdXZU1SVFUyaGxMdFd4?=
 =?utf-8?B?L1FyWktYc0h3aW1waEZpUno4Nldxc0N6L3U2Tld5UE9tazNpOHB0ZCtxakFS?=
 =?utf-8?B?eXVjdHBTeXdialBJSzNiN3BUWC9aSE5mcTBpYitWK1gvK0Y2MDNtTStXenRp?=
 =?utf-8?B?emNWWTRIVk5ZMytNcHFhVWd6Q3ZxNnVxZkhYYlRzb1EvN0o2OFJtYlpEUzhF?=
 =?utf-8?B?a1hNeVFGR0JxWHFEQll2UG96UnJhdWttWENSdE8yV3l0NzlMdE5PS2cyMlkx?=
 =?utf-8?B?YTFiM1AzeXBJSG01Wk52K1NicTFMNmsvOW44Q3RQY3RuYWtWa1RsM2prak5X?=
 =?utf-8?B?U2pFay9MdmNscllBYU5TU21kZitBYms3c3dXelZLREpyRWxXNnE2anAzWmxi?=
 =?utf-8?B?VGN2QnpiUzVuZUE3VlZRM1R6S1NaTTQ0amxtOExoRzhrZXhBaDU5bkV3b08y?=
 =?utf-8?B?V1J3RmxmSkNVVlRIb0luOWpJd2czV0xjeG9XdG82OGNrL0RJbWdxYW9DeCsx?=
 =?utf-8?B?cVJVOWdaVW5NTTB0N1lmeUxwRnJ0WmZscVcwNnJIbWswMEhJbi9HM1dqdmEx?=
 =?utf-8?B?dStuR0VBN3NBTkNBRmZhRGRneGN1Mm5Udy9id05LdWppL3FuaE5QZ1g3c1hh?=
 =?utf-8?B?ZSttSzA3N1dyRkdoL3hmQmFIQytCL1JSMlBYRnI2Sk82TVlDVG9KblhJclNE?=
 =?utf-8?B?UUFWb2tmSzRHV1dWcHBsdjhzNTF3eGVSOXJtbEtkKzdUWFFvNFJERFQxSzFS?=
 =?utf-8?B?Uk5WNUttQTFkMzRHRUhZQmdyd0hrL1Rwc1lZZCtKRS9QcHF1ZlZxYzZsOVhF?=
 =?utf-8?B?KzNWZmxGOHRCT3U4MWY1aURhZHhkTmlXRnVleW1VS2tpOFQ5NUlFSnYrWGtW?=
 =?utf-8?B?eHVxcEFJZGRPUkptNGVwQll4SlRxNXF3dUIrUXRrTjFBS1MrUEZ3UFluQWsx?=
 =?utf-8?B?eFdrREpMZlRncUNnZEZmSyt1SFhiSkxDR2h5NG5kSmdXYUlPYnhYb2Y4NTZ5?=
 =?utf-8?B?VDFqTGllN0Z5bEk4U3hwUUNlMmN2aGhLblVESDhFQVRVakdqL1ZpL3lpNWd0?=
 =?utf-8?B?YStZTEd2MVZvekR2TUxvcGNiZytEUDBCUm5FejJrUGovT3p1VmhQUlN4TGpu?=
 =?utf-8?B?WWVGZm1oYkRMdHRQd3c4UE45TVZhZHQvT2QyY3dHRFFpaElIaEl6ZGdlUVhO?=
 =?utf-8?B?SEJFSUd4ajFPYmVnNGtTMk9RTVF4Z0JRWU5SZUFuTkZNTndwYUoxZEwvREMw?=
 =?utf-8?B?a3o1Y2tuQnRGYzlHYmhHMlBrK0JteG5LRWVWc3E0ajc3UVRPSmlYL1k5UXF3?=
 =?utf-8?B?a0pMU2NuSUthYjdtT1dJeEMvSzk2WXJmN1hQUC9PSnlIRk9vVjdldEVIdCts?=
 =?utf-8?B?a09vbmE1UXpGZVFMUG1ybTFMMmR4QVR3aWZjN3M0ZEpRUGpEUlkySjFwVDdo?=
 =?utf-8?B?L1BGa1B0Y2xyTjVMSytpSVlnZHlUSk8vZHU5MGlzaEprbEo2U1l2VFFMNWVL?=
 =?utf-8?B?SjVWT0ttcDVTQk92Mmh5emd5N3oyRmZEcVAwNjRkcUNyanMvdm9hTjJYYWZ1?=
 =?utf-8?B?dDUvaFIwKzh1NTVENm5QZktwS2M3TitNWHVRTlpESk12NmxpeXpjZHd3cUNQ?=
 =?utf-8?B?Z0pWOS9IWXlmOU90amRyY3hYT0lqWkptN1V6NmhTWENTMkdqbnoxM0xkWFJ2?=
 =?utf-8?B?dFg0V1dGUG1XNy8ydUlWaHdOSlY5UDQxa2xWeFdCUkpZVkcyUWJ6TnNwZWg0?=
 =?utf-8?B?YkRpREFXTFA5dTVBTXlUSU01dFJSWXRpUlNYd0NSWm0va014SGpFL3ZQYVB0?=
 =?utf-8?B?RXpZSHFXdVpXWkNoKytzVzBsamxZdmtnQktXWWRGdklaQ2RIVmRSUno2a3BG?=
 =?utf-8?B?TE5BK3JCM243MndsemxqSE9zTm0wRHpWZ0IwL0ptMjNNWTZxelRPZHZFTTEz?=
 =?utf-8?B?WEdtRlM3d2pmVHd0dW1iT0hYamh6MytPbkVDM21leWdxTWZ5ZHBDWHFucVF3?=
 =?utf-8?B?WTdzZnRKQjhocTl6VEI4R1REakdpWFhMOGcrL2tzTFdTZVpIbkFxaENuWlpi?=
 =?utf-8?Q?Ms0/Np?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm1wQW1Qd1dHcmJORVNMQ3B2TUtDNE83VGYzYzFRc3dhc1JjY29tbUVmR1Nz?=
 =?utf-8?B?UDhQenl4NUh6QnQ0MkRXeEhxOUJkMldRWlc3RDBXSGVuTFlBdWJDSkNtR0xh?=
 =?utf-8?B?bzAzNkxDOENMZU54Y1M5Sm1xaGE1UzdEVVY4dkN0Z1JyVlYzR2FPWUhXVVFE?=
 =?utf-8?B?TnF0Y2N4WE1JdnFsaUNqS05CVmtTaFIzbXdtb2VYZmM1TENQZHVYcUs2aVB3?=
 =?utf-8?B?Z0RVZEhjU2FYNklDV1JsbzFEYXZXWUI1R2xHZGFPV2ZmWktoN3hTRTI0dFBT?=
 =?utf-8?B?UjEvUHpUVzgzZTV0a3FlaU1mdWRheXRzbms5VnFHTk1waGV4KzdwT1RtcHNu?=
 =?utf-8?B?UWZ2ZnpkZUcwcWF1MmM0TWlXYThGTk83RG9Jd25qb3dDNzcxcC8rbmlpZEE1?=
 =?utf-8?B?UHNhU0ZpYnJBYjlFQ1ZGcXdWVTRYU1d2OWhWVURBWkhEWjdxalVyMzFmY05r?=
 =?utf-8?B?aFMraFJlQUtMNTFVVVZNM2Mrang1MzRyK0dMemdIM2NuL0E0UGloSzFiSC8z?=
 =?utf-8?B?WE03bldieldCSS9TUHdMQnYzQnVlZ1dhMC9KUzNidGFjT2dPKzFTSnRkRFpM?=
 =?utf-8?B?bTBuc0lZZkx4ekNmSGlvWm1ESzZWOVIxTHROYVltV21pMDZzZGpLaFQ4RkVh?=
 =?utf-8?B?eSt1MWVINU53WG15eE4zTUVMZEM3ZWMyMFdXejM2clp1WW9BNjhhUnZublpF?=
 =?utf-8?B?eWJkTzdKeS9mKzk4MGZCeFFFUTBzbzQrTUVMaWJlK0c1NjVsWVZDUUxpcWJw?=
 =?utf-8?B?T2tlbjErSXlzazVsRHBkNXVoOXN4SFZXU3pvci9LcUZxQjFOM3ZsS1VHNEpv?=
 =?utf-8?B?OTE5VjE4VDNKVUhPN3QzUUFONjc4U29pSUVJV0dCNUoxeWwrRUw5QlE2V2dp?=
 =?utf-8?B?R3BDKzRZUVJVa3J2TlRMeHV6NlVaUi9GR3NHZHhMb0FTSlJmSGFwK01nUTNH?=
 =?utf-8?B?eTNaakNNcU92YVJsMU9PZURVbVRkYVBDUFNQSXM2emtCWVhQSDduci9ydjNu?=
 =?utf-8?B?SkR3ODRhTjAwKzBjckxkZ04rTEZta2krQzBSbmlXRFBjOFVsMVh5a2dyaEd6?=
 =?utf-8?B?bmo2M3g2YkRFdE5sdXBBWmw1dGQ2MnJURWZjM21aakd0ZDVlSThnOW5uRWln?=
 =?utf-8?B?MUxZZWV1VUZPWkx0Vkl1Y3NhSTlsb21UTWkyREdmOFJYd3Y1Zy80SEhGdXhv?=
 =?utf-8?B?K2RSQ3VESzMvZXhXdFZ5ZU15SCs5TWF4WE9tbkhva1RsMUJ5Vy8zOWJ6blo0?=
 =?utf-8?B?YS9BbDlMREZIcnNZcldvN1NrRDU1T3p4Nk4rRDBKNHE1ZkpZWFgySGY4UkYy?=
 =?utf-8?B?eDlIdFhud3JlcWRqOUJ2RHNnNXZwbk0zRFRLOHRPWm1OdFJVWEN0blZsQk9O?=
 =?utf-8?B?TkRObTd6QzhZWkJCK3lmZGl0aGJYRnlmSGNKRUJtLzlhY1lUVENlcHBKSm1J?=
 =?utf-8?B?cllmUDhFeDNMMUlnbnhOeTBsRDAzWUQ5NE1rMHVXdm9VTEYvZzQrU2JIQllB?=
 =?utf-8?B?YjM0SnNVNnV0TFJyYUtJanI3ZVFBbFJ3d2wvNFJxL3hRZ1JTMWVzUVBBNHFG?=
 =?utf-8?B?MGh1bTJKekFKK3RxZGc2WHEwZ1puN1ByMUxHdTQ0amxnYlB4eVREM29FbEUw?=
 =?utf-8?B?cTVQT0hNeVF5bHNET3NkNVFJSFVadWRYMFpsa2hBTzh3dXhMOWZVcUcwYzV4?=
 =?utf-8?B?RUF0Y1lVZjdMcG5Jdi9JcEhmQkFJbHhPL0pFbzBIcVZWMWhIS0FQTmV0UHIx?=
 =?utf-8?B?YmEvQTdzdXlJcVpnL3R3TnA5M3cvMGp1T0hhSjhXL1NhZ0U1a29kOUt6SzRY?=
 =?utf-8?B?RVpxZ0NtNXlMeXhNdTVpdkw4ZlEzRGF4dTUrM1YxRkdQblljNEpkZnF5SGNx?=
 =?utf-8?B?WWR0MzNFNEd0Qk1teEpmdmJTb2NDbDM1bjBwTXJzUXN1MnZhZ3c3RVhJSTFZ?=
 =?utf-8?B?QzNlUnk4NXYxTThrRStNc0phdnlxVkx0YXJHcmRwQU91R2tPRXM2SEY4bm9S?=
 =?utf-8?B?MDQ3U0MyUmNoT1VBRGZEUlBXb0dLTHpCaGdZaHhPSW00YlFxSE42VWJXaW1H?=
 =?utf-8?B?TGg5MlliSGl0bEVLUkI0NkFVaEZ6SzdSRnZPaldJMmZpR0tKNVM0TVZraUpC?=
 =?utf-8?B?b3FEQ0w4UUp6WTZvU3Z0VmVKUDFZNllEMzM0YVE4V2JYZW5KWTgzeEt5c2dS?=
 =?utf-8?B?RlVYTWpoTjRmRFEvV0g1ODcwMWUyaGJaYXJTVXkrbDVLZG01TnJ4QTlZRm8w?=
 =?utf-8?B?OFArUU11TFk4WFBSMngweXpLOG81VzRzRmhNQWlrQVkxTUpMUm1Od2RKWjRl?=
 =?utf-8?B?TXdPc3hHb1ZSOUdIVGRYRkNEL2F6ZkpFMWg1NjBUMDhINHVtZzYxU0t4aGtn?=
 =?utf-8?Q?lEcjJmwLtAbCWih4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b35d1c90-5841-4a76-1505-08de53b0fb6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 21:07:53.2107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gsgqf0lWfUMSuzi5IYl1ndFs0CXvgYOMKub7wDXnUzhqk6NEp/XhkOxDl7+DTKW38Z6B4CoVX87HHy+5KKTuyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
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

On Wed, Jan 14, 2026 at 01:43:14PM -0700, Summers, Stuart wrote:
> On Wed, 2026-01-14 at 12:38 -0800, Matthew Brost wrote:
> > On Wed, Jan 14, 2026 at 01:25:55PM -0700, Summers, Stuart wrote:
> > > On Wed, 2026-01-14 at 10:49 -0800, Matthew Brost wrote:
> > > > An LRC timestamp getting stuck is a somewhat normal occurrence.
> > > > If a
> > > > single VF submits a job that does not get timesliced, the LRC
> > > > timestamp
> > > > will not increment. Reduce the LRC timestamp stuck message on VFs
> > > > to
> > > > notice (same log level as job timeout) to avoid false CI bugs in
> > > > tests
> > > > where a VF submits a job that does not get timesliced.
> > > 
> > > Ok and if this happens and there is an actual problem, the queue
> > > will
> > > be banned it looks like from the earlier patch, so should still be
> > > ok. 
> > > 
> > > My only question is why not move both cases (VF and non-VF) to
> > > notice?
> > 
> > The non-VF case the LRC timestamp should always be moving, if it
> > isn't
> > something has badly gone wrong and CI should notify us of the error.
> 
> Ok but shouldn't the job timeout generally be the same? (should we
> change that timeout to warn?)
> 

A timeout message is at notice level. CI understands that, but the warn
level here is triggering CI failures on VFs where this message is
expected in addition to the timeout message. For non-VFs, we do not
expect this message for job timeouts.

> And sorry if this is a basic question... but why isn't that the case
> for VF too? Because on the VF side we are issuing resets as part of the

The algorithm to accurately sample the LRC timestamp relies on access to
the engine MMIO timestamp, which a VF does not have. I’m told we can
make some configuration change to allow VF access to this register —
I’ll follow up on that, but until then, let’s not break CI.

Matt

> submission flow normally? Or because we want to make sure the resets
> from one VF are hidden from another VF?
> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > Is the idea that in the non-VF case, the reset is already an error
> > > and
> > > so the extra warn is ok? But in that case I'd already expect some
> > > other
> > > error message to trigger CI (like the engine reset notification
> > > from
> > > GuC). So the extra information here really isn't doing a whole lot
> > > more
> > > from a warning level (CI triggering) perspective.
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Closes:
> > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7032
> > > > Fixes: bb63e7257e63 ("drm/xe: Avoid toggling schedule state to
> > > > check
> > > > LRC timestamp in TDR")
> > > > Suggested-by: Daniele Ceraolo Spurio
> > > > <daniele.ceraolospurio@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c | 11 ++++++++---
> > > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index be8fa76baf1d..0311c89107f9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -1319,9 +1319,14 @@ static bool check_timeout(struct
> > > > xe_exec_queue
> > > > *q, struct xe_sched_job *job)
> > > >  
> > > >         ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q-
> > > > >lrc[0]));
> > > >         if (ctx_timestamp == job->sample_timestamp) {
> > > > -               xe_gt_warn(gt, "Check job timeout: seqno=%u,
> > > > lrc_seqno=%u, guc_id=%d, timestamp stuck",
> > > > -                          xe_sched_job_seqno(job),
> > > > xe_sched_job_lrc_seqno(job),
> > > > -                          q->guc->id);
> > > > +               if (IS_SRIOV_VF(gt_to_xe(gt)))
> > > > +                       xe_gt_notice(gt, "Check job timeout:
> > > > seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
> > > > +                                    xe_sched_job_seqno(job),
> > > > +                                    xe_sched_job_lrc_seqno(job),
> > > > q-
> > > > > guc->id);
> > > > +               else
> > > > +                       xe_gt_warn(gt, "Check job timeout:
> > > > seqno=%u,
> > > > lrc_seqno=%u, guc_id=%d, timestamp stuck",
> > > > +                                  xe_sched_job_seqno(job),
> > > > +                                  xe_sched_job_lrc_seqno(job),
> > > > q-
> > > > > guc->id);
> > > >  
> > > >                 return xe_sched_invalidate_job(job, 0);
> > > >         }
> > > 
> 
