Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96670C282C5
	for <intel-xe@archiver.kernel.org>; Sat,  1 Mar 2025 01:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548AF10E076;
	Sat,  1 Mar 2025 01:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKbu7wwv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4030310E076
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Mar 2025 01:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740794168; x=1772330168;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VgzMvepHkLJaL6C11HmOPMicF08m5XbPnQVCxUrsIc0=;
 b=IKbu7wwvDF6R2ztDP0xHQIDoakw5N+RUAGJZrYoDUV8jelh0GIvMx1ss
 b1xbxxNDBK9YsyJmWDPKw4mfaCF+YITA1GKOfO9bvhLG2QhTctcWAb7T/
 pK+HCFWbHj+S65XEF6+4vEziAJP3pY7xv6dk8T1nImpIYVLUGtt3oGnYu
 0EWse2g2Z7TPZvRi3SelrWwwcml6gFU8Yzb9bwDFki4nry6eAYTTW5oPW
 odj7i1nINRP+r1HRuz0Qtv7mnslm22b+AcHErQa/uRYw7lbNFtqdB5V9Q
 ePK00kQzABJU69dIbmA/v00oI6WZXe5w5fyzEEoO07EAHY8bUxZoS4M7y A==;
X-CSE-ConnectionGUID: NVe1GyHORUS+Tks9d4Z9gQ==
X-CSE-MsgGUID: Y+O6y53ZSSC4e6YkPBdAlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41861909"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="41861909"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 17:55:56 -0800
X-CSE-ConnectionGUID: PbCzKjHoTwWJBguflxqFTA==
X-CSE-MsgGUID: R5NC+ZpVRjazNMqQsDbnYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="117514570"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 17:55:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 17:55:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 17:55:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 17:55:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y31Ah/EzqFzclkykXk9e9Wi0oJ9dNv5PypRWJDz4LeZa63k37qckpSbk6QmddDET5jFcY5k9YTqAxWUtKYd0Hhqao5OCpVKAOpTeNsieWrhILEIagD35f3I9E9NzGiYab4niFAGtN0s0lLjHurGcgbV+De0x1a0yXqMxhY6YSucA2i+f3tqSheaB0wfRBF5Ed0rvJWXfbY9x4xM7JLQsEUXN7A3nAwB+rKFiFQ8xOM5/v8ulZCqoOLHp8u2IrxF2TNkfgsrU/RXEPJL5Td50e0YNfnU2mjDpFqbJrpdgntWBrMZ4Jq/wLm52pz058nvIhUllmdFK5ip1FvA78lVaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KwK3Ma4e5HepPKi0tAcC2UZsM+1f0ym1ffj/++g52s=;
 b=nJ+CTvlaXAKUDtIT/epEiuBuTp3WD8Y++gGKX/o3ngnQapkMTY4LMTL8UnshxtNAm20N1BnYVld/IidsIEPsBrNC0p1z84Pigubx/tz8jewCrNoDifBYzE+yqYybzKH+2BZK5hrdDGaHH2da2mPDxlEf3DfHkKnUqCh2HlgaiKZhIoEvxvndpxEHcT0JhX4Tf7yyrtmR2MROvL8nb8pTKL5jEFDFQ1JmAE9sYK5km2oOHAQ0zHJBWx+zE+pNwee6u7r2+3xgRerI4V8VcEU2NXf8jkpvzokTsapigmIp0NV2j7uOLnkO8yut0hKxZIUXz4jyhrzvrt8VgL2LhHihGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB7255.namprd11.prod.outlook.com (2603:10b6:8:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Sat, 1 Mar
 2025 01:55:52 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8489.021; Sat, 1 Mar 2025
 01:55:52 +0000
Message-ID: <d0384c1a-f3aa-4c1d-922d-7dae3f61de69@intel.com>
Date: Fri, 28 Feb 2025 17:55:47 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/guc: move KLV helpers to common file
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250227010530.3002093-1-daniele.ceraolospurio@intel.com>
 <20250227010530.3002093-2-daniele.ceraolospurio@intel.com>
 <02842531-7ce0-4518-a6c9-9530f946bb26@intel.com>
 <03101dc5-00cc-440c-9358-c136ba6d961e@intel.com>
 <ba0e0dab-3561-4ed7-abb7-ff424b3d8c3d@intel.com>
 <c0e68a6d-4250-4373-b573-2490b374660c@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <c0e68a6d-4250-4373-b573-2490b374660c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:303:b9::28) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7acfd0-88ae-4498-e75a-08dd5864321f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFkra1RwalY2SHBNalRCSEI3TzZOQWU1azhqMXBKL0NqUjFpOURLUXhGb3My?=
 =?utf-8?B?OGE5cmtOQWtOYm00U21uL3JISmlTMGZCbnVieGVDaVdIaTR6Vi9xL1gxWEg0?=
 =?utf-8?B?MUtDOFhhYVZUcUlGUExFbVl3RFh3MlpraE9FQkNNejRjQzJpaGFXcmoxQ042?=
 =?utf-8?B?Z01SNGtOeUc3ckN6YjBsWlNWam9kS2luS2ZVMDNwME9wNURseTBqOXhkQTVn?=
 =?utf-8?B?R1JMeG1oYmdKcGl1TWdpdTlRVWRrZHBpZHd3VGJMU3pZdXQ4bmhSeGhUMXdx?=
 =?utf-8?B?N3IvZjdVUzR1ZWs1cWNlNTZZdTJTdGcvRHZDNHJybDl4cTFGdGR4dUV6cDJ2?=
 =?utf-8?B?SnZxVHA3c1lFMEZycHZwd3hlUDJoRmE0bVh4bXU1UW4yY1JKQllaeDB3SFk2?=
 =?utf-8?B?WVdzY0doSzl1S2xuZlpQdzNUZDdaRDFQa1BmeVR5TW5FeVBFd3MybnhoNEdG?=
 =?utf-8?B?L3NFUTU5OXlhVkI5bDR5UUFUL0tSWGtWTGtza2JSYTl2WWlIczNmZlJkUlk5?=
 =?utf-8?B?bFIzbFkyM0t1bVdaQTBkNnpKR2xFUTRWR0hYM0E4Zy9nUEFJb21GbUxNaDdn?=
 =?utf-8?B?aGVjbnFTajg4SjJ2ZVpRWENUT3B0STFrZlVoYVFXcThFaVdkcWxUYkkxR2pu?=
 =?utf-8?B?R1JxbURyYUNjSzhucVNSYTNpcmtaT0E0amNXQWMwdStVRzRwRW9lSitCdVlJ?=
 =?utf-8?B?UGovYjRtUXFJY2pvYzNsYUM0Wk00cDNaczNZZkVGSktrRkw3MHhVS1M1Y1h6?=
 =?utf-8?B?ekpsUlQvdVlCWVhtMThFTXRjRHZnK21rdHl1NTAyU1NOM3Q4VzR5VlBWUVJK?=
 =?utf-8?B?aGVqYXUvMTlsa092UDU4UFpQclBScURJN1Vqb0RpTWw1WjRNL3BxZVhVYjh4?=
 =?utf-8?B?NDhQSlRuQ3pHWEFESW5rZUh5VHJIMHhMMFQyeHpTQ0d3ZS9HdTNzR0VOQzBr?=
 =?utf-8?B?cGZlNFhRNE5LOExPOHFtLzk2N0JEb21KNEFyVDJVRzJxVm9XdUI2clBJTkNK?=
 =?utf-8?B?NzNXODBnQ29kWlJEeXRpZmpBeUVMRy8rTDc1eDNocWhTVFdoVXZoM1BOZmov?=
 =?utf-8?B?TVFVa3BXYXUvdzFucUtHY2c5aGtmZTFNeHdJNlEwNWFsSEp0MFFOcnVzVTlO?=
 =?utf-8?B?UTJTdWhvd3cxb01NMnBzbno4NjNiTFdXNE8xc0U5RE45b29SeFNMZXVjTHJW?=
 =?utf-8?B?ZHRVa1dFa011WkI2bXc1RUk4cWwzazMwU0xYeHBYb2lLMjYwSldSZGg0MUhZ?=
 =?utf-8?B?UGp3VncxT2wrQTE2N1dEVWRxVzlHRkNxcEZrZzFaWDFGQ1QxY3d6RE83TnNy?=
 =?utf-8?B?Ulo3ZWVHSWEray9qTStuekVwVkZ1V1hKQ1RYNlBRLzZmbHRwRktqWTlBelB2?=
 =?utf-8?B?Zm5yTEZ4MzlqRDVOYk1RSVFzR1VueUk5WExnbkZtSGUzMFJDa2dnU3FCbVhK?=
 =?utf-8?B?RUFYZzBVWHFPNmJqWE1vQ29pV0UranZ5cEV4S21zTXQzZ2VERVdwcXA0VTBU?=
 =?utf-8?B?UWs3T1o4Tk1lcW15bDQvRHIvcjZZb2w0cGNzcW5IVEVUNkFyWU1sZC9FUkxB?=
 =?utf-8?B?NzI5MUM1ZGZMTVZmKzlvdkFZQzYzcHZkanZZNlpXSmMvQ2J4a3JzYy9CWXNm?=
 =?utf-8?B?SHhRQThrUkwxbXJrTGI4aGsyWnp2N2d5VDdDL01xZ3VGSFV2Y2IzazBsNXZq?=
 =?utf-8?B?WXVIUFFVN09ydmNkdFZNYTM1TkhqS2JRYlF4TE5KY3YrWDhqeUlrbEd2cE1P?=
 =?utf-8?B?cXFzVjdyOHQ0WnRkY040aTgwZkozbG9IdllBYTh2enlqM2pkaHVkT0U1bUhH?=
 =?utf-8?B?MzN5bWVJMFFqd2hxZWVUTmpOajlvbWVtbnZCTklpcXpRMys5c3dqajZsL1hz?=
 =?utf-8?Q?ImMQxW44h/DvW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmJBQ3I3V3R4NEdjK083alhFa21JT3FFTzNPeWRNaHJ4cjZiMVRyenlXQWtZ?=
 =?utf-8?B?dUNjUmhiTHc4ZmxFV0M5NGtKZjAzd1ZFMSswK0xCV282QlVxOWs4cGhLZ2NB?=
 =?utf-8?B?NThMcDBvMUxpWUNtcmRQTWd3NE5yd2JNN00wODJLREMzVktKNE5uTDQyUW5W?=
 =?utf-8?B?Vk8yVHkxSUlkby9YN3BkaldTVm50Q2NGazJJcFhPZGYycXM1YVhKSnhCMCtn?=
 =?utf-8?B?elVxaTBrQm95dStRVXZmNFdPMzBzVlBUdm9UZ1N2ZnJ1RHZZYnFiTTIxV0hT?=
 =?utf-8?B?akxHdUtxTnlrb0x5SG9MNU1pbHpGR3BoZ05EQXFCR3BubkhRK3kxbFordTlU?=
 =?utf-8?B?Nld0WmIwMlJONExFVDdTQTdMQytGNWIrTXQzeElyYlB1ZEs5N29MSjkxbXJx?=
 =?utf-8?B?RG9ZOURXM0hMOU43bllGdVhBaGRmQkdINDFVbFZMdnE1bUZWcjg1djM0Z1I5?=
 =?utf-8?B?bGlrUnFTMUJ1VjlScjFycWtOdDloejhwUStZaWFGTGlmeUM4TUV0U2VRaVpr?=
 =?utf-8?B?bUYyTG5MZU5WWXVCWkVRWERwbnR1ZVRTeXZudTVKa3gxT29peDlCeXgxZ01B?=
 =?utf-8?B?QUpTNGw2RUdzUzBrVDN3VDQ2WDRtMWQ5eDFNam9hNVRMb3BuM0kxejNjamd5?=
 =?utf-8?B?WlVPQjUvVDA0cGlCVzMzeVFnRm1nZlo4UHZRU2RLdmFLOTFHOFlJS3BmZ1NN?=
 =?utf-8?B?L0I2ZW1ITmNEUUlwUUVwOFhyTUh6SUVDdGw5R1Rrem1OdmRPYjJnbmdXczdC?=
 =?utf-8?B?REM3ME1pOWJldkZtTUtxVGt3VVpGakFvRzRPNnRxdXkxcjAwYWd0Ri96YlYv?=
 =?utf-8?B?d2VwQ2o4aEYyaERibExRWWc2SnBOcVJlQ2FURG9RREtmOHVqL1BTNUt6N2dl?=
 =?utf-8?B?cXZ4SStQMU1oVFFoS1JXUGpGQ2NKMzFoZmV5QkI1VE55ZlN3dVFEUDBvYitp?=
 =?utf-8?B?c3dLd2M2OThBTmExUXFrYU9kRmtRQ1J6em5OdEdlM1o5UEpuWGM1OTRUVkpL?=
 =?utf-8?B?ZHZmQktGUnYzU0ZkZGRIUU52dzNpc01COGJDUVRJQUxsc3NqWFRBYzNhT0R2?=
 =?utf-8?B?SnhhSWlRai9hdGRZbWdOZlRDMlJyWTE4SlhtaGpVSEliMFhBbk43MTJqdURF?=
 =?utf-8?B?M2dEOVNlMmFGWTJFK213bk5Qdmx0RTlvcHJyKytqRzF1aEpvMDB3cVAwVXUv?=
 =?utf-8?B?NzBPcTRtUEVnNXVkbUpwZmtQUGtVbWRFYVR5U29LdEU4U0VaV2ZnSWdCSGpB?=
 =?utf-8?B?emhMd000VlFOMUVkbXVTaWM2Z1N6enF2ZXpqV29HQ2tYaHdORmY4TG5wN1N6?=
 =?utf-8?B?V1h4STREWmJMaTZjN0FwZkxjemVkdVplODRSMy9Pd1JSbWgvL3FWVEdoc1hq?=
 =?utf-8?B?OUtuaW85MDY5U2dhOExPR2JWaVFIKzAzY0hqYlhQZXkweWFNNkVjZnNOUy9x?=
 =?utf-8?B?Q1RvRjBTUm9kM2JNZWtDaWgzUzBQYXkrTDBSSmRZNjJEeFViWmkvR20wVEsz?=
 =?utf-8?B?WHJyeHd4MVdHQmZpWnNHT1Z1OG9IM2h2cytBUHlsZ1VCVUIwa2h6K1duMG93?=
 =?utf-8?B?L25aWlkrY09YTTdmU0FtT0JDdXFqSkxxdUlUdmhlQXNTRTV4MlE1NXlYMHg3?=
 =?utf-8?B?azY5eFd3RThPMmlySWZFOGcvT2hSKzgrYlVLSko1YmVuNkZCem9Ra0tMcmxC?=
 =?utf-8?B?Q0ovRU5KWURpL2RuMzFlbUdIQ0tNQXdHM2NTK2lkTGNsOHhsNEYyRjFNOGx4?=
 =?utf-8?B?NjRrVXI1RUdBVzB3UTBDN3JHRmdmclFPeEN5Q3N6SHM5MTdUUFdnNWt5UGRQ?=
 =?utf-8?B?WmY4djBRQTZqcStTTzdLb1JFS2QzdSsyNXZZRjcvQ3hidGJwYjQ5YkMzb21y?=
 =?utf-8?B?RTlQaWt1RWJUVHVzTDh5bi9kd3pzSW5BY1hnS0lTb0oxKzZGU0VER285c1lJ?=
 =?utf-8?B?dzY1amVHakhxT3NHZjhEN1lCOWNiVEtLeW1HTjc1d1JQRnltcHBBUlpSbTMv?=
 =?utf-8?B?bTQreGg0OTdmMlBhVHh2aUlMd0cwUzg2ZnFlOW1uS2w0cHBTVXc4dmhELzl1?=
 =?utf-8?B?OUtMV2h2dWo3cTFNeWlyaDNXQXlPQm9sM1E0clhEUHR3T0prZ2lyY1NweGxR?=
 =?utf-8?B?ZmYvdEpmWHV2NjUwZm5JQXZuYkR3eVRoY2syTG9nSkVTWFJrM1Fhb0ZBQitm?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7acfd0-88ae-4498-e75a-08dd5864321f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2025 01:55:51.9629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CFnCfaMSxcLRM8VXa3TFPRVcN3RXPQnhdZ3ZMYoEJHPgxIn21g66QgPUqyuaeoIfd6o0z2xsvUlxZXJ7Nc5CuwrpmZu6VWEXBBI12ic4jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
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

On 2/28/2025 14:21, Daniele Ceraolo Spurio wrote:
> On 2/28/2025 1:47 PM, Michal Wajdeczko wrote:
>> On 28.02.2025 00:59, Daniele Ceraolo Spurio wrote:
>>> On 2/27/2025 3:29 PM, Michal Wajdeczko wrote:
>>>> On 27.02.2025 02:05, Daniele Ceraolo Spurio wrote:
>>>>> The GuC uses the same format for all its KLVs, so having the 
>>>>> functions
>>>>> to set them in a common file will allow us to re-use it for different
>>>>> types of KLVs and not just the WAs in ADS.
>>>>> The next patch will make use of these functions for a new H2G 
>>>>> command.
>>>>>
>>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>>> <daniele.ceraolospurio@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_guc_ads.c         | 89 
>>>>> ++++++-------------------
>>>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 62 +++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  7 ++
>>>>>    3 files changed, 89 insertions(+), 69 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/
>>>>> xe_guc_ads.c
>>>>> index fab259adc380..ed3304a11812 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>> @@ -22,6 +22,7 @@
>>>>>    #include "xe_guc.h"
>>>>>    #include "xe_guc_capture.h"
>>>>>    #include "xe_guc_ct.h"
>>>>> +#include "xe_guc_klv_helpers.h"
>>>>>    #include "xe_hw_engine.h"
>>>>>    #include "xe_lrc.h"
>>>>>    #include "xe_map.h"
>>>>> @@ -283,56 +284,6 @@ static size_t calculate_golden_lrc_size(struct
>>>>> xe_guc_ads *ads)
>>>>>        return total_size;
>>>>>    }
>>>>>    -static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
>>>>> -                      enum xe_guc_klv_ids klv_id,
>>>>> -                      u32 value,
>>>>> -                      u32 *offset, u32 *remain)
>>>>> -{
>>>>> -    u32 size;
>>>>> -    u32 klv_entry[] = {
>>>>> -        /* 16:16 key/length */
>>>>> -        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>>>> -        FIELD_PREP(GUC_KLV_0_LEN, 1),
>>>>> -        value,
>>>>> -        /* 1 dword data */
>>>>> -    };
>>>>> -
>>>>> -    size = sizeof(klv_entry);
>>>>> -
>>>>> -    if (*remain < size) {
>>>>> -        drm_warn(&ads_to_xe(ads)->drm,
>>>>> -             "w/a klv buffer too small to add klv id %d\n", klv_id);
>>>>> -    } else {
>>>>> -        xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>>>>> -                 klv_entry, size);
>>>>> -        *offset += size;
>>>>> -        *remain -= size;
>>>>> -    }
>>>>> -}
>>>>> -
>>>>> -static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>>>>> -                    enum xe_guc_klv_ids klv_id, u32 *offset, u32
>>>>> *remain)
>>>>> -{
>>>>> -    u32 klv_entry[] = {
>>>>> -        /* 16:16 key/length */
>>>>> -        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>>>> -        FIELD_PREP(GUC_KLV_0_LEN, 0),
>>>>> -        /* 0 dwords data */
>>>>> -    };
>>>>> -    u32 size;
>>>>> -
>>>>> -    size = sizeof(klv_entry);
>>>>> -
>>>>> -    if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
>>>>> -               "w/a klv buffer too small to add klv id %d\n", 
>>>>> klv_id))
>>>>> -        return;
>>>>> -
>>>>> -    xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>>>>> -             klv_entry, size);
>>>>> -    *offset += size;
>>>>> -    *remain -= size;
>>>>> -}
>>>>> -
>>>>>    static void guc_waklv_init(struct xe_guc_ads *ads)
>>>>>    {
>>>>>        struct xe_gt *gt = ads_to_gt(ads);
>>>>> @@ -343,22 +294,22 @@ static void guc_waklv_init(struct xe_guc_ads 
>>>>> *ads)
>>>>>        remain = guc_ads_waklv_size(ads);
>>>>>          if (XE_WA(gt, 14019882105))
>>>>> -        guc_waklv_enable_simple(ads,
>>>>> -
>>>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>>>>> -                    &offset, &remain);
>>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>>> +
>>>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>>>>> +                     &offset, &remain);
>>>>>        if (XE_WA(gt, 18024947630))
>>>>> -        guc_waklv_enable_simple(ads,
>>>>> - GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
>>>>> -                    &offset, &remain);
>>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>>> + GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
>>>>> +                     &offset, &remain);
>>>>>        if (XE_WA(gt, 16022287689))
>>>>> -        guc_waklv_enable_simple(ads,
>>>>> -
>>>>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>>>>> -                    &offset, &remain);
>>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>>> +
>>>>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>>>>> +                     &offset, &remain);
>>>>>          if (XE_WA(gt, 14022866841))
>>>>> -        guc_waklv_enable_simple(ads,
>>>>> - GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
>>>>> -                    &offset, &remain);
>>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>>> + GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
>>>>> +                     &offset, &remain);
>>>>>          /*
>>>>>         * On RC6 exit, GuC will write register 0xB04 with the default
>>>>> value provided. As of now,
>>>>> @@ -366,15 +317,15 @@ static void guc_waklv_init(struct xe_guc_ads 
>>>>> *ads)
>>>>>         * future, so GuC depends on KMD to send it the correct value.
>>>>>         */
>>>>>        if (XE_WA(gt, 13011645652))
>>>>> -        guc_waklv_enable_one_word(ads,
>>>>> -
>>>>> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
>>>>> -                      0xC40,
>>>>> -                      &offset, &remain);
>>>>> +        xe_guc_klv_enable_one_word(ads_to_guc(ads), ads_to_map(ads),
>>>>> +
>>>>> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
>>>>> +                       0xC40,
>>>>> +                       &offset, &remain);
>>>>>          if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
>>>>> -        guc_waklv_enable_simple(ads,
>>>>> -
>>>>> GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>>>>> -                    &offset, &remain);
>>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>>> +
>>>>> GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>>>>> +                     &offset, &remain);
>>>>>          size = guc_ads_waklv_size(ads) - remain;
>>>>>        if (!size)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/
>>>>> drm/xe/xe_guc_klv_helpers.c
>>>>> index 146a6eda9e06..50eab2086ee3 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>> @@ -7,8 +7,11 @@
>>>>>    #include <drm/drm_print.h>
>>>>>      #include "abi/guc_klvs_abi.h"
>>>>> +#include "xe_gt_printk.h"
>>>>> +#include "xe_guc.h"
>>>>>    #include "xe_guc_klv_helpers.h"
>>>>>    #include "xe_guc_klv_thresholds_set.h"
>>>>> +#include "xe_map.h"
>>>>>      #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | 
>>>>> (u32)(lo)))
>>>>>    @@ -146,3 +149,62 @@ int xe_guc_klv_count(const u32 *klvs, u32
>>>>> num_dwords)
>>>>>          return num_dwords ? -ENODATA : num_klvs;
>>>>>    }
>>>>> +
>>>>> +static void emit_klv(struct xe_guc *guc, struct iosys_map *map, u32
>>>>> *klv_entry,
>>>>> +             u32 size, u32 *offset, u32 *remain)
>>>> s/klv_entry/klv
>>>>
>>>> s/size/num_dwords
>>>>
>>>> KLVs are always u32 aligned
>>>> 'size/offset/remain' all should be in dwords
>>> That would mean having to convert back and forth between u8 and u32:
>>>
>>> - allocation is in u8 aligned
>>> - params to this function would be u32 aligned
>> but for generic KLV functions it doesn't make sense to pass u8 sizes
>> and we should aim to define function signatures that enforce proper 
>> logic
>>
>>> - xe_map_memcpy_to below needs u8 alignment, so convert back
>>> - the GuC expects a u8 aligned size, so need to convert remain back 
>>> to u8
>> that looks like a mistake done in this action definition, since all
>> initial actions that introduced KLV concept (like UPDATE_VGT_POLICY,
>> UPDATE_VF_CFG) were defined to operate on dwords as size
>
> This is an ADS entry and all ADS blocks are offset/size. The new H2G 
> command (in next patch) is indeed dword aligned, but it still seems 
> simpler to just have a single "offset / 4" that multiple conversions 
> back and forth.
I agree that avoiding multiple conversions is best.

The data itself might be in 32-bit chunks but all the KMD operations are 
in bytes - allocation, memcpy, etc. So adding extra conversions seems 
unnecessary and will just make the code less readable and more error prone.


>
>>
>>> Just using u8 everywhere seems simpler instead of converting back and
>>> forth.
>>>
>>>> this will also match rest of functions in this file
>>>>
>>>>> +{
>>>>> +    if (xe_gt_WARN(guc_to_gt(guc), *remain < size,
>>>> do we need xe_gt_WARN in production?
>>>> maybe xe_gt_assert will suffice?
>>> I've kept this the same as what was in the original function. Not sure
>>> why it was xe_gt_WARN instead of assert.
>>>
>>>>> +               "klv buffer too small to add klv id 0x%04x\n",
>>>> s/klv/KLV
>>>>
>>>>> + FIELD_GET(GUC_KLV_0_KEY, klv_entry[0])))
>>>>> +        return;
>>>>> +
>>>>> +    xe_map_memcpy_to(guc_to_xe(guc), map, *offset, klv_entry, size);
>>>>> +    *offset += size;
>>>>> +    *remain -= size;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * xe_guc_klv_enable_simple - Emits a KLV with no data to an iosys
>>>>> mapped buffer
>>>>> + * @guc: the guc structure
>>>>> + * @map: the iosys_map to write to
>>>>> + * @klv_id: the KLV to enable
>>>> key ? there is no Len nor Value
>>>>
>>>> this will follow other functions in this file
>>> ok, will rename.
>>>
>>>>> + * @offset: pointer to a variable holding the offset to write to
>>>>> + * @remain: pointer to a variable holding the remaining writing
>>>>> space available
>>>>> + *
>>>>> + * The function checks if there is enough space to emit a KLV with
>>>>> no data and
>>>>> + * if so writes it to memory. After the write, the offset and remain
>>>>> variables
>>>>> + * are respectively increased and decreased of the written size to
>>>>> be ready for
>>>>> + * the next emission.
>>>>> + */
>>>>> +void xe_guc_klv_enable_simple(struct xe_guc *guc, struct iosys_map
>>>>> *map,
>>>>> +                  u16 klv_id, u32 *offset, u32 *remain)
>>>>> +{
>>>>> +    u32 klv_entry = PREP_GUC_KLV(klv_id, 0);
>>>>      u32 klv[] = { PREP_GUC_KLV(key, 0) };
>>>>
>>>>      emit(... ARRAY_SIZE(klv)
>>> Why? this function is specifically targeted to writing a single u32, 
>>> why
>>> write it as a u32[1]?
>>>
>>>>> +
>>>>> +    emit_klv(guc, map, &klv_entry, sizeof(klv_entry), offset, 
>>>>> remain);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * xe_guc_klv_enable_one_word - Emits a KLV with 1 DW data to an
>>>>> iosys mapped buffer
>>>>> + * @guc: the guc structure
>>>>> + * @map: the iosys_map to write to
>>>>> + * @klv_id: the KLV to enable
>>>> s/klv_id/key
>>>>
>>>>> + * @value: the data associated with the KLV
>>>>> + * @offset: pointer to a variable holding the offset to write to
>>>>> + * @remain: pointer to a variable holding the remaining writing
>>>>> space available
>>>>> + *
>>>>> + * The function checks if there is enough space to emit a KLV with 1
>>>>> DW data and
>>>>> + * if so writes it to memory. After the write, the offset and remain
>>>>> variables
>>>>> + * are respectively increased and decreased of the written size to
>>>>> be ready for
>>>>> + * the next emission.
>>>>> + */
>>>>> +void xe_guc_klv_enable_one_word(struct xe_guc *guc, struct iosys_map
>>>>> *map,
>>>>> +                u16 klv_id, u32 value, u32 *offset, u32 *remain)
>>>>> +{
>>>>> +    u32 klv_entry[] = {
>>>>> +        PREP_GUC_KLV(klv_id, 1),
>>>>> +        value,
>>>>> +    };
>>>>> +
>>>>> +    emit_klv(guc, map, klv_entry, sizeof(klv_entry), offset, 
>>>>> remain);
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/
>>>>> drm/xe/xe_guc_klv_helpers.h
>>>>> index c676d21c173b..231f7c4b0947 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>>> @@ -10,6 +10,8 @@
>>>>>    #include <linux/types.h>
>>>>>      struct drm_printer;
>>>>> +struct iosys_map;
>>>>> +struct xe_guc;
>>>>>      const char *xe_guc_klv_key_to_string(u16 key);
>>>>>    @@ -61,4 +63,9 @@ int xe_guc_klv_count(const u32 *klvs, u32
>>>>> num_dwords);
>>>>>    #define PREP_GUC_KLV_TAG(TAG) \
>>>>>        PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG), 
>>>>> MAKE_GUC_KLV_LEN(TAG))
>>>>>    +void xe_guc_klv_enable_simple(struct xe_guc *guc, struct 
>>>>> iosys_map
>>>>> *map,
>>>>> +                  u16 klv_id, u32 *offset, u32 *remain);
>>>>> +void xe_guc_klv_enable_one_word(struct xe_guc *guc, struct iosys_map
>>>>> *map,
>>>>> +                u16 klv_id, u32 value, u32 *offset, u32 *remain);
>>>> hmm, "enable" does not fit here, maybe:
>>>>
>>>> xe_guc_klv_emit_empty / no_data / no_value
>>>> xe_guc_klv_emit_dword
>>> emit_nodata should work.
>>>
>>>> and those should be inlines that use:
>>>>
>>>> void xe_guc_klv_emit_simple(
>>>>      struct xe_guc *guc,
>>>>      struct iosys_map *map,
>>>>      u16 key, u16 len, const u32 *klv,
>>>>      u32 *offset, u32 *remain);
>>>>
>>>> like:
>>>>
>>>> inline xe_guc_klv_emit_simple_empty(.. key ..)
>>>> {
>>>>      xe_guc_klv_emit_simple(.. key, 0, NULL, ..);
>>>> }
>>>>
>>>>
>>>> inline xe_guc_klv_emit_simple_dword(.. key, value ..)
>>>> {
>>>>      xe_guc_klv_emit_simple(.. key, 1, &value, ..);
>>>> }
>>> This seems to just make things harder. xe_guc_klv_emit_simple() would
>>> need to handle the case where we have data differently from the case
>>> where we don't, potentially with 2 separate memcpys (one always done 
>>> for
>> this isn't on the hot path so I would prefer avoid code duplication over
>> perf optimization
>
> This isn't about a perf optimization, it is about keeping the code 
> simple. The only duplication is between:
>
> u32 klv_entry = PREP_GUC_KLV(klv_id, 0);
>
> and
>
> u32 klv_entry[] = {
>         PREP_GUC_KLV(klv_id, 1),
>         value,
> };
>
> Which is minimal, but it keeps the common code much simpler as it 
> doesn't have to handle optional parameters.
>
>>
>>> the key and one optional for the data). I really don't see the benefit
>>> when the current approach still makes most of the code common in
>>> emit_klv() and only has separate arrays. Also, that wouldn't be a
>>> "simple" emission anymore since it'd handle all the possible cases, so
>>> the naming also wouldn't fit.
>> but the goal is to have helper function to 'emit KLVs', so the 'simple'
>> here means help in building and emit of the proper KLV-header based on
>> the provided key/len params, followed by emit of value (as dwords)
>
> The "simple" here was in reference to the fact that there was no data, 
> as compared against the emit_dword.
>
>>
>> and while your current case is only KLV with 0 or 1 dword, nothing
>> prevents us from implementing generic helper, and satisfying your need
>> with trivial wrappers for 0/1 case
>
> I'll give it a try and see how it looks, but it really seems like 
> we're over-engineering this by introducing an helper that can handle 
> cases that we don't have.
I agree with Daniele. There is no need to overcomplicate things to 
support use cases that don't exist.

And yes, the 'simple' meant no data. So calling a function 
'simple_dword' is broken and 'simple_empty' is redundant! We could maybe 
drop the 'enable' part if the helpers might be used for other KLV 
purposes at some point. But it would just be 'xe_guc_klv_add_simple' and 
'xe_guc_klv_add_one_word'. If you really thing the use of 'simple' is 
ambiguous or confusing then maybe 'xe_guc_klv_add_empty' instead but 
that sounds odd to me.

John.

>
> Daniele
>
>>
>>> Daniele
>>>
>>>>> +
>>>>>    #endif
>

