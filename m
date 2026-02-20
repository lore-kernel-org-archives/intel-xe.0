Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5499C5B55D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 20:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D74C10E839;
	Fri, 20 Feb 2026 20:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezvNeLPi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F67D10E839
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 20:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771620046; x=1803156046;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4AnAZLkj1CfwUDXzOE7q+pDieup1LnqSwKkY+WEmuhY=;
 b=ezvNeLPiIkeAex0GdHiBBU+H/ydqWabABqN9cXV5X/R2T59aovYPsEqV
 sK88oRwe1vQ9zfuqU52AhEU3ATZa/INsq9tMeHYL7S9gRalb4yrEcO9jA
 8UGzy/X2x428UMzP3wKmL4aNPc/mdEfR+USOkTMDGMeB4YLm1ju2FArTk
 oFGD3WYUrM2YMFw8jTSOqHKhYmF96fM9vj9JIr/Jk+hDjKUhr4+3zaFrT
 htW7ZVrBOqP6SOKV5CACDCBxIr/TfMOVjD3QPLDSymFQM4aBFpo+Sy462
 pKbzfjtX2q4GteXU6lT5XlNO8saNvXXoHq8owdaMaZYF0MON8DWkbQ4J6 w==;
X-CSE-ConnectionGUID: bL6uuwdOSwaZkjp25GGmQA==
X-CSE-MsgGUID: X0yGDm60SDWaB0rR/MFbKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76330961"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="76330961"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:40:45 -0800
X-CSE-ConnectionGUID: ya/pcsG7TT+gJPSaIGL8Gw==
X-CSE-MsgGUID: 54+SbU6BR1SexdKqrDsMpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="245541560"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:40:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 12:40:44 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 12:40:44 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 12:40:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8xLPwNsHwRzJC1epWR+B4y+TSGtsLhVer9/rmTi9P8F/EfU1adryKFkkvCQGqov5ipJECjEzg7bIMXqnKoHOrbuf+uG4SFe4ffEwKBdf/Y83RJU8ZlMjhY2CXD8dfsePX2l6NF9UosDtGdHMhRbO2X0sE8cPnS9llJ5aMXRHWfB1BLjpxA9Yqa/Wu9xET05q2S215mWT6PN9wvr1XeegIngzZgeRjOD/l0i7KPxdvwiXgnap6lMlfaQCmXFvto9rLcma8OEzUObBs6k5PE0dpNe6v2ROvr9WSHoX5/E/8TnrzGSSPoKC+PSDP8dyoErOCAU88557yDTZWfjrgGcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lL4DuL2xUszOlANV+jGKNIhw5BPhEewQouOVlHfMHQ4=;
 b=LXxAqohs1dUfqpXG37GHoh8222++X2ffGa4Jq4hNnYO2Y7peRE2e8bMH1sBT2kozhq81u+nR+e75DNdvfmYzzNOUf3TmocjS0Jdxx/DEtUE3kRM1D3Ca95hVS1wWDEcgIOUD6VoitKiB4er3EJdR4ztU9HoEY0803Z8HjZ/c7jtCPTfR84/I6QcrHWPfYbNorJ4cxIRzLZKUD4U51rMxprCHYxKZZorA6cfDgDrcraV8BDKilIJztiWp/Sx5O4T1ERV8NYPk1Jqu+MFBpFlfj/NjdH6tMDTd4Z2OL2eCphCQcsX2iOKv/FIEq0hSMoMTFXA/g71TMmbTtCcExX/VeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA0PR11MB4752.namprd11.prod.outlook.com (2603:10b6:806:99::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 20:40:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 20:40:41 +0000
Message-ID: <346779f5-1a18-47d2-8cfb-8f80eb9fe98b@intel.com>
Date: Fri, 20 Feb 2026 21:40:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] drm/xe/uc: Drop xe_guc_sanitize in favor of
 managed cleanup
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260219180701.2418453-1-zhanjun.dong@intel.com>
 <20260219180701.2418453-7-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260219180701.2418453-7-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0216.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::37) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA0PR11MB4752:EE_
X-MS-Office365-Filtering-Correlation-Id: 10313c4a-b4df-48a1-51fc-08de70c05057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmF2dmRLK1RGd3N4RU51TFZHRWVMdXhlamVubXVXS0Nqa3c4eVBwTUo0OHlB?=
 =?utf-8?B?T1paUHJ5M215QTQybUV1RlZaN05GVXFmRG1OV3NBV2xEKzVMckVxdnVLWkVr?=
 =?utf-8?B?SnF1ck9zUEo3RGFSMlNBdkVVbEtWYUFseVNIMjFJVVNyV2RQS3JaaXV5bnQr?=
 =?utf-8?B?VFp5QnA4WDVUdEFPaGY3WWFDSHJXaUJ4bWlvd3dheUZHQjVYSjZySFd3QjlX?=
 =?utf-8?B?dmFvMVNMU0F4UVNLRTdGOUdTNjdYdWE4MWZpWExtYTh4QnlacG5BVTdYRmJT?=
 =?utf-8?B?RW02ZCsrMWlVbXhMQ0NSM1dsN0FRZXYzcG5FTERDK3YwbGdWNnJBNnJUQmMy?=
 =?utf-8?B?QUlETUhFSWRub3VtQUJJQzdGemJ1bFdLbHJvYjF2L3drdmFYNytrTWVSdnhl?=
 =?utf-8?B?elBrUHAvRGVkWkxsYmJUYmRsVWc0akFTK1BlOXVQY3JJZGVIVSs4amFhMExa?=
 =?utf-8?B?bjFoSjI4L2dQdHE0ams0U1NaY05EaW41VzJDcldJbnFqVThGYXNOMWNoUVd0?=
 =?utf-8?B?ZVpndy9QODRoVytueXc5V3lIenk4L2pCaVVHQnpwUHFIc25VYkYwRDl5cmoz?=
 =?utf-8?B?QVl0MEQrVGplSU9IcDQ3SnJHeTAwODNVNWJ3SEEzRGFDMnprRUViMTZZWE4y?=
 =?utf-8?B?RzM4cFJJOHlJT3daRXR3TVB6RHpqR0lBOGFIbkNNdWFLUnE5TWFSaVdybXlB?=
 =?utf-8?B?ekduS2hlZUdISEZmd200Rk1yc085U004ejRPa3VsVTB1b1pLSWxsZVJnejNi?=
 =?utf-8?B?V3VjdXM2NTV2T0VwdUV3RjNwVlpkWWxqVVcrQ0xhWGJ5NmFxUzhBdERIZUFz?=
 =?utf-8?B?QThSaFJ4YzJwQk9oSFZEOHNwYU01Vk1sRXQ4dDZMQm1FQkhXY0FWOFByTElp?=
 =?utf-8?B?OGluWDBCZmNNb00rU2FMb1NKRUM2a0hoWStaVWxjOTJCY3dJZmxvZ29ueTcy?=
 =?utf-8?B?TFRaWEIzSHgreG4xVlVlMXlnREZqbkF5OCtXOFRnVUJBUU14Q1RLY3hYeU9E?=
 =?utf-8?B?MWlKMlFOcEZ0N1lSVWNyZmlTb1FKQjJRZFhidWZGMlFpRHZrNjlKRE1Ta0do?=
 =?utf-8?B?Um5lZ2gzOXdnYy9PaTdKYmttL1JSMGUrVFNoVm13ZXIvYzRSMnU1RU1LOG5E?=
 =?utf-8?B?VVk4YzNKNzVoRnRpbnhJR2hMWFFwcXR6U0dJUmgvVkkySGEycml0SXB6QmV2?=
 =?utf-8?B?RUladGVzOVNnMThCNUJPQ1UzSVJCaGZDUjVpaGFJOHFhMXFBWnoyRlI4TGEz?=
 =?utf-8?B?U3BkcFQrUU9QZng5MXptdDlYem1wNEVDWUtWYk92ZUwvOS9QYTdTcHBpZnAy?=
 =?utf-8?B?RVFXS2gvTFVxandtVXFkeUhmL2Z1U3MvdDhpeHJrZTZxOCtBZ0NPK3RmVGRI?=
 =?utf-8?B?ajM1eDdxK0pGSXBWRmlSQzluVGxMei9uNkFoaDQ1Q0VsQUJ6SjhORU90MmI1?=
 =?utf-8?B?d1ZUZHhxME50dlpsTG9meGlra1hUTEFFcS9OcE51MURiZmdPaGNlZi9vOHhH?=
 =?utf-8?B?R0JpWmtKakhEejVuZHUwWmExMDlmd080ZDN2UWVMVXNUUE9UcEoxS1ZMNWtk?=
 =?utf-8?B?OGVVU2hGaHZ1aFhaMGZYMFlGeTFCRURkNXlPVDZsenFuRTFXYXFaUkpyMm9t?=
 =?utf-8?B?YWEwU1pTQ0JzeHhnNktFRHpuY2trd21vRFRUQlVETG01WlNWWVRUWUlFWlBO?=
 =?utf-8?B?SGI1UlNGcStiSm1tVDErQ0hzRllXL0VUNmNNZDdyK2lObXZZWHMxeGo3d21z?=
 =?utf-8?B?K3QzZ2FxZitmcnNvTVZ5YTRoNTlQVjMrdWdPQ3VDL2pGdU5CbWV6WDJ2VHZZ?=
 =?utf-8?B?d0JoWGp1aU1IbjhSNFdhUXljRlJFaWYxL0hwWGVRamlzeE45M0NtanNKY2tF?=
 =?utf-8?B?RkNZRC9UaDViSGZvL2p5YXp0SitqTGFBa1hyelovU1hobDAyZ0JVSkF4emdW?=
 =?utf-8?B?dVJBZm0wUDEwN3VrOURqTVhFdXhYWnlXTlVkbHBmaUF5WnQrTXA5K2FKQlpQ?=
 =?utf-8?B?VlIvYXcvQ2U2Y3MyS0lQdUJDektzdE1DZXZzVXZ6akVlNTFjYnhjMU5SZHA1?=
 =?utf-8?B?b1NkNWJyVWpYSjl1VVhKTGRWNWNoQzNOemFPeXlmT0J3MEFpREVFc3VLQS9J?=
 =?utf-8?Q?eIdA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGNOUHhZcitGVDV0TkZzbGhQS2Q3T0thMUExbkJnMkUyMjEvdFczTUprUlpQ?=
 =?utf-8?B?ZjgwV3FvTjRKNTdlbnJmdUtueFZEQ1B4QXBOR3BWYUlhSmJ2S1ozWjRPcE84?=
 =?utf-8?B?c2ZDMjhDQ2lUN21RRnNldkJCUkx1anBaelVhSmZENVNTcnIwMzFKbkliSERS?=
 =?utf-8?B?TmpBa0VXZGJWdzJmQTVNK3BtQ3BtVm1tWFcxUEhGOTduNzlkR3pOeXNsN3FH?=
 =?utf-8?B?NE9ZZXN0YlZiUmdLd241R0xqWXY3K0JpcjU2dWlocFZKeVF4aFRsdnphNS9t?=
 =?utf-8?B?M1JBb1hyZkpyeVI3Y3JJcW9lY1Q1dzRsLzZuMEJyNmozRnU4YWllT3l4Yjhh?=
 =?utf-8?B?UkttRjYvWnBKUTFmTlUreTZiZGhTaThjM0NISDlaSTN5TmkwRWFkRzVFZUF2?=
 =?utf-8?B?OXcvcUEyR1F5YkVlUXJjaGRJdjgrUTlLM0tZdEwyWkEzSXIxUHptRDd0b2ln?=
 =?utf-8?B?NEZqcmRHVXlUNnZBcnFBS2lSbnZzM3NuckhpTDl5c290S2JDVnMzbStWMmd1?=
 =?utf-8?B?T0grY0JDVFl2QXFGa0JzQ1UreHRCUVRQSmFXTVROWWFpMHRRTG9Pb0l6ZXJi?=
 =?utf-8?B?U2RHY2RYQnJ0U2Jwb05wYUtrYVppdWdjeExOUU42Vm56dWlSeDVTMG5CeU5O?=
 =?utf-8?B?NVJHdWxFK253UWtkRXFHR3hrbUxtL2c2a0NWdjhRNFhuWWhhb1FYcWVnd2t1?=
 =?utf-8?B?QVBWYlZVdkxHbXVBNnEwUXhHdnNxWDVRL3gxU3lCbmtLN2VHLzYvMzlITVNm?=
 =?utf-8?B?OU9PTXRBOVFjU0RYVEh6enI2WHZFVU8zN3hieW1HRDRnc1NzZ25tZWZPZ1pn?=
 =?utf-8?B?U3BNZ0lvYjBZckxnNmxIanVBbzlZZSs4YzhXTXVYbUtQczJ6Y1IzNWR4cHkx?=
 =?utf-8?B?T3Vycis1OGpoNndvaEhUZW93N09DY0F0Skh2SUdYZkNGbnpyUjZZSkpZMURr?=
 =?utf-8?B?WmF0NGIyZEtNZVFlMEJES0JqSjlhNEFzYTJNWjNCUjBqaGVkTUVSZksxNFoz?=
 =?utf-8?B?OEt1NU5idHdkdEFHSHMwcnN5MHNWa0JXWnI3K1ZZUEhNUDhJMC84N2RrQ3o5?=
 =?utf-8?B?QktDdkNEZnhnNGl2bWFUOThEcU8xOG16R2NHOHVnUnIxWjMzbnNFOElCVnhw?=
 =?utf-8?B?MW5mcmJQSWdrMWxiM0oxbDIzd3N1aXlqOE1hZUdEYXNWa1JCWCtvZ1RsOVI1?=
 =?utf-8?B?TUw5a1FkT0VlRDNORWZVQzZVdjJVVEI4N2U4akFrTE1EdjJxZ09SdU1tSDE0?=
 =?utf-8?B?bXZjRngzTWh2dktmTndPNlFUUVdUbmlLczJ0QVVtZnpOOU5UcnVoNFo5Q2l0?=
 =?utf-8?B?d2VwVzRYZU9ETE5nTXYvSjFIaWxVeWE3K0gzNXVoNjg1MTJkOFVpcGJiU0s5?=
 =?utf-8?B?V01UdjZQTk1zK0s2cWlzRUVHTEZGY0swMGVqU0psMUZHcWtONzhRS3YrTnpP?=
 =?utf-8?B?amRuS0dITHFYQjRERGFkZ0RDTW9NRlZBSDhEUGszbHB3ay9LNjFQQW12ejBz?=
 =?utf-8?B?U3o1ZjAvY0pGYjNzbUZmWHByNWwwR0h0NkxSMzc1R25yTTdMUUtnUWpJZnZP?=
 =?utf-8?B?TkFLUUg4WmFZSTlyRTV1WGFjNEc3V1NrMktjUFVLSVlORlRWbzIwZzBmeXRr?=
 =?utf-8?B?RloxRHR5elA2bjV1bXUyaTF6VkxUbDhMTVdCMEI0ci80QSsranZCeVVWTjBN?=
 =?utf-8?B?dU5rdCtITHVQRHdTYWdtVkQ0OERtbVYzb0pIS280d295TExSNXpXZy9LSlBu?=
 =?utf-8?B?UFNlSGw2aGJtMFc4aFg0NnNXY21pdnhsbHdIc1Y1bjZOWjZCM21oN09oT1ZU?=
 =?utf-8?B?NTJCMnVWdzJrZWozNWlvYlJqd3doK0hub0U2eTVrNDBqU00zQUk1elVDeEZT?=
 =?utf-8?B?a08vZHZHSHo5SCtDQm5aL01TR08xZWxybVd4VFJaYlIreHAzUEFrN0g1UXdH?=
 =?utf-8?B?U09JQzlxY1NKNWllSEZXUUxaNWpwR09GS2V6T2gyMUN0NG1UZTZBeDlZUUhH?=
 =?utf-8?B?djlFS0pvT3NyVWZ1R09WTDFYTllteUJmQ1c4NlRiTGpsNUZTMGJIOU5UVHpD?=
 =?utf-8?B?VEVXZHJ3MmFPdzBIU2N4RG1GbnlwQzBhVHQvRXZZMmtwdTRjZlZ0TmxqS1RT?=
 =?utf-8?B?bStlWm1xOGpqSnk4cURwa0hTMDZReEtZVFpzNGNYaFg5LzZxMHR5UW5HUS9F?=
 =?utf-8?B?VGlsYWJ6ajJlcVZNQjRBMUFEcjVpRDVNampjMmNRVG9qMFhKYkJqR1M5S1Vm?=
 =?utf-8?B?eHJuYVlKMlBYakJaOHh4RWdJQ0NPbkdBNUJuL2lWNWVtMWdOQWxxRXRFbDFz?=
 =?utf-8?B?TVNES3E0emg4ZUZUeStEYU9QSGE2T0xhVzYwQWJiY0IrWHI3SU5KWE1yTnBz?=
 =?utf-8?Q?IlatROKxxrsFudXo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10313c4a-b4df-48a1-51fc-08de70c05057
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 20:40:41.8554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoF2jFrI3Wk+LFYDC5Gq4zKhwcEnxXFdlBdG19tZjdi9u6gZpjIOSq9OyYtkwx204RYMsvIFREoQnBLeYXeCDV8rXrYdKh8UO50RE62l9+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4752
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



On 2/19/2026 7:07 PM, Zhanjun Dong wrote:
> If the firmware fails to load in GT resets the device is wedged also
> initiating a GuC state cleanup.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index d9aa845a308d..9db656b95bff 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -172,7 +172,6 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>  	return 0;
>  
>  err_out:
> -	xe_guc_sanitize(&uc->guc);

as jump to this label is now a NOP, maybe we should just convert all goto's to immediate return's ?

>  	return err;
>  }
>  
> @@ -234,7 +233,6 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	return 0;
>  
>  err_out:
> -	xe_guc_sanitize(&uc->guc);

ditto

>  	return ret;
>  }
>  

