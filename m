Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1888EA4FC9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A870310E3CB;
	Mon, 23 Feb 2026 14:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlvLpkuZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0593210E406
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771857084; x=1803393084;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LZlFONZLK5URcdaBMXeY40XfYq0TuiP+p5bQnJ70C2Y=;
 b=GlvLpkuZbXR/PMIt6e+m7U84MbfkEu2DchIIttHKiGLUqy7fU+tq1sUt
 eb6f7/NcP3Cq1aZE5IgDUyvIt8aWDgiRd0G0Bv8PJxiOAelWmwuymAuwt
 zJSpTkxVaumM0kR3chb9YlStshB6LrLEVxpzVAkCZPQWa1UPxs7/j39bl
 4cj6uJof/aviyi8qMIx8OC8cOc+uh8lakec2fjozXPckaXbfDXP1kGwhA
 nfxWmLZNR32klk0ghGKv2i+x88ZvIF/BrliwIkDV6D5iZNRMydZCtrtfk
 okaIX1byjW97ufuLJ0LngeRz2C0eWkw2HfUKb4XZwOeVwFwC7ddDGNt3e w==;
X-CSE-ConnectionGUID: bFcOU//hShqnegfVrKyFlA==
X-CSE-MsgGUID: j9RqV5BnQFSO4ZwDzfD/fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90259112"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90259112"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:31:21 -0800
X-CSE-ConnectionGUID: tB5Q1Eg5SgGMIQRGlEsm4A==
X-CSE-MsgGUID: ueN8hmSvRjegHix0eEY4GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214663059"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:31:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:31:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 06:31:00 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:31:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpUlpf6Vw/kA+lxG5tR96JDVqCLsRQ9X/DCuGYvAsnjw50Fs0jOm0a/GV6IQd4Ec2hG+g6ZlVcHGPEMBs/Snx41gTF0IukM/7VMvCYfNIv2N4GAWPnx/oE1ixf+T28a0rAvS0CQtEDic7DAmjGtKZjVaQIq6uX+mZSnQXjxEHN+4I1BS1SAKabq/BhHwQGLU1b5zvV0GN/I21Aj6zT1e0uq1UWXx+Fe4Lk5bY/ojj9KKg5W/8lSzOLS4z450e73hKnnq8OdQDhF7VRKKz2uSvA4P2MyeWZBasLBi8j89q0RkxFLudZW1PNeYngJIQSKLFwks5JoXULSv8Ebu+9+NHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj5ZIv7Eq4rfTjVEkqRwdeKkX0ATvD7fJTVQXd3aTx0=;
 b=SOH34zRouZSlqRtjld/21aMFCdR0Xw79+4i8F/z47hM65GjDPzJP282EOkBoTNbrnjmOFWE3JkppNsLkLLLCaavjdixm+4LhTBK+/0ADA0mQ+6sCBXRmNzrQAwutLba+SHlth+9x5QD41+I1n5gx5arzgqL0rgiwsjkXLlGqg9ivCbqCXOZPdopEeT8ktepSBtyWH9FSJH1puffyl8m5rTCOq0b2Ud/YQavOvQq6gUfjQVjQN63l80CdYoNEiI1iVgfzZyLH/iRGv5fVEPOzhIylGv1l7I+SFvWHSoU78mkjEsQfepTdmGrr6Gikbeu33bLpySct0oXyozrcDtlYyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6747.namprd11.prod.outlook.com (2603:10b6:510:1b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:30:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:30:56 +0000
Message-ID: <1fc467a4-e0d8-4890-ab40-eb5a92594763@intel.com>
Date: Mon, 23 Feb 2026 20:00:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/xe/xe_ras: Add structures and commands for
 Uncorrectable Core Compute Errors
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-16-riana.tauro@intel.com>
 <cf766405-5ce2-421e-a91a-16ab6473a816@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <cf766405-5ce2-421e-a91a-16ab6473a816@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ac0a25-10b3-4d12-3c4f-08de72e82829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?by81aXd3NFRYdlpLb0RDS1ErTWg0Ym5ZRXZIT3l5SWN3RnJIMytqekIzcUEx?=
 =?utf-8?B?dzIwQmRnS1BpejRFSVI5SFR6M25EekFCclovRFFLOG43WTRadXVRY1cvdk9Y?=
 =?utf-8?B?MnFJQTBrWi9ySmRKMTFHOE01UFNyN2NoQ2V4eGZ2bUM0WkdLQlJKcjliN01T?=
 =?utf-8?B?L053Skhzc05IZkZJSlpwL3JLbVl5cE9OQVpSUERkY3RqaU9KRms4ZmdPdGlk?=
 =?utf-8?B?bEE0bEJkdnlSMUExR0lKVE9jSkFzc3Zwa04wOVFIZUtjLytYUWMwcHFpZGx3?=
 =?utf-8?B?QXErM1c2SitDTEdGZlpKUGFzdWYzS3FQTmVrdDdWaU45S25OOVJrbnF0K2dX?=
 =?utf-8?B?QkN2UUZZdFNSdGRWUCtaaGVuQjZVdHcwVjJzRW9iTzhvV0QzMjdVRFpDWWgv?=
 =?utf-8?B?RG5jNk1ZeDRZcG1Na3JLZTQwVXhWQVFoSExkaklSNGNGbndlVnZvZjBaVVBY?=
 =?utf-8?B?Y0sxS28zQ0pQQS9MajdreklDa09iM2J4UitSZXlvaTUrWDFvUnlZWEJGdTZK?=
 =?utf-8?B?ZmZPU0ZrTDk5MlNZUVVIZ2twTzN0dkw5T0ZVQXc1QkJkWHQyd0QzMWtPMnlX?=
 =?utf-8?B?RHJaU2FCdVgwSHMyM2c1RkROaGJXdzA1SjlrQXUvUWtNOU5JZDRPVmltRERn?=
 =?utf-8?B?dkg1dmtTVStJNStSNHpvQ3pWWEZKUEUzRy9iWVJSckF1VlBobG9RWkZncnRJ?=
 =?utf-8?B?d05DNzFiOXdFMVB2VkczUFZURy9ncVpibXFaWms2THlyM21ramYzb3luMk80?=
 =?utf-8?B?RmJMSUx3Ymg4S050bEtGRVV2QkNVbXNGcFNHUDE3bmQreXNYTWZOeWVBMmJz?=
 =?utf-8?B?VFRPS3Z4eHBCU0RBcnQ0K2plc28vZzNKcmFtL3BKdmc2SDFSaldocXhqTkRs?=
 =?utf-8?B?dytaenNNdlRWVkJjTzgvRC8yZEVybmZlM1lxcDN3MnZWMjVocGhrZjNQU3Ey?=
 =?utf-8?B?K2NmNkFJSTNsdjVld2dzUmVpUmlmOGkrOEZxblhPWE15TGZpQnNUMkJHOWFS?=
 =?utf-8?B?cU1vQURoQWZvN0hmcVRSS2E5b21Ibk9LMWsvL1h2TGY2bVdieWtNRFFzQldj?=
 =?utf-8?B?WHlLL1BmQVh4UE1JdkNGdVhkUFJuOTVYSG1hbGYzZGp6clVTaEhUVE5RTGky?=
 =?utf-8?B?eEhWbDVHZkp4bVRPUUZGL1l0VDZVcXFUN0JJbWlHVnVCc0l0aklSOU83bWdC?=
 =?utf-8?B?OGZhLzhvbWszUDVId1N6M2ZhTjhEc096QVF6ZHU0VktGeWM4QUExOUU0N1di?=
 =?utf-8?B?aWFXQmtQU3QrWFFRSXNwUXFFU0xxZEx1S0FBZVoxV1A3REV6UDFZY3BmNFow?=
 =?utf-8?B?ZlFlN2dOS2xQMWgzNUMxcW1OemJramlQeVljWW1yenM4SFk3RFQ5STU1N2Zo?=
 =?utf-8?B?RGxRT1lTanJtbzFFNVpRRzVQZGNaSDRBMkY4WnZwV0NxWitjeUY3aXg3RXZZ?=
 =?utf-8?B?Q0c0aVNKcDBRSWlndVVsY0h0NjNzd2E1V1RhQmo3TmdUalJJUkJDMDFUWmpW?=
 =?utf-8?B?anJRVHhHUmk1WkpXSE5jSjFLeWpJZVJERmRwZWl6c004NzlaVmdEdktqRjNx?=
 =?utf-8?B?c2JlYzNFNXpVSXhLbWd3dm5WUldGMExCcStQbzN5VE1yTjhNam1TTmhubzNp?=
 =?utf-8?B?UWcxaTNISU8vbWtrVklkQWlHaU80T1JCR3ZzOVJTa1FyMmN6aDBBa3RRUE1R?=
 =?utf-8?B?ZXhJRXV4UEIzSHpaNytGbHFWTU5DenpPTHhmUGd2MjlJbVlqM1pxRjE5V1V2?=
 =?utf-8?B?QkJZR1ZGellqMkNXajdGeFlScFhRMjJFK1I1MEt6R3Fjbm5xK0xWR1h4OVdS?=
 =?utf-8?B?NFRydHJxM2U5OWlVNFd2SjhLVE5sS3pXVE9nL21oNTRvU0R1NU5WMHNONzda?=
 =?utf-8?B?WU9pWVQzUUNrcWk0emp3dFd3NlJWSnQ2TmxlZDlndzNsVDF4WGU2cWNwVThz?=
 =?utf-8?B?Q3U0VjJIQlhoOFVBQmxvT0laa01IbG9LZUJ5NkE2eER0c244OEtTcVRWQjdp?=
 =?utf-8?B?R2pNQTVXSlozY0JhUFY0Z21OazNKMkU0d3VHZGhWbFFQdHZMZVVhVEpWYXJ2?=
 =?utf-8?B?R1QzWWJ3cWdsd1Bnb0J2TkRjSHJPNDVtcW82dmtITEpZZXo5WXpESkV6K2xu?=
 =?utf-8?Q?p07E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sy8zQVVlM0kxVUZMZVlINnZmY1dDVjkxVkJGR0ZKcWlNZk5OMGZ1QXJUYk5n?=
 =?utf-8?B?djh4MzlCZTlLYlZ3b1dSbmVjYXEreDJXeHBldDhrdWZzek0yS256SVBLTkc2?=
 =?utf-8?B?NDRyYjdjWkJlbHE1STBMNjZ3TmR0ZE8yNXZubTU4STJBS0Q2QTVyQ2hoa0Rx?=
 =?utf-8?B?SitnbXR2ZUVxeTlEY2hlNHVMNHBGL0ZaRC9Jb0MwQzBIQ3FNU2Q3N3V6N1BJ?=
 =?utf-8?B?ay9EV2syNmpVU0REeGxYNjBtODR1WU9OMzhkdlZOWi93elMvSW41QU5wM0xu?=
 =?utf-8?B?UnlYcTNQOGJTN1NPZGNGQzV6QXBzNFdUMFkwZXFORnhJYnIzZ0szajBSUlF0?=
 =?utf-8?B?U3FRQW03WUtyUEtHRVd5Qjg2M1FLTk9mb3ppRDhWZUhxYi9pSTlnYVU3MjFU?=
 =?utf-8?B?MHdSa0lrakFUbURrKzhEM1hGUUV5Y3E3TlgxNVdvLzNRU2tjSktUK3d3NGhk?=
 =?utf-8?B?UnF6S0JBTXI5VDZOc3diMWV2R1p1dS9ieURUZ01DNWVZK3dpM1JzbURONjhi?=
 =?utf-8?B?dDlLYzdrZTUvWlByQnlDcmx3WXRqQnI0cWgyNnNyTWJ3djlHbERxTkNGOGJ0?=
 =?utf-8?B?NkNGY3RiMjNVQktnR1dYOGVYRGk0VkpVTU0wSHo1U1MxOFNFTk56UTZhYUh0?=
 =?utf-8?B?OVhVVlZDS0FBN0Q4dlFWSUpDVTExa2RpRWEvYTJmc1pKYU85Q1ZCVlhvb2ZC?=
 =?utf-8?B?enpNUzNVK1hLRmcybGo4eWhad2NQZnFzSGdWWDZNWEpsQzdEWnN5Mm1sMUlk?=
 =?utf-8?B?RTVqVVdMZCs2Qi9mQWtqRGlHM1RBNGw0SndkcVlwZ1lXbjU1eG9lWHc1R2Ev?=
 =?utf-8?B?WFRrUEd1U2pRT245SWY5NlB5MDBuQTNNMVdFQjl5Q0QyZVNacm8yd3R4RUFP?=
 =?utf-8?B?aysyVDJVK2tzbTYwNjRDKzhDSE1JYndleCtqWEhBNkduNHVOTVQ0M1Y5VkdT?=
 =?utf-8?B?TEE4bzNzNXMxNnVNem1qNzFTZGZzM20yZ2o4TmV6WXRFaDhOdXROQW1FYjN5?=
 =?utf-8?B?WHRDOU1DNDcyQTQ5S3JSSFlTbXkvWDNzYzY4RGE5VVQxU0g4RTFnY0RsMkYv?=
 =?utf-8?B?b0VUSDBzbnR4MytsZkp2WWpVTTZ3MFJFYW13S2w5ZUQ5MnNyRnBnMHhQT1Nw?=
 =?utf-8?B?S29iR29qTS84MTRBaFY5dXRkM2x4ZjNZZXFoRmVvakJaeEpJWUpiSWpGY0JJ?=
 =?utf-8?B?bnlHc1pkU1RjVkdkc29rcXJ0ekxmMnVVc1dYSjV0a2RGV0FLa1dJeUgxcVZK?=
 =?utf-8?B?RWdTdUppNEFDb0Z3eDNTNUw3cTZ4ZXlYWWJzTHhmd1JzdXFuV2lraXExemh0?=
 =?utf-8?B?SVNqU05ZaVpNWWFVY1VtcVUwbDg5a212bndubmdZTFRCVDFQVXZpcVFtWDA2?=
 =?utf-8?B?UTZiUUo2TzBCSUtWNDkvU3g2M1RXZnpXM2I5My9aeDlsek9Pc1BVdzJrcGRr?=
 =?utf-8?B?ZXdaaktGS2pmYTF5cnk1S3BWaGJiYUF4aG5xSFJlTDlZd3NZcEtoN1BXY0p6?=
 =?utf-8?B?V2hyR3VKUHVmV2UyaXlaSDZMRnJxZ2t5a2xzNno2VElFVVRTYkRFc1FNa3hL?=
 =?utf-8?B?d0p0emlianlYKzdBZ3piTmJhWXhQaW5RSzJUaHVNS1k1RFN6dmhhNk9YUXVI?=
 =?utf-8?B?RjNxQ3kxSVlxMGp0dFE1REd6a3BuaEJ0bXlNbkV5NS8zL2VUNjlTQ3dKbVRU?=
 =?utf-8?B?eUNYSWRTR2lGc1M2UnNSbzFGbVdTUmZ2eFo2TU5xelBPQ25yaUh3Z0RGZTA1?=
 =?utf-8?B?LzhDMzAyc3EvZkE3cnpTckRjTHlHbzB3REZJYVFUb1JOUDdsUVNLZFp6WTB3?=
 =?utf-8?B?T0ErVEtCdUVXYUk5K0pkV1JEODFyRHNoaEZjTmpjRXVHYjVIcWlMSmNSSGwv?=
 =?utf-8?B?aGgwQlh1UmhEa2RoVDdFMDVrQ0xZZjlCbTZvRHBxckdTb2x5VDVLU2d4aUhE?=
 =?utf-8?B?Y1lhelR4bEoycUpRREdRVW13UTlYYm1FeU1sVk1FQU52UUJZWXRNVWpqQWEy?=
 =?utf-8?B?VlRZR0s1YjE4WVE3cjhnNW1QcVIzWWJqcm51RDJ2K3ozNjU2OGI5eC82dmN5?=
 =?utf-8?B?c2VIQjJOZExFc0NLZ2JJOEJzVEZJNmNnckdqN2Q1T0hBelU3ZkFSaVB4QU55?=
 =?utf-8?B?MFZsWnZ2MUV3R2VXOTQrZkl2bGRJd1BYNnZNNzJ0eXJHbm9hWTNTbEZ0VTBX?=
 =?utf-8?B?dkN4U2Y5RzF4TnZVcno0NGZqNUo1TURhVDA3KzM4TFdZTlNMa1Q1dVhVdkQy?=
 =?utf-8?B?emRPbW01RnN4TDlDZklzeHlQdkdGS05sVjNzUHdQQ3NCU3FISXE5WTdlZ2l4?=
 =?utf-8?B?dEVVMnB5RWlLTThyRXRUUTlWZVNwNDdWa3d1WWxuQ1huSXVkbXZndz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ac0a25-10b3-4d12-3c4f-08de72e82829
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:30:56.8533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCOOxuAaEcxuYuQvt7k6eDz1pMNZdoxDBnaBqcGqlEcWa6U63SwUGOE2NLcYPrSpcDDOaLlvnvb5PPIPXxC4fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6747
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



On 2/23/2026 7:49 PM, Mallesh, Koujalagi wrote:
> 
> On 22-01-2026 03:36 pm, Riana Tauro wrote:
>> Add the sysctrl commands and response structures for Uncorrectable
>> Core Compute errors.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   |  53 +++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 131 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  13 ++
>>   3 files changed, 197 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index ba5ed37aed28..ace08d8d8d46 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -4,9 +4,62 @@
>>    */
>>   #include <linux/pci.h>
>> +#include "xe_assert.h"
>>   #include "xe_device_types.h"
>>   #include "xe_ras.h"
>> +/* Severity classification of detected errors */
>> +enum xe_ras_severity {
>> +    XE_RAS_SEVERITY_NOT_SUPPORTED = 0,
>> +    XE_RAS_SEVERITY_CORRECTABLE,
>> +    XE_RAS_SEVERITY_UNCORRECTABLE,
>> +    XE_RAS_SEVERITY_INFORMATIONAL,
>> +    XE_RAS_SEVERITY_MAX
>> +};
>> +
>> +/* major IP blocks where errors can originate */
>> +enum xe_ras_component {
>> +    XE_RAS_COMPONENT_NOT_SUPPORTED = 0,
>> +    XE_RAS_COMPONENT_DEVICE_MEMORY,
>> +    XE_RAS_COMPONENT_CORE_COMPUTE,
>> +    XE_RAS_COMPONENT_RESERVED,
>> +    XE_RAS_COMPONENT_PCIE,
>> +    XE_RAS_COMPONENT_FABRIC,
>> +    XE_RAS_COMPONENT_SOC,
>> +    XE_RAS_COMPONENT_MAX
>> +};
>> +
>> +static const char * const xe_ras_severities[] = {
>> +    [XE_RAS_SEVERITY_NOT_SUPPORTED]        = "Not Supported",
>> +    [XE_RAS_SEVERITY_CORRECTABLE]        = "Correctable",
>> +    [XE_RAS_SEVERITY_UNCORRECTABLE]        = "Uncorrectable",
>> +    [XE_RAS_SEVERITY_INFORMATIONAL]        = "Informational",
>> +};
>> +
>> +static const char * const xe_ras_components[] = {
>> +    [XE_RAS_COMPONENT_NOT_SUPPORTED]    = "Not Supported",
>> +    [XE_RAS_COMPONENT_DEVICE_MEMORY]    = "Device Memory",
>> +    [XE_RAS_COMPONENT_CORE_COMPUTE]        = "Core Compute",
>> +    [XE_RAS_COMPONENT_RESERVED]        = "Reserved",
>> +    [XE_RAS_COMPONENT_PCIE]            = "PCIe",
>> +    [XE_RAS_COMPONENT_FABRIC]        = "Fabric",
>> +    [XE_RAS_COMPONENT_SOC]            = "SoC",
>> +};
>> +
>> +static inline const char *severity_to_str(struct xe_device *xe, u32 
>> severity)
>> +{
>> +    xe_assert(xe, severity < XE_RAS_SEVERITY_MAX);
>> +
>> +    return xe_ras_severities[severity];
>> +}
>> +
>> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>> +{
>> +    xe_assert(xe, comp < XE_RAS_COMPONENT_MAX);
>> +
>> +    return xe_ras_components[comp];
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void unmask_and_downgrade_internal_error(struct xe_device *xe)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/ 
>> xe_ras_types.h
>> new file mode 100644
>> index 000000000000..c7a930c16f68
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -0,0 +1,131 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_TYPES_H_
>> +#define _XE_RAS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#define XE_RAS_MAX_ERROR_DETAILS    16
>> +
>> +/**
>> + * struct xe_ras_error_common - Common RAS error class
>> + *
>> + * This structure contains error severity and component information
>> + * across all products
>> + */
>> +struct xe_ras_error_common {
>> +    /** @severity: Error Severity */
>> +    u8 severity;
>> +    /** @component: IP where the error originated */
>> +    u8 component;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_unit - Error unit information
>> + */
>> +struct xe_ras_error_unit {
>> +    /** @tile: Tile identifier */
>> +    u8 tile;
>> +    /** @instance: Instance identifier within a component */
>> +    u32 instance;
>> +} __packed;
> Performance penalty for accessing unaligned u32.

These are response structures from firmware.
will check

>> +
>> +/**
>> + * struct xe_ras_error_cause - Error cause information
>> + */
>> +struct xe_ras_error_cause {
>> +    /** @cause: Cause */
>> +    u32 cause;
>> +    /** @reserved: For future use */
>> +    u8 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_product - Error fields that are specific to 
>> the product
>> + */
>> +struct xe_ras_error_product {
>> +    /** @unit: Unit within IP block */
>> +    struct xe_ras_error_unit unit;
>> +    /** @error_cause: Cause/checker */
>> +    struct xe_ras_error_cause error_cause;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_class - Complete RAS Error Class
>> + *
>> + * This structure provides the complete error classification by 
>> combining
>> + * the common error class with the product-specific error class.
>> + */
>> +struct xe_ras_error_class {
>> +    /** @common: Common error severity and component */
>> +    struct xe_ras_error_common common;
>> +    /** @product: Product-specific unit and cause */
>> +    struct xe_ras_error_product product;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_error_array - Details of the error types
>> + */
>> +struct xe_ras_error_array {
>> +    /** @error_class: Error class */
>> +    struct xe_ras_error_class error_class;
>> +    /** @timestamp: Timestamp */
>> +    u64 timestamp;
>> +    /** @error_details: Error details specific to the class */
>> +    u32 error_details[XE_RAS_MAX_ERROR_DETAILS];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_error_response - Response for 
>> XE_SYSCTRL_GET_SOC_ERROR
>> + */
>> +struct xe_ras_get_error_response {
>> +    /** @num_errors: No of errors reported in this response */
>> +    u8 num_errors;
>> +    /** @additional_errors: Indicates if the errors are pending */
>> +    u8 additional_errors;
>> +    /** @error_arr: Array of up to 3 errors */
>> +    struct xe_ras_error_array error_arr[3];
> 
> Use a Macro for a magic number 3.

Sure. Will fix

Thanks
Riana


> 
> Thanks
> 
> -/Mallesh
> 
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_compute_error: Error details of Compute error
>> + */
>> +struct xe_ras_compute_error {
>> +    /** @error_log_header: Error Source and type */
>> +    u32 error_log_header;
>> +    /** @internal_error_log: Internal Error log */
>> +    u32 internal_error_log;
>> +    /** @fabric_log: Fabric Error log */
>> +    u32 fabric_log;
>> +    /** @internal_error_addr_log0: Internal Error addr log */
>> +    u32 internal_error_addr_log0;
>> +    /** @internal_error_addr_log1: Internal Error addr log */
>> +    u32 internal_error_addr_log1;
>> +    /** @packet_log0: Packet log */
>> +    u32 packet_log0;
>> +    /** @packet_log1: Packet log */
>> +    u32 packet_log1;
>> +    /** @packet_log2: Packet log */
>> +    u32 packet_log2;
>> +    /** @packet_log3: Packet log */
>> +    u32 packet_log3;
>> +    /** @packet_log4: Packet log */
>> +    u32 packet_log4;
>> +    /** @misc_log0: Misc log */
>> +    u32 misc_log0;
>> +    /** @misc_log1: Misc log */
>> +    u32 misc_log1;
>> +    /** @spare_log0: Spare log */
>> +    u32 spare_log0;
>> +    /** @spare_log1: Spare log */
>> +    u32 spare_log1;
>> +    /** @spare_log2: Spare log */
>> +    u32 spare_log2;
>> +    /** @spare_log3: Spare log */
>> +    u32 spare_log3;
>> +} __packed;
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/ 
>> gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 1f315ad1b996..45ef10f5cfa2 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -8,6 +8,19 @@
>>   #include <linux/types.h>
>> +/**
>> + * enum xe_sysctrl_mailbox_command_id - RAS Command ID's for GFSP group
>> + *
>> + * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
>> + */
>> +enum xe_sysctrl_mailbox_command_id {
>> +    XE_SYSCTRL_CMD_GET_SOC_ERROR = 1
>> +};
>> +
>> +enum xe_sysctrl_group {
>> +    XE_SYSCTRL_GROUP_GFSP = 1
>> +};
>> +
>>   struct xe_sysctrl_mailbox_mkhi_msg_hdr {
>>       __le32 data;
>>   } __packed;

