Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86965EA7942
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 18:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEF210E74B;
	Wed,  4 Feb 2026 18:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNg8MVXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4E810E740
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 18:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770231349; x=1801767349;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PQpdcWdUrqnErgBkVgq/a2qRCxHU8Xx2dcaLNoGUHYw=;
 b=CNg8MVXZY4Z6kXont1v6OY/QlvBolagwaXvCKkJ7oz2n4mjQL3ANxDqK
 IDicJzzTb6F0dXbVMpBk0LJGMJ0uouBbZotE47CRyNnVMp/hcC6gW0+f0
 us1y07+AiocHB8iCU58xPuei4dR/UF7aTllVA+RBV3534PE3p+PBds48X
 5C7BEs464c7go98L06CX56yDBba5IwAYcXCv/Y38pT+1lFkMt91ef9OQB
 bf9jmSa9MYqTAKvDoGFkxkBCxsxRnnZttk2AWy7L0/K1T83nIDdLJaCu5
 GRWKp3sttSmhWZAlxU2ntCP+Amhij2aRUejsr4O+rzgVnXlAODLLtVu3y g==;
X-CSE-ConnectionGUID: Lcjl/KEASJ+yMiI4Nfz/2w==
X-CSE-MsgGUID: G69rpvKVRg6uiU0i+60NrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82058276"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="82058276"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:55:48 -0800
X-CSE-ConnectionGUID: Bl4vLa1kRbujhFjsuTZaIw==
X-CSE-MsgGUID: DCAOr+shQ3WIxUM5MmZX+g==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:55:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:55:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 10:55:40 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:55:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgGRKYNmMivSWBfvjh5Zft1wbmxiycTx/frz3/uuOjzlF16kP0iGqYMx53guLLezrviaNlIJe/XxzhvK19QmhccRYO3WkbFe7QWO9PucsKqG9VMn8L8EiR64WFe6NJuYOyLED5MfgWWOGpUHXTApLtk8QT5J1XVsDF4mnwSVKyqBBG74GRbHst7giOITmLeFSOI9WpXJge3cWNcMO0YF0Vi5+CglZsLTreI22zAV+fr7dQLikPqB3Ciy4R0NjsSLnzQgHT7JIg732GaZVW/t3F6slLWSUHcKaUEnOxZ9hyW23qq5idB4SROpmc/lHiroBr/RGW2iLIrMODxrQR0Sgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/uMPLUn473cpD8/7aOAqs03JvfqXLvTDeR2et3QgO4=;
 b=ic7Qtidf8ilHBNERx/CECIHUc5F+uep5fqeERMwG/hC4AYHyYAb3IEj04uG0Ckx3sh+RHroIA76NitBU897OcvOCbwdLnl5otgpjkqbaYr+yq3ljCzPtVjqPWIBk+4j4JWh0ZiutA6vPfBn2aB2Gk8yjGrPLvRPMAfkTiNk43AZWEtq6wFQgpg+myhLM1yrkqTCIse1sdx2WGOvSG/p02oZt1d7dbBilGPQUAyoilkCkOFwGbQPrr1dKO69OZylT18wo5W+Xs76TpN8LFkPRsWYqaRwJjDC1ZeL00JckUJFycfoZ1Cfqfkj8Suek+pCK9Z3s7XgXgOmtyaas0lub6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 18:55:37 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 18:55:37 +0000
Message-ID: <a682a67a-be18-4d71-a3f9-6aa7971a9f63@intel.com>
Date: Wed, 4 Feb 2026 10:55:36 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: Matt Roper <matthew.d.roper@intel.com>
CC: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
References: <20260202105313.3338094-3-sk.anirban@intel.com>
 <20260202105313.3338094-4-sk.anirban@intel.com>
 <1d343871-4872-4ad8-860c-6f75312eb9f0@intel.com>
 <20260203233600.GT458797@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260203233600.GT458797@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN0PR11MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db7f62c-3449-4f67-f8e9-08de641efbd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTdSQ3MwSVF5R2dsQ0sxSmUyVVIwU2VEYUZ0Q0hlU1RhK0hrS24vZ21TZE1U?=
 =?utf-8?B?YnBkREE4VFhBMWlMM2NPN0UyUjNqRG1WRG01NVFMa3BxbzJvUTZwRllOOXVw?=
 =?utf-8?B?SFNWcXloWXZ4OHVFc3EwUjF6TzhMRTNkY3Q4VExSSWUwYU5WUHpmL3dpeWVQ?=
 =?utf-8?B?S3RHZFVmYmlWRWpxMEhMenR3Q0VvT3Fsdm9lbmJ1V0tLaC9tRXJ5bU5DM3FW?=
 =?utf-8?B?THZFREhyMmZzOXV6QjJkSlROSDRrZC9QbWxRVGJCWGxFTHVJQUNkUjRMb2xm?=
 =?utf-8?B?anM3d0lPcjZOUlE5RE1VTGxqM0JMSG1WQzBmY2ZqUFVidkN6SWp6RGYzenp4?=
 =?utf-8?B?empuTW9EOFdYQVBtdjFicVY0OUtjZDg5K3FRc2daRFBNZ3JnbTM0UGZYeGQy?=
 =?utf-8?B?ankvYXd0eXRuVk5qaWVUWVhQSjk4cjlKbXN4bEdIdHoxajUwRnJwT3F4YktT?=
 =?utf-8?B?OTJpQlJmZlIyb25SMmx0WUM3MTVkcnpDaGNCRlpoRDBqV0ZnQVppaXA2OHdT?=
 =?utf-8?B?M3J3SEZaazNxblg1R2dUcmpRMDNyejFXU1d0NEIrWmNOTTcybTdlWSsySmQ2?=
 =?utf-8?B?UGRiMURaMFhPYUFVSFRzb044b3FDN1o0YlBVL0VxZUtDQXJjSmZnUzFQdTRD?=
 =?utf-8?B?WDNIcGd4b3UwOXVVNytsK1BPdDJqTlB2Rnc0UU1JK1hZVHUwR3FUUURGaUtK?=
 =?utf-8?B?V2V2elRRMzh6dzBWSmNkejRIMXgvK2RYMHlETTAxbTV0ZmVHOFg3aXZNVHRV?=
 =?utf-8?B?R3lJV2UyZWE2RnZnSXlLZlowYTFHT2cwaUg2NzFkRmNLSlM3N2wwc0FiS2JT?=
 =?utf-8?B?cHViY0t0c0E2Q0xmT3NLT1JxOXBmeExoSUUxUTNsMDUxYm5Wb2diQmQxalpL?=
 =?utf-8?B?VHNNbUVqYllyNXJXdlRoR2lCWnBUbFRHY1pUcFNVMTNmYmpIekU1L3gwWi9V?=
 =?utf-8?B?N1p3SFZoMEIzUWMwcG1BaDdDYU5yYXdwSUVKaER5d3F5WDBFdHUzV0Q4ZmE0?=
 =?utf-8?B?ZkJ5aWw0Y0dMNFc5a3VvcmZnS2dhYzRjb0RNSnNBWFdNRUVGYWN0MFAzVVZm?=
 =?utf-8?B?djNkQTdSdE53RFZRdzN6SG9TaXByZ2p4VVpTakd0U3lFNW9tZlJma0ZaYVBP?=
 =?utf-8?B?VUovYWp5Y3hPWDRWOXNmTlNBSXJ4UThPUlZ0RGZ4QjdsaG1ic1loeFdWZDhN?=
 =?utf-8?B?ZmJqTmx6VkRnQWF6azhmV3pJUTMvTkpxUldHVEJhYW5NVldJc0wwMEdnMTlm?=
 =?utf-8?B?aFArMmtXa0V2ems4cllTd041QTVYLzFVejVYOTh3Mk5UaHpnZklYS1FEbE5k?=
 =?utf-8?B?eHRXMTRZaTl6Mjd3dVh6SDRIUXlTMnhScTlMZzBrcThubDdabHh1NFEyY2xO?=
 =?utf-8?B?V04zZHEwMVAyUmVXZHdCWTNmS3pjekFrWmp1R1Z0UTJGK2g5Mmg1SGhIRXQ5?=
 =?utf-8?B?aSswSTVNZDBibXFVNkJza2d0UHR0cHZWMlh5WHorT01EZkZMY0lGSTUyU2s3?=
 =?utf-8?B?WUk4YW9yMFZpS2hudDVESVVJYTgrNXZQQ3Y3ZStZd3h5dnpmYVZDRk4ySGRi?=
 =?utf-8?B?bkNDZGxONG1sT2M2ck9JVElUUFVUNjRTQkV3MjRXM2pzVjg1V0JTMThLbjU5?=
 =?utf-8?B?bE9LRUlHaGNoQVdHQklwa0NHUFdiU0R3NVJndjRtS054bnRsTGFvU05ISE9W?=
 =?utf-8?B?d0pOTHQwRGd2S2UwaVh5UnNFSTgrU0FYMnJ5dW93U0dMbnJsZ1F2NW0reUxl?=
 =?utf-8?B?dTVlMXNBcGJrYXFnMmljQjVXM0tQNVo4dnFyVnYvTDhFMVlpSUZBaWxkcm53?=
 =?utf-8?B?Z1pTQ29UTHlWRkZTVk9GRSsyUFFKNDNvYXFaRjRmVXlURmlkOHVhSmIrYjly?=
 =?utf-8?B?cmxmTVR4QkI1My8rTWVCNzVsR3BYZmtjU2RpYkdLeGc3eWlMWnU1UUVtZ3JG?=
 =?utf-8?B?TXVpbXp2Y2FVQkQ3cmFIOGVMRFpGL0tQc3NGeFRoS0pLT2J1ei9CZHBJYkZE?=
 =?utf-8?B?VVZFUno0R2ZxRkI1eWR1SnZ5N0x5SzVwdlhSc2lvZGZxNHhjM2NlNms2RXF4?=
 =?utf-8?B?cTV5V0w3RVUwYmJTT1VWdTh5Ymg2ekI3S2FmK2JENkw0dFpWei9qRXRjQTlx?=
 =?utf-8?Q?MwWY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjVPaFZLZDZyc1VibDltYmJMT3BpQ0U5N1NYZnlZQk04eFltN3ZodUhJd3ly?=
 =?utf-8?B?RDEwM0JGcnpaUzVnZnRIeHdRNjZlUXBna3J5azJFTWhCbUJNaXdWeUxSano1?=
 =?utf-8?B?bVZKazd2Vk95K0V6cDhNMjZiRE5nRVVMeUFsSTM2MjRTbjJvYWxOdFVISG5S?=
 =?utf-8?B?d0tPWVozalE1MU9wSlJlTzNtNVJNWExtZDZ5M1J0cjVtM0EzZE9iQ0V5TFYv?=
 =?utf-8?B?WGJMN3lhaUQ1bUgxU2drQWNRbE1Lb0NSM1RTUmJRbGFCNldEM1hzQk1vWEVM?=
 =?utf-8?B?SXdJd2xiMkdMeiszNTlGYUthUHBQYjhqUzNpdjVhZW9uQkkyNEZQek9QZ09L?=
 =?utf-8?B?S3FEODBFTDNIL3ZkNFF4M0lURlh3cGVMNDVmRjUvRmpOaGYyUURFbmY2czE2?=
 =?utf-8?B?Q1BzTHcwSnVORHI0UEJ6YVhtQ1B0YTZLMjNuTXBweEliUWxnY0llWGFaVGF4?=
 =?utf-8?B?V2wwOFRTVTBoUjFBZjlqUjJUSDFoYlc0NkJFVUpQMWU0WEhnWW0xYy9ZY1Rv?=
 =?utf-8?B?TVhTN2tBWHArKzRtTjhPWmJpUGVOc2R5TzY4ZXdRN1UrcGthbFdDKzVDRWVx?=
 =?utf-8?B?TmYvaXlNMURMcFVCMWNpOGN3R2tnbEMrNEFrMTJsZllIcUdwYytwaDYwTEg3?=
 =?utf-8?B?a05GTG1pbkhRMFZWeW94cGRYNUp4OStPN2NnZFFtL25uUmZsdTEyQWoxOUky?=
 =?utf-8?B?Q1MyUSsrS2ZjQVoxVU9rVENtUVBwcU56TVl1ZWR2bW1hK1BDVUdKa21COXRL?=
 =?utf-8?B?bVdxVUprZ0tDYVA5L083cHAvUnAwK1lKSnJ2U2RzL0RzUTlpNytJd2ZZeERs?=
 =?utf-8?B?c0NpVmEzK3Vka3BrUlcxam92bEhPK3VDTFVGYk9SNDJHZEdubjB2MFEwcVVk?=
 =?utf-8?B?OVkwWm5BZ1FtdTU3M2QwdGpwT256a1NQSTcvREp6UEdvQmJrQXFOTy85RXE5?=
 =?utf-8?B?QTlIVlZQNk1xUktDMnFKaXNVSmd0bzVBVlg5WWNJRHJEa0ZDc1lPTC8reEJU?=
 =?utf-8?B?QXJMVkRkWFBmd2srclR1UHpFZVFlTzltZGZpVCtwaitrTzVUM0lobjJTRVg3?=
 =?utf-8?B?VVJZYXFrRmJuampSSU9mcU56VHVzZ2FTTitnMmcrN2UxOGxuVkFkbnVkYy91?=
 =?utf-8?B?N3E5MjIxYmY3c0JrNjFVbFhNWjR6ZFlSYkNnenlqemNnSUpZZEptcnZvMWJU?=
 =?utf-8?B?UzBFaUNpQy92YS83bzNncnE3cVg5TEFpTWpjd0RRc0xvUHJnM2pXWk8wdG9Q?=
 =?utf-8?B?dXRIRk10MlE5L2xoNmpNTDZCNk9CTmpXMlRjTkZPNWRrMnFqNW93VDNzNnNx?=
 =?utf-8?B?RmswUFE4R0ozRGhwbC8xejM5cFpieGNTSnAwN1RRYVRoVk5PS3J1b1dFeW5h?=
 =?utf-8?B?TkY4N3JIcytlU0ZxK2RsS2lqT2VLL2F2S3I2WlBOVmxxR2o0d3ZxNitIWWt0?=
 =?utf-8?B?WE1PU2V2elM4bE4yNTRyWHg0T2pvelBrOFNLLzFtd3ozbkxDOXpjU3lXOE9F?=
 =?utf-8?B?eEZYbHdTSitHQ09Ka2dZZThHWDVKRitTT0ptK0lLdzV2L2V2bFVlNkMrdk5U?=
 =?utf-8?B?bnJwZVI5cFBsYjhLN2kremV6KzhmK2F3ZSs0QUVmK1M2eTdVb2NReVptRWlW?=
 =?utf-8?B?aHBpcE5BUCt3T3FTQ3hSSHhTT1NWa2RQOW5MSmdtWlpUM3lZd2RGemhIVXVB?=
 =?utf-8?B?SzFHcG8vajJuc1VLRlVKbVRUVXh4WnkzNkdScDY5YWlRNUM0eXMxQUdnODNN?=
 =?utf-8?B?NHViS1FwUjNjVEhBYmI4MElrQ2xYUktzQmlXV2ROUGt5Z0N4Vyt1K2I4ZVdv?=
 =?utf-8?B?TW1vYW82anNNM01JUG96b1cxaytzbkFaOCs0MGFhZmlzUGQxMDhnRFJ5bmJj?=
 =?utf-8?B?bXpvSS84NTB6djkvaUFBVm5yeU1BYXhuZWF6VXpTY2tpdjV4Tk42bGJEZElh?=
 =?utf-8?B?NW96NktSV29zUDNHSFVJblE4SU9LQVV0MUt6K3liUks4UkVDSklIL3VYM1dG?=
 =?utf-8?B?TmFNYStlMmJYNmVET3ppY2RYRjc5anhEMTczQTV4dkYyenlJSS9JZXd2NkNr?=
 =?utf-8?B?aHgwTEdRcUdiaGhZK2ZYSkNBeWlXVnFOWXBPanhzbEtDSmpod2RvZzBhYXNP?=
 =?utf-8?B?cWYxczVXQVY4bG92YkRoa1UzN2xWR0pBd01uVVdGVUNaQ1FTcVgyeWJ1Z2s5?=
 =?utf-8?B?V1RyU09xRWRJZGwxcmRwMlVWU05zU0prZ2E4ZWxSaXg0aWpTNGF5dTVJdFNL?=
 =?utf-8?B?Q3ZTMmY2YlVCYUpMM2ZEOFM3QXNMS3A3bkFGYXR0ZDBRTTVrNTRyNG83cFQ5?=
 =?utf-8?B?TVlxRE5VOVNyQ2JuT1FwSEhQajE1REcybEZNSkVXSE5peVpCRGtqZm4zZVhw?=
 =?utf-8?Q?6sFJXr+yuBkKqsXI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db7f62c-3449-4f67-f8e9-08de641efbd1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 18:55:37.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01B4I5AAyBd4Umq4IeOZmeTjJ5ncf7ZHnQOUy0AM+mAmyco1mbQ4d2p6dhMnfAJKVjmjpF4CatSD6NgRxDlv6MjggE4G1GSK4w+LAVJnC1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
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



On 2/3/2026 3:36 PM, Matt Roper wrote:
> On Mon, Feb 02, 2026 at 11:47:18AM -0800, Daniele Ceraolo Spurio wrote:
>>
>> On 2/2/2026 2:53 AM, Sk Anirban wrote:
>>> Prevent GuC firmware DMA failures during GuC-only reset by disabling
>>> idle flow and verifying SRAM handling completion. Without this, reset
>>> can be issued while SRAM handler is copying WOPCM to SRAM,
>>> causing GuC HW to get stuck.
>>>
>>> v2: Modify error message (Badal)
>>>       Rename reg bit name (Daniele)
>>>       Update WA skip condition (Daniele)
>>>       Update SRAM handling logic (Daniele)
>>> v3: Reorder WA call (Badal)
>>>       Wait for GuC ready status (Daniele)
>>> v4: Update reg name (Badal)
>>>       Add comment (Daniele)
>>>       Add extended graphics version (Daniele)
>>>       Modify rules
>>>
>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
>>>    drivers/gpu/drm/xe/xe_guc.c           | 38 +++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_wa_oob.rules    |  3 +++
>>>    3 files changed, 49 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> index 87984713dd12..5faac8316b66 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> @@ -40,6 +40,9 @@
>>>    #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>>    #define   GS_MIA_IN_RESET			REG_BIT(0)
>>> +#define BOOT_HASH_CHK				XE_REG(0xc010)
>>> +#define   GUC_BOOT_UKERNEL_VALID		REG_BIT(31)
>>> +
>>>    #define GUC_HEADER_INFO				XE_REG(0xc014)
>>>    #define GUC_WOPCM_SIZE				XE_REG(0xc050)
>>> @@ -83,7 +86,12 @@
>>>    #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
>>>    #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>>>    #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>>> +
>>> +#define GUC_SRAM_STATUS				XE_REG(0xc398)
>>> +#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
>>> +
>>>    #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
>>> +#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
>>>    #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
>>>    #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 2efc4678fa73..369b5a8f129a 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -911,6 +911,41 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>>    	return xe_guc_submit_enable(guc);
>>>    }
>>> +/*
>>> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
>>> + * SRAM save/restore operations are complete before reset.
>>> + */
>>> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
>>> +{
>>> +	struct xe_gt *gt = guc_to_gt(guc);
>>> +	u32 boot_hash_chk, guc_status, sram_status;
>>> +	int ret;
>>> +
>>> +	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>>> +	if (guc_status & GS_MIA_IN_RESET)
>>> +		return;
>>> +
>>> +	boot_hash_chk = xe_mmio_read32(&gt->mmio, BOOT_HASH_CHK);
>>> +	if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
>>> +		return;
>>> +
>>> +	/* Disable idle flow during reset (GuC reset re-enables it automatically) */
>>> +	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);
>>> +
>>> +	ret = xe_mmio_wait32(&gt->mmio, GUC_STATUS, GS_UKERNEL_MASK,
>>> +			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
>>> +			     100000, &guc_status, false);
>>> +	if (ret)
>>> +		xe_gt_warn(gt, "GuC not ready after disabling idle flow (GUC_STATUS: 0x%x)\n",
>>> +			   guc_status);
>>> +
>>> +	ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, GUC_SRAM_HANDLING_MASK,
>>> +			     0, 5000, &sram_status, false);
>>> +	if (ret)
>>> +		xe_gt_warn(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
>>> +			   sram_status);
>>> +}
>>> +
>>>    int xe_guc_reset(struct xe_guc *guc)
>>>    {
>>>    	struct xe_gt *gt = guc_to_gt(guc);
>>> @@ -923,6 +958,9 @@ int xe_guc_reset(struct xe_guc *guc)
>>>    	if (IS_SRIOV_VF(gt_to_xe(gt)))
>>>    		return xe_gt_sriov_vf_bootstrap(gt);
>>> +	if (XE_GT_WA(gt, 14025883347))
>>> +		guc_prevent_fw_dma_failure_on_reset(guc);
>>> +
>>>    	xe_mmio_write32(mmio, GDRST, GRDOM_GUC);
>>>    	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
>>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> index 5cd7fa6d2a5c..ac08f94f90a1 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> @@ -73,3 +73,6 @@
>>>    15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>>>    16026007364    MEDIA_VERSION(3000)
>>>    14020316580    MEDIA_VERSION(1301)
>>> +
>>> +14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>>> +		GRAPHICS_VERSION_RANGE(2004, 3005)
>> We usually avoid having these big ranges in the WA table, in case a new
>> derivative gets introduced that doesn't require the WA. If you think it is
>> justified in this case, please get an ack from the platform enabling side.
>> Apart from this the patch LGTM, so I'll give my r-b if you get the ack.
> Yeah, in the past we've tried to avoid big ranges for this reason, but
> I've heard suggestions from a few people lately that they'd like us to
> revisit that policy.
>
> Early in Xe development the driver didn't really support that many
> different platforms / IP versions, so even when we had a rare workaround
> that needed to hit them all, listing each separately wasn't much of a
> hassle.  But now that we're a couple years down the road, the number of
> platforms and IP versions has grown a lot, so it's a lot more painful on
> workarounds like this to list them all out.  If we switch to ranges,
> then we'll need to do more work when first enabling a new IP with an
> "intermediate" number (like the Xe3p_LPG that just landed on the mailing
> list) to make sure none of the existing workarounds need to be dropped
> out for it.  But I think I'm okay with that now.
>
> tl;dr: let's go ahead with the ranges
>
> Acked-by: Matt Roper <matthew.d.roper@intel.com>

Sounds good.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
>
> Matt
>
>> Daniele
>>
>>

