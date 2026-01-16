Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FC6D47CA3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 00:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F2910E0B4;
	Fri, 16 Jan 2026 00:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDaTzvZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055B210E0B4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 00:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768523161; x=1800059161;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=EwKuxiUGfzMrJWPEkvdsxkm3yXy6Cs6F+ZEKGsKnDyo=;
 b=UDaTzvZAkJ41OeBqD/uNLJqX3B1f7MnSxEa3MIbNOs+Hsn2yPzibRpo9
 ySCnpuEiyotb175d5r+AQAniPjPRao/6dhUuWVXmFG+ujj/JkrKb51+sv
 OqNBYExS3xlW2IDOH7TmdBqbendUm+5eJnKm4xdOuyv5ybVFZyjw8vI5v
 znrPy+fh1pRqoFDgjDXuMeqwCmEe3TORROwht0R7KQF6hd7oFRwswri9t
 SfVi7dr6WxS6E7mWuOgN/4AmhEoPLVnEGW6NVpAL3mEDn8yorXiN+qzT5
 98UBpwsdJIePj/Qn/+0XxYflT3mHcSPmur5ikCKht8cx7TRtTGJxYsrUO g==;
X-CSE-ConnectionGUID: 2DYynkIvRZWQTanb+QW+bA==
X-CSE-MsgGUID: gy7N+JKuTqi0b1eu+LeFPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69737436"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="69737436"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 16:26:00 -0800
X-CSE-ConnectionGUID: gO9q8JLmQSiCRnv1gAGnqw==
X-CSE-MsgGUID: gsWZUm45TrOY/+TtA8UObQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="209959721"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 16:26:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 16:25:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 16:25:59 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 16:25:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJmSBtuUoywyM9upiqcnBWcMf2fy8wRfSNIiJ52YzWLAUqFhqMgWOz1EqTcZX4kJ+3EAJv6voIIKaNJAaE/LER79bBeLZ2GjRCoxNtHVPaJD8F5Od1qu1PLnz5xKJTlKxLcTYbemEpwRTHT2Defpj7IP4fvUFffymI2qi9En0NG8+qDYsyDGafYL1lc+SoF2bhyZpW33TA7ESnihsSOzJwdkHNoSuqQUBzYfIXwLpPYEeuhXOO58/HbsNLTrF+ckfQomtINJeltDJuKHEtDsJ+jwp0ByS1iRG7l5aLLuTDWlX1XP7fowscNIiLtgzOIGgcNF89cvH2oFiql/OQhdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwKuxiUGfzMrJWPEkvdsxkm3yXy6Cs6F+ZEKGsKnDyo=;
 b=uDJ0s2EQ+k75DO0yWBafJSG8pWKUquZJHF64owW8QxWobRIyX5XpOBYKi6skBPY3aAmZEU7Re0vMjeKnhei1vujedluezpk5jssXxmKMQ0H18ExgY6LinFSpcvIGR7/1YbOfzjE6sngw54pGXkPZ0BVFPhIf4DlWeyWDFjE/S+7dqN1DMG/O0FfCtw4I9c3H9SQiZGqk8WIBIR0+tneHFeNhD267k92/MOHOJR51uNH13f/hWNn2yR75KP8CkYofD8xxZh+qbd7P48teI+cneIs0BB2A+rzp0WF86nlZyD0hs/LBgfDgO0LNwozbNe2wS92Llit4EGtlQh72pP73yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA4PR11MB9204.namprd11.prod.outlook.com (2603:10b6:208:56d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 00:25:57 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 00:25:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v4 00/12] Context based TLB invalidations
Thread-Topic: [PATCH v4 00/12] Context based TLB invalidations
Thread-Index: AQHchDezBBWdmVPbAEGhMKmy+S+9LLVT9OmA
Date: Fri, 16 Jan 2026 00:25:56 +0000
Message-ID: <5f976f6fa03d6e508849593a936281394735af23.camel@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
In-Reply-To: <20260113025232.3504648-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA4PR11MB9204:EE_
x-ms-office365-filtering-correlation-id: 544fafca-079d-4e2c-fc55-08de5495d0ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RUlweUVXeHpMMEhvYU9EZWRDTEpLNldGQzIwbEZtRVNwek1Rb0JGMTVsTHZG?=
 =?utf-8?B?Q1BUem5tYkxnZXZuaEhCdzZpQSt2YzVZUFB1ZmE1WTRkQlhWSVlaa0NBMG1p?=
 =?utf-8?B?aDRxZlBJcGNXT0hhZGg2VEtVc2xqSUpmMFNFM0ZEU2VIT3R2L3F6TVFIRDVU?=
 =?utf-8?B?T0NnWkpzWkRzQ21hdFBUT1hJWkFTamNlTyt5cnYxVXIxaTJ4UlhLdkhzb2oz?=
 =?utf-8?B?UEJLVTN6YU1WcmtQU0Z1SGt3bWdtQ2RRVUNNRXZDc0JtemVmckhPMU0zbnA3?=
 =?utf-8?B?ZGNVSXBtbldySDNmbldHWGora09jU1N3bkF3M0NlYzlkdWRKK0NKejVTZ2w0?=
 =?utf-8?B?MXp2SU9MQVc2QjRnK0RIWjhJNWlJMTUvbnpwODJneFpiQVV6KzJpVHhYZFBI?=
 =?utf-8?B?cHZkaHc5L3BjVEVlTmxNTjBKckNUdmlzRWIrWDdTUnMzZ2xWN0dlS05DaVpL?=
 =?utf-8?B?Z0tML3lTbUU3byt3cFlaTStBbVJJZ01DRFNFekJMYmh5KzdKdWtnYUprdEFa?=
 =?utf-8?B?dWNxUVpnQUlBVjNDLzVIQ2MwS0FMcThuckpGSm5JekRrOXhMNnA4ZlhUNVIx?=
 =?utf-8?B?Y3dYaFNvZzJyZy9MZmhuSGVEbTFMT0laREl4VGhUUFNKcFdvaktlalZVcGdZ?=
 =?utf-8?B?cEtSRkNPSkYxTG1ST1pnb3FUMENQdlZsaWp1K2tjZkF0UmIzQ01lU2FOZ2Rx?=
 =?utf-8?B?WFQrdi9yMUdQZ2Y2eWM4bTl1cnJMUGNJU3NYMzQ4MytGVDlwSmxOMEZTRm8z?=
 =?utf-8?B?b1B4b21xeUZwdmlOa1hGTmtJN29pOThWajZmajRvSGFVQ3MweWhsQUhFOEhs?=
 =?utf-8?B?TmJEOFU3ODl0aVN2MU80SVhEZkxqTmEvOUYreVpGUUVtbXg1empqRlNmc3Zh?=
 =?utf-8?B?V2hFME5EZWd4K0swbE53aGtyeG92NlpsZ3p5UitMSTVMdmpKYmU3SFg2bzll?=
 =?utf-8?B?RHJwZTdnMjZ2eEdCa0w2azJENDBuK3h6ZzlBWHBXNHJCU3k1Nm1iNjNzVXRE?=
 =?utf-8?B?bDJFaVZpSDU4MnlLZ3R6YmtSYktZeUJMWW9hYUpYOWRMRGZudnhGNnZ3UW5G?=
 =?utf-8?B?S2VnMFM5V01ybitWMmRSTE4rZHp0OFpvbTZ4R1Z6WXEwKzlIQVRpblljK0lr?=
 =?utf-8?B?Y1B3RjFRd2hFSjA1R1E1LzJJMVUrTE53V2Z3eUhuZTMwcHRiZUdrTnFOUHFw?=
 =?utf-8?B?Tmt2bUFPNmp6UVJjdU5ReVN3eWJ5L3ZWeGUyNUdrc1d3SU54OTlrcmJlWkRI?=
 =?utf-8?B?cnVjSXEzZDZUZFA1TE9sMXNCV3FLV2RnNGdqLzRhWUdhTkt5QXpmYXRjSXd1?=
 =?utf-8?B?dkFkc3hSeUhyejloZXdUYnZDQmZkeldmZk12a1JUMTFJMnRwb0U0Q1hVTzIw?=
 =?utf-8?B?a0FzODFXTHhSaThqTm53bjRTaGl2Rit2bFpJSEJOQzl2dHM4MlpwZUlmdnJ3?=
 =?utf-8?B?emRaNm9FU0IrUWwrRUxwSXh6RVJtdDExMHN6TXFqa0dRZUg0TER5ZjFnK1Z1?=
 =?utf-8?B?Y3l2czUwMVAxUnExdmNSMGY3VE4vbXhtZXkrY2Q2UGQ1ckh6b3Z5ZGEwUmVY?=
 =?utf-8?B?U1FhM2pPUkNLdlhyVVJrS1FqWmFza3duV0djQXFWdFAxNEhueUR4M29WSjZz?=
 =?utf-8?B?b295U0s5SXlhbEdQZDRNVlFYOEtJN2d3Tk1aaWJ3SzdtZm1qYjErc3ZrUmJK?=
 =?utf-8?B?WWQySmk0VVRCSmRJTG5mQlhZb0xUZmhTSlYvZnVrNTBRSlJreXR2NzlybWJW?=
 =?utf-8?B?RlpRK1UxeDhqOTdmWGUzNVBwcDVWTTh1SzliZzdrVDNVZzdNVGVzQUEzalJQ?=
 =?utf-8?B?c2JtbGUzSUh0cWFZeW5ZVmlDT3pEU3JlelVmVlkvZFRlWjAzbWRQT0JTbU55?=
 =?utf-8?B?dTZvYkZSZWRrbFVSQUZ6RW44clJWaXExV2ZSdU1vTDh3TTdpZk8wamlBOXR0?=
 =?utf-8?B?enAwS1BBRVJOM2NVZzRmWDRTTUZsSnJ0RFNIZzNVZWVmZ1lDNEFtUzVQem5G?=
 =?utf-8?B?V3d0NFZ6K3pzcGw4MEt6MVJvUXEwbWlZcFo5bkJFTkR5dmh2ZmZjQ1VIQm5h?=
 =?utf-8?B?STZ4cnFYeXgvcDdnNXFMVHBOTXY0M2RNLy93bXF5bXNOaWRDWENpZVR6TTFz?=
 =?utf-8?Q?i6c80hAflSGmgE4HzicpBebci?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUlDVVQ5bTNLbkxBSU9OQXRteitNSm9KNENZRTZNZ05odEVWVzZRNmZmeTdi?=
 =?utf-8?B?UWFVM0lnM3ppZzZiRWlORHpiT3FoTFV2NExUU2JzcitvdVlnM3o0cHh3YUZo?=
 =?utf-8?B?TVNJZ2xkbkZkcWFOVWRVQzBYTXFTTFo1bVJ2dTVVOXJRSGk5T2t6REtoaFdr?=
 =?utf-8?B?dzBtaDZPblRXc0dKZ1p3RkNBbVhkd0JiaWVTOWtUa3FydTBFbWRNMHlLdXd6?=
 =?utf-8?B?cmEydmdudDEzQXZtMmdVaWp4aGFCRGdVUXFhZE9rb3dLcGVmd0lpUXdId3gy?=
 =?utf-8?B?U2E0YTN5NlY2OTJKYzlkM0ttUVkxU0s1VGxxUXlRMDVyZlVDSkZ6TmJtYmJ4?=
 =?utf-8?B?anlPV01XeTd2bVVMMFBSQjZsNWxTWHV6bEFFam9qVDZlV3kvL1Y0cWZiRmt1?=
 =?utf-8?B?dk9FSmJ0MVZSV2J4VVBjWGl3VXBBT3Q5MkFVTlprS3UxWHdOd0FQYmlVZ2Zm?=
 =?utf-8?B?Zi8veFZqVHh6TzlQTGEveVVyQ1JqQ2QzSU5XbVp2NTUvU0kyTVp5N2Q2ejdq?=
 =?utf-8?B?Wmx6MGZDdjhvaWE1ZzZid3dqMEIvVmRqNEh4RzR0QksvQ2RtSmQzamoyazBx?=
 =?utf-8?B?RkcrS1RhaVl5Y3BkdlNGYmhRRkxjS1JzZm9zS1dqODFUL2djUk1mRUhJQWFE?=
 =?utf-8?B?Nzlra2pmTHJyeEhZVHlVVSt6VXoyVFMyazFhOFFMY0h4UkJyOU9VTmV3c3hG?=
 =?utf-8?B?eVp2bDhkOElwUkkxTXF6REl3Uk1RM0Z6ZlFGdWtGdGJDQWI3VnYzRXdkYU1p?=
 =?utf-8?B?UzRoSXArZjBDQ0lnc3NkK3VHeEJHLzZueDRhN0NET3ZnaVJLQTN5VDE4WWJC?=
 =?utf-8?B?RzhrRWRJZ2RXVzhkT0hFRVNkT1h2MlEzY1liNDIzQ3J5dDRKeFdMQzJVMzRw?=
 =?utf-8?B?WHZQSWt4dTdSOUphZFNoTTJMVG1CWWZEQUNqM29TN0dUSXRVd0hGWXRNSWlH?=
 =?utf-8?B?UitGcmw0Y2FscjVpSWM5b1NuTGxNZHlTN2dFVWNPUU1SY3VxakpXTGprUXMr?=
 =?utf-8?B?UHZNc0FIcFRrSzhGUWdtRUM2SDBKQklWYXdCR25JV0U2VkVkSU80SzVaOFls?=
 =?utf-8?B?ejVTZWtieWFjNHdiVG5xNnJzd2ZVWWZQU2dyL2lBNkwwQ29lMUpNbjBjd2t2?=
 =?utf-8?B?SVJoZk9RZGpnZFVBK3FJVlFrR0JWL2VaaFVSRm03Y084dGViNnZDM05hNTdO?=
 =?utf-8?B?dDM5TFlReS9pcndmU052bi9hUktkU2pZTkFWNVpMaUVXeEdjWTBGNm5ya2Zp?=
 =?utf-8?B?MGhQUFY5SnFlam81cVQzOW5FVEp1UzVwd09pVUI1MmdpY25JeXRzMW5IdHpn?=
 =?utf-8?B?NHZlT3NmSjNSMExyK3pYeTBxYVVSaTh2TWRGTUpNUUtHdnY0ZisrVmN4RnpU?=
 =?utf-8?B?SU5Qb2NOVHBUbENPczh0eHJDdHZ0TG95LzN4SEZtU3I5b0VjcnFzMXprcy9z?=
 =?utf-8?B?d1ZSbmw1TCt6K3JYWHZST0xzY2FnYng5VVZKZ2hmbUNtTGN0a2gybmg4d2Rn?=
 =?utf-8?B?U0N4RnJVbE1uNFZIVm85ajRMUStGUDNYZnRXcmhyL00vdHM4OURPNys0TDdG?=
 =?utf-8?B?YmRzOWs5SlF1dnF5bUZTWDA1blN6bFhxZGNVSTdMT3dkeG45QTlWTUxTNWo3?=
 =?utf-8?B?dUpTV1cyQmI2NGN6dE92OGVjc09Vc0FXWmFuTlZralZuNUVORXduN1I2OHlt?=
 =?utf-8?B?SjBKcVJOU2FlZGg0aU01UWJnRzZlTVNIL0E3REhVYUQ1RG1ycmxnR1dIRDF6?=
 =?utf-8?B?aUJtRFI0UTVGWnNOWFlCYWhTVUtnVXVjQWhjcmd2M3VLazhDaHkyTVJnbm02?=
 =?utf-8?B?ZklZbGFLWGZIRXp4citYckl5M2ZwZUhnd3R5S0FrYjRtelkyd0FMQTBnaGdH?=
 =?utf-8?B?dEdESGoveXBVaGdPRndLQy9CUmMzd1BhMkZlY2VXR080OXg1ZHNQRWdmb05l?=
 =?utf-8?B?L0FOV2J5YXFBZjVYeDlXMlZ3WlRNeG85WlJCRitiSmR4UkVGQ1ZscEdwYnFt?=
 =?utf-8?B?dVRJVUpLVnVFbHBCSzg5L2hJNXkrbTJhOGJELzIyNW4rVkpUWTh1WmJ0US9o?=
 =?utf-8?B?R3BzM3pKSHlBQ0JwZ0NDTjZRcGNhL2hVRjFXcE9rbkhmc25uWmQrdnRQSFRU?=
 =?utf-8?B?R0NiUTNRWldqajB3dUFOdkZpblRhU05rU0d3MHY4NGFwZUFuUGpoYm9LRzk1?=
 =?utf-8?B?enJzUmlKNkNsZnVNb2VTV3QxUUU3L1pXUTA1WmpFbTcwSkxLOFMwUjJNNE03?=
 =?utf-8?B?L1NnNEFENmYxNWhBZFVGNklMTUg3NmFiSFB1WkdNNG5mZFBZa21DcGxMSmwy?=
 =?utf-8?B?UmpLQy8xQ0tQclJnRkJHd1hZcVhlVDlwajJ0RjZsbnc4SzkwY1RMRVhzalRh?=
 =?utf-8?Q?SIUhQrw3HyWlPufI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A00F6F5DB7AA0B409D60028682D68CBC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544fafca-079d-4e2c-fc55-08de5495d0ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 00:25:56.3101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7bW+U0B6pl+1LoG/B6ayp3cZOKUq6qCKGJtxzfZhOB/THJNI0eGcOheenZXx/mMuHmaXU8Lvm6/8w81pjcDMpmvj9Fi5TnzA9J5GFSKZkXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9204
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

T2sgYXQgbGVhc3QgdG9kYXksIHRoaXMgZGVmaW5pdGVseSBpcyBnb2luZyB0byBuZWVkIHRvIGJl
IGluY2x1ZGVkIHdpdGgNClsxXS4gV2l0aG91dCB0aGF0LCBJJ20gc2VlaW5nIERNQVIgZmF1bHRz
IGFuZCB2YXJpb3VzIG90aGVyIGlzc3Vlcy4gQnV0DQp3aXRoIFsxXSwgSSBoYXZlbid0IHNlZW4g
YW55IGlzc3VlcyB5ZXQgYXJvdW5kIHRoZQ0KcmVnaXN0cmF0aW9uL2RlcmVnaXN0cmF0aW9uLCBz
byBJIHRoaW5rIHRoZSByZWYgY291bnQgbW9kZWwgaGVyZSBpcw0Kc291bmQgKGFzIGRpc2N1c3Nl
ZCBpbmxpbmUgb2YgY291cnNlIGFzIHdlbGwpLg0KDQpTbzoNClRlc3RlZC1ieTogU3R1YXJ0IFN1
bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCg0KVGhlIG9ubHkgY29uY2VybiBJIGhh
dmUgYXQgdGhpcyBwb2ludCBpcyBhcm91bmQgdGhlIHJpbmcgaW52YWxpZGF0aW9ucy4NCk1heWJl
IHdlIGNhbiBkaXNjdXNzIG1vcmUgaW4gdGhhdCByZXZpZXcsIGJ1dCBJJ20gYSBsaXR0bGUgaGVz
c2l0YW50IHRvDQpwdXQgYSBmdWxsIFItQiBvbiB0aGlzIHNlcmllcyB1bmxlc3Mgd2UgYWxzbyBp
bmNsdWRlIHRoYXQgb3RoZXIgb25lIG9yDQpmaXhlcyB0aGF0IHlvdSBoYWQgc3VnZ2VzdGVkICh3
aGljaCBuZWVkcyBtb3JlIGRlYnVnIHN0aWxsKS4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNClsxXTog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNjAwNTcvDQoNCk9uIE1v
biwgMjAyNi0wMS0xMiBhdCAxODo1MiAtMDgwMCwgTWF0dGhldyBCcm9zdCB3cm90ZToNCj4gQWRk
IHN1cHBvcnQgZm9yIGNvbnRleHQgYmFzZWQgVExCIGludmFsaWRhdGlvbnMuDQo+IA0KPiBNYXR0
DQo+IA0KPiBNYXR0aGV3IEJyb3N0ICgxMik6DQo+IMKgIGRybS94ZTogQWRkIG5vcm1hbGl6ZV9p
bnZhbGlkYXRpb25fcmFuZ2UNCj4gwqAgZHJtL3hlOiBNYWtlIHVzbS5hc2lkX3RvX3ZtIGFsbG9j
YXRpb24gdXNlIEdGUF9OT1dBSVQNCj4gwqAgZHJtL3hlOiBBZGQgaGFzX2N0eF90bGJfaW52YWwg
dG8gZGV2aWNlIGluZm8NCj4gwqAgZHJtL3hlOiBBZGQgeGVfZGV2aWNlX2FzaWRfdG9fdm0gaGVs
cGVyDQo+IMKgIGRybS94ZTogQWRkIHZtIHRvIGV4ZWMgcXVldWVzIGFzc29jaWF0aW9uDQo+IMKg
IGRybS94ZTogVGFpbnQgVExCIGludmFsaWRhdGlvbiBzZXFubyBsb2NrIHdpdGggR0ZQX0tFUk5F
TA0KPiDCoCBkcm0veGU6IFJlbmFtZSBzZW5kX3RsYl9pbnZhbF9wcGd0dCB0byBzZW5kX3RsYl9p
bnZhbF9hc2lkX3BwZ3R0DQo+IMKgIGRybS94ZTogQWRkIHNlbmRfdGxiX2ludmFsX3BwZ3R0IGhl
bHBlcg0KPiDCoCBkcm0veGU6IEFkZCB4ZV90bGJfaW52YWxfaWRsZSBoZWxwZXINCj4gwqAgZHJt
L3hlOiBBZGQgZXhlYyBxdWV1ZSBhY3RpdmUgdmZ1bmMNCj4gwqAgZHJtL3hlOiBBZGQgY29udGV4
dC1iYXNlZCBpbnZhbGlkYXRpb24gdG8gR3VDIFRMQiBpbnZhbGlkYXRpb24NCj4gYmFja2VuZA0K
PiDCoCBkcm0veGU6IEVuYWJsZSBjb250ZXh0IFRMQiBpbnZhbGlkYXRpb25zIGZvciBDSQ0KPiAN
Cj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMjUgKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5owqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDExICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBl
cy5owqDCoMKgwqAgfMKgwqAgOSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVl
dWUuY8KgwqDCoMKgwqDCoCB8wqDCoCA3ICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4
ZWNfcXVldWVfdHlwZXMuaCB8wqDCoCA1ICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhl
Y2xpc3QuY8KgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19zdWJtaXQuY8KgwqDCoMKgwqDCoCB8wqDCoCA2ICsNCj4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jwqDCoMKgIHwgMjM4ICsrKysrKysrKysrKysrKysrKy0t
LQ0KPiAtLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgIDIgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlwZXMu
aMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJf
aW52YWwuY8KgwqDCoMKgwqDCoMKgIHzCoCAzMyArKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3RsYl9pbnZhbC5owqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2NCArKysrKy0N
Cj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgMyArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5cGVzLmjCoMKgwqDC
oMKgwqDCoMKgIHzCoCAxNiArKw0KPiDCoDE1IGZpbGVzIGNoYW5nZWQsIDM3NSBpbnNlcnRpb25z
KCspLCA1NCBkZWxldGlvbnMoLSkNCj4gDQoNCg==
