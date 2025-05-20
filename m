Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58400C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 09:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F09310E4D6;
	Tue, 20 May 2025 09:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGtcjLeE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5738310E503
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747733368; x=1779269368;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=patEoSCJ9f645JpgVzcXP4X1DY/y4zCqY4FZ2TBCx/g=;
 b=hGtcjLeE5ZFnOrcRqQVIxKADl9i+nwlsSbWQC+Z2/JpX+K4gm4Y3J9ey
 B6hpber0PPZ4V+Hb5xImmEKeaxEjtfPF7J6gNPErEdu5/q5lx8oJtD3wR
 SA+MN/+hnXHPUoXakLyNX4joXXq0jH2jEFwf+XbekGAauV2YkgA1eZXrt
 5sdV/dXm2cbxkTT6K7J+TQ5Yw0ro/r/+5Edh/zd456jZUAK2SmnY9y1pd
 Y2ZJ1BGGZEZfVL8GMkmO344HRwQcHIWloCNasQqGQWouGesKUweeRpxmj
 OH6qEqymRkqN+sKyR1dshhRnJRC/R22yeATuakavio/6sSXuI0ZNzBQrN w==;
X-CSE-ConnectionGUID: JS2ekEEjT22WCfoMjaBPBQ==
X-CSE-MsgGUID: hjIRCkNKTJWglnKk0L5B/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49586293"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49586293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:29:28 -0700
X-CSE-ConnectionGUID: saCiw2AJQ7qPZiQn1ZJtsQ==
X-CSE-MsgGUID: xYYqBNUGQJ6HfjNylwL9rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="170522511"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:29:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 02:29:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 02:29:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 02:29:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/4KNLw5eKrp9SeYtqDB+qfYyAnbrQkZaPyQR04dCMfa0Rj/B6FvWTz80N/bI8lErqUlMiGxCkLtEP8nbwP/lZVKJd/XSnq0O3MNc2Sa1aSsW8nBijbkTEjpOAaRyUI4DIQWLMcME1QnCkrzjokZVaM/iGvv6rI5HBsJ1VpkpeYNFbDhRypG4hdKDu64lBC+a1vJ92G/g/mqWAZ9rDS8aRBvFX0NqojFIRVBwWHumtC8XS4DiTfFmMpw0uUDl1Hg8+2gIKrWUH2zR7/1Rw1FrhYT8OUoNOOz/6XsNcVYQl8HEddwPgrhgnHLMgaHWQAkeEC4cgdvx14xW5kucnhq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3na18HuKVkICc2PAKs/boexXuvd3X4TTnjzHLJQ6go=;
 b=I+vnHmiGh/Is0v3ZbLIAkZPVjElXBifFBangMD0OaAgVSSXAEBK0kXJjTUy+5fsg+T3tXBqqb6cCi5+VTTHXQhg4SKjir+elffoyN7+vgf1dCncdZtG51bxuJBt5p6z/ck2xNg+QzkYk/qwntS6m1ciF4khN/G3jm0I7EuscuA16gcl4iOHX0vcdczlTIxUhOBx1yRSPX80P7gi4U3wSbL0pYR3KlLapnh9euOLGskayFeJJR6vDv0CAbaOQC8I+GWlqsDtSjoDIPqoa+Bm70ZSsTYW7cXGdrIebJiYW6zXpynGm5NBQqGdfUz3B02Ct4g4YeLI6BLvfmSuX5/vQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 20 May
 2025 09:28:52 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Tue, 20 May 2025
 09:28:52 +0000
Message-ID: <4bd30666-cc60-4e98-ad1a-2b356db7678f@intel.com>
Date: Tue, 20 May 2025 14:58:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/32] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-21-himal.prasad.ghimiray@intel.com>
 <aCKwSLSJvGF1n6AV@lstrano-desk.jf.intel.com>
 <aCTjoNNlxviyPEQ6@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCTjoNNlxviyPEQ6@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 9508484c-544d-4378-c76b-08dd9780bbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0tuWlhreDErbnUvbVVYTlE0cm15TmFjZjU1M3J6bnpYMFJoaEwvMitMdG1N?=
 =?utf-8?B?VmdST0lhcjFUSEdrd2s0VDRCMndKWkVZY01NQk1EUzYzelM4VFEzc1hMV3ZH?=
 =?utf-8?B?TmlUTnlxL3hEWWtpdWlmWGJiOFFxbG1neVg5dS9PdjJpTjRLR21pRnRGbk9X?=
 =?utf-8?B?Ry9BV3lZNFZwdmRtaXlDeitaTmpIRVVyUG00azl5NlFhMmV5Z1BWRjZkOG5w?=
 =?utf-8?B?UUFTUjlaUFUwN01UanJmQnlLUmVyL2FvKzlIZmMrWkd1UFI0TkVzSjJBZXoy?=
 =?utf-8?B?R2NNK2N2dml6OWQvVWNCbWVaRzR2ZjM4STMxamdkVlBRMUZFemkxeFpuRlhx?=
 =?utf-8?B?cm1ZaGcrNlZnT281dktMYTI4TnJFMTVENHFMTHA1d2d2Zkl5RlZiTm9TU0xx?=
 =?utf-8?B?akZLdTJUWnNRVDdYVlFTTTNmRllnNERkZVZ1WkxsU3pTT0lqcHUzTURaSGxX?=
 =?utf-8?B?L3hJaWYvVlZPWEVSV2RSK1ZDRlYxYnUxbkNCb0FMRVBqRmQzQWU5WklvUnFR?=
 =?utf-8?B?d1Z6YU9WRWtDcklWK0dteWUzYmR2MnQ3NE0rWFNSZGQ0UkhaZ3d0amp0aHRk?=
 =?utf-8?B?cXpnelZtcDYwaUNhQWZCQTI5SE1ET1VUSWdmdTQ2MzV5dEpGc1lKQi9oRGtm?=
 =?utf-8?B?cU1HcVhVYVI0RUdESGY1Ni8zT1lmakVzU2l0c3dJY1lpdVVFMm4wOFhzUVQw?=
 =?utf-8?B?bWhMVzB6c2dpZVI1TE13akpoT3FBZjdtL1JoaUI5Q3hWbGh2THVmeS93TGo2?=
 =?utf-8?B?aGpGc0dMYXY4eUJ5dCtZRk9Qb051TXkzRFMvUjl6WjZHWlVvc1NCYldWeVBB?=
 =?utf-8?B?NWVxaGFIZ21QT2IwNWVIK3RSRGZTOGtLUDlSZU1UVjBNOFdnV0JuUVY3emNU?=
 =?utf-8?B?dWFPazdtaGdSMVJxZnlmUUNlVjhPVzFtbXR3cnpUWDIyNktsVE5GNmpsejd2?=
 =?utf-8?B?ZVRYdlErSk5ZblJ3VTIvUC9yekh3OVIzN0ZPUGo2MHJnQWJZaEdFQVBKNitP?=
 =?utf-8?B?SDFldXRQempGT1NSeEdadmpwMmJOOHptTnNlYnYxSUx2K1UwQUhhOW1nNHJj?=
 =?utf-8?B?QnJMR0ltTTQ2M3hnSFBnYjlucmtvcHpQRVVtUk9nenZua0pCR05GQnoxMFdo?=
 =?utf-8?B?d3AxUzBYU0NsQ3pXbWJzWTlHUkhjWlg0dGhTaThwMlZmMElDRXJySDVxTDNO?=
 =?utf-8?B?WHo0bERUQlN0U1VYNlRMdEZkOElLMlEzVnRXcGNuV0NWYzRZdllYZU03Nnhk?=
 =?utf-8?B?dVhWN1Rtc21SemFQUEdPbDhGUTJ1TzhtMU1tRUNkUFFoTHVxeFlsdEtMSjZV?=
 =?utf-8?B?Rm5sODdjUjF6TWh6aWQyUU9RSzRhOFhqOFppM0FTd1JRcW9jSlpJZ2NmcStw?=
 =?utf-8?B?U3dkUVRzck1XNjE5SUU1cmdXUHNCUktyejhicElRaG12WEpuRFJTYitGM2dP?=
 =?utf-8?B?U252clhxUnMrRHFSYzJDYk96akNFSUJnMlJVemNyd2c5L2xSL2xqalRoM0l0?=
 =?utf-8?B?OHhxeVgxS2ZaY2htYVlLaHpNVmtMTnczMWZzdithbzlha2hWUkZsNXBxY1Yr?=
 =?utf-8?B?cWUvcFdNUXhXMldzU0d1RnJCdEFwWjlFSTZ1b1FpVzNyMzlkbkNuamFTSk1W?=
 =?utf-8?B?NUVLdm9WMkFkTXBETDkyVkVTdnlHOTVHNzZId3kyVHZ3NzhKUlEwa0JVWjZK?=
 =?utf-8?B?TmZMeDJzVE1kTVNtbzV1aHphcFV3ZWVLTTE4Q0NhQ1F5cGxDTDE2UU1zRmRv?=
 =?utf-8?B?TjlMd0NMcW9xMVpZL0RHcTh1eWU5QUkrckdrRk1ia0FoT095Q0M1L2UvOHRi?=
 =?utf-8?B?YzkzbzB4MmZaMGxYVWcySWRLb0VoRXZTM1F6VE5BempUWmZxNk41M0VnM2dk?=
 =?utf-8?B?Q0JTTU56c3AwL1N3QVBMTmIrQ2pRRFhXTGhNM3JPdnRpS0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXlleWprczRMS3F4c0hsNGtiUlk1N0RPdzBYTGtjalhqQS9UdVNqUmQrNmpZ?=
 =?utf-8?B?N2NkWWMxS3dPYTJUQWtaTGVmRmh6c2xQVE82V3VxVDd5MEFFcGc5NUptaTlo?=
 =?utf-8?B?RlJuOTU3NWJqL1VZaWtmeThHYlhtSms5WHNHQkhScGlEQUxGTk9scXppS0hx?=
 =?utf-8?B?ZFVxQjlZNEZ0V3pZWXBBdkJ2dDA0TWJzUVJGMTNndjhObXJaai9GZnB2cUI2?=
 =?utf-8?B?clZoQ2dCQko1bWo5TjlHS00rZFRNY0lnZ2VpbzhaOFdua25oNFYrTDVZRVFG?=
 =?utf-8?B?U2FKVlRKUFlwcHpBVHJnOCtORXp5Vjh4ZjVFYzRUSjIyS2t5ZVFFT01MUSt1?=
 =?utf-8?B?MzBIcHhSL0dGSFZUb3JVL2NtRnFXMkFaMllwNEozdmd6OVVzR0xqVW03ZmQ1?=
 =?utf-8?B?RVdqNlBDa1dLd1cxWXpjdHh5SEsvYzg0TXAzSzJ0OENsa0RSYlI4SXZwdWlN?=
 =?utf-8?B?a2FHWmxGQU5KSGtSZ0EwSm5yOVB4Tm10V0xmSXhIUFBMTzB1N2hTaG9nV1BR?=
 =?utf-8?B?dFZGOTRDR3ppOWM4WmlYenVwbHk0UndRd1ovL1FQVmo4SG5yQVloRlc1Ymkx?=
 =?utf-8?B?alZwbFpTcG1rQmdsQTlZZzZFc0FMWFZRc2hodGlkSlBoaElweXloVUJzRDNQ?=
 =?utf-8?B?dmZYSTYvUGJ4SVN0SXN2VGtWU1EzTVJIOGFoZkJPWWtReFBBaWFwd0NEQXMx?=
 =?utf-8?B?akhmSEI4a1VmQTEyeHVQY0EwNWxkQ1FLU05DVWk5ekpzZi9vQzBJSitmTytu?=
 =?utf-8?B?ZzUxM1UrenpGbFlyUXNNS3ZmNHFTUzkyUXU2SVB1NGN1aTFhTVZmNGxaYksv?=
 =?utf-8?B?akFtblIxS1ZmV3hGTmJDT040VGVONFJjREM0UDY2eVpzMGtCb0ZZT1MrcHo5?=
 =?utf-8?B?aDdoS2dOd1VCc0Z0Unl3a3pZLzdhTmwrb0FQM2llZFBmZ1JTb2hNREZvYWla?=
 =?utf-8?B?VzFMcWtvcHFyOGlMZVpkUUMrRG95bGQvUS85bEpaMThvR1JDdmFjWUhrOGtI?=
 =?utf-8?B?d2RzdjQzNGR1eHljL2hyNnNJcit4U3FkSmV1Qk1ScjZseTdxaEhxTnhoZ0tS?=
 =?utf-8?B?bEdaQ3dzdFlxbzdzMXBSQ3RUdXpDZWJZUkh5MWRLYm1NTmhDOU9aTFFkcXBo?=
 =?utf-8?B?NTdHTDhOMC9rWUR4eUp3WWlWVGxiNFR0ZUl6RmtFdDNEV01yaTBSTVF5U3FK?=
 =?utf-8?B?NWNoV3FtQmxTWDlBNUtTLzZrbW1jTGFpUm4zakhwV3UzWkpqYlB6OXIxQ0E4?=
 =?utf-8?B?ZGhRSUxOQ2pzZ1BERzluUTFnTFdWa0MvSGZGR2ZFYm84cGdqc0ZCK1Y4eHdh?=
 =?utf-8?B?QWl4UjFpQ1JvT0xlZGNVcGNscGcweXpyQS9Yb0N5dVJCVy90UEVTUE1rMW1u?=
 =?utf-8?B?eHNCMFEwb3lHQkY2aVBZd1loU285aytwSTVEdzNsQ2phWU1uZytqeVhHT1Jx?=
 =?utf-8?B?SldLeTJIMWdidVZudG9tbEpyUWVmODhpbkllVUdpTXYyT2xNZ0c5QTRMdjRu?=
 =?utf-8?B?cUlKamRITktWcDZUTk83aHZtT1NpcGZBVE5hM0ErM3ROcGdjd204bkhDNUNX?=
 =?utf-8?B?MW5tdUdxYUs0UjBTcDVEd0czT1ZkQ1kxeDBiWWkwSVB2Z2d3bXBHQ1hkM09x?=
 =?utf-8?B?VFJpSjlQblBNUytsemZmU20xOHJWYThiNlRnRnFWZmVDcUwyUi9idnRDVitj?=
 =?utf-8?B?WUt6WUoyN1ZDdGkvcEpLNTh4WHBWallwVW51SEd2dnlQeDBxQS85bVBFalRE?=
 =?utf-8?B?Vk5sVllxb1E2RHBMWmc4cktHendjVnpJclorVVpudFpXYjN5bFVCbDlENnhy?=
 =?utf-8?B?Z2w5OUNxQ1dkejBHaHhtQXhyRCtJRWl2d1R2aWFGSUVPYlVVK3kwSTMvdkMw?=
 =?utf-8?B?U0ZEMFpMbC9qOU9SRXlCTFpISHpqeXppa0MvbW13d3MxdHRFdlg4dEJSVW1u?=
 =?utf-8?B?SnlEd3V5b1NqenpKUmRTMjZQTVFNbGpjOUJCMEk5UzQvRFpXN2puSWhhakpU?=
 =?utf-8?B?RVJtZDZTUjhJaW1VTVB5MUhOVmRQZkJIKzJVVW9RVDZIZmRtZ1M4bmxpUUVy?=
 =?utf-8?B?SU1PUHptZEp4bDBuRkRJeld3Q3g3MmdqYnZzb0hScE02clVlUFlmMW1CZmh4?=
 =?utf-8?B?SC9kU3VqRXJrc2hxR0FZaitZQzlmemxJZC9XOW92cWQ1RDlTQkdISnVJaVZm?=
 =?utf-8?Q?5Lay+5/OY/+R0LAcqI2q5C8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9508484c-544d-4378-c76b-08dd9780bbd7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:28:52.2502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9poKD66hHBQkj0x6GbzIjlBuOWL8eId5tiLMwImRH+L8dzGY+jNKNCYpDTCquimYZjuOoMN+tVj+jHs8bZD09tLsp+oxUSqyoSeOZHNzS3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
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



On 15-05-2025 00:10, Matthew Brost wrote:
> On Mon, May 12, 2025 at 07:36:56PM -0700, Matthew Brost wrote:
>> On Mon, Apr 07, 2025 at 03:47:07PM +0530, Himal Prasad Ghimiray wrote:
>>> This change simplifies the logic by ensuring that remapped previous or
>>> next VMAs are created with the same memory attributes as the original VMA.
>>> By passing struct xe_vma_mem_attr as a parameter, we maintain consistency
>>> in memory attributes.
>>>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_vm.c | 37 ++++++++++++++++++++++++++-----------
>>>   1 file changed, 26 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 59e2a951db25..6e5ba58d475e 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -2421,8 +2421,16 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>>   
>>>   ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>>>   
>>> +static void cp_mem_attr(struct xe_vma_mem_attr *dst, struct xe_vma_mem_attr *src)
>>
>> Drive by commment - not need.
>>
>> memcopy(dst, src, sizeof(*src));
>>
> 
> Actually you can just do:
> 
> *dst = *src;

Noted

> 
>> Matt
>>
>>> +{
>>> +	dst->preferred_loc.migration_policy = src->preferred_loc.migration_policy;
>>> +	dst->preferred_loc.devmem_fd =  src->preferred_loc.devmem_fd;
>>> +	dst->atomic_access = src->atomic_access;
>>> +	dst->pat_index = src->pat_index;
>>> +}
>>> +
>>>   static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>>> -			      u16 pat_index, unsigned int flags)
>>> +			      struct xe_vma_mem_attr attr, unsigned int flags)
>>>   {
>>>   	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>>>   	struct drm_exec exec;
>>> @@ -2451,7 +2459,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>>>   	}
>>>   	vma = xe_vma_create(vm, bo, op->gem.offset,
>>>   			    op->va.addr, op->va.addr +
>>> -			    op->va.range - 1, pat_index, flags);
>>> +			    op->va.range - 1, attr.pat_index, flags);
>>>   	if (IS_ERR(vma))
>>>   		goto err_unlock;
>>>   
>>> @@ -2468,14 +2476,10 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>>>   		prep_vma_destroy(vm, vma, false);
>>>   		xe_vma_destroy_unlocked(vma);
>>>   		vma = ERR_PTR(err);
>>> +	} else {
>>> +		cp_mem_attr(&vma->attr, &attr);
>>>   	}
>>>   
>>> -	/*TODO: assign devmem_fd of local vram once multi device
>>> -	 * support is added.
>>> -	 */
>>> -	vma->attr.preferred_loc.devmem_fd = 1;
>>> -	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
>>> -
>>>   	return vma;
>>>   }
>>>   
>>> @@ -2600,6 +2604,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>>   		switch (op->base.op) {
>>>   		case DRM_GPUVA_OP_MAP:
>>>   		{
>>> +			struct xe_vma_mem_attr default_attr = {
>>> +				.preferred_loc = {
>>> +						  /*TODO: assign devmem_fd of local vram
>>> +						   * once multi device support is added.
>>> +						   */
>>> +						   .devmem_fd = IS_DGFX(vm->xe) ? 1 : 0,
>>> +						   .migration_policy = 1,	},
> 
> Where are a couple of magic '1' which I suggested to avoid patch 18.
> Same question as patch 18 on the usage of these.
> 
> In general I think this patch makes sense if the to previous patches
> land.
> 
> Matt
> 
>>> +				.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED,
>>> +				.pat_index = op->map.pat_index
>>> +			};
>>> +
>>>   			flags |= op->map.read_only ?
>>>   				VMA_CREATE_FLAG_READ_ONLY : 0;
>>>   			flags |= op->map.is_null ?
>>> @@ -2609,7 +2624,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>>   			flags |= op->map.is_cpu_addr_mirror ?
>>>   				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
>>>   
>>> -			vma = new_vma(vm, &op->base.map, op->map.pat_index,
>>> +			vma = new_vma(vm, &op->base.map, default_attr,
>>>   				      flags);
>>>   			if (IS_ERR(vma))
>>>   				return PTR_ERR(vma);
>>> @@ -2657,7 +2672,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>>   
>>>   			if (op->base.remap.prev) {
>>>   				vma = new_vma(vm, op->base.remap.prev,
>>> -					      old->attr.pat_index, flags);
>>> +					      old->attr, flags);
>>>   				if (IS_ERR(vma))
>>>   					return PTR_ERR(vma);
>>>   
>>> @@ -2687,7 +2702,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>>   
>>>   			if (op->base.remap.next) {
>>>   				vma = new_vma(vm, op->base.remap.next,
>>> -					      old->attr.pat_index, flags);
>>> +					      old->attr, flags);
>>>   				if (IS_ERR(vma))
>>>   					return PTR_ERR(vma);
>>>   
>>> -- 
>>> 2.34.1
>>>

