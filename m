Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99355EE01FB
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 01:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C6810E832;
	Wed, 11 Sep 2024 01:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oe0oi0Xa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41C210E832
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 01:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726017318; x=1757553318;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qrtja1C1+t0upcuAwJWA9IPmPGrdp+BCnia7BfQ0zBo=;
 b=Oe0oi0XaMuKwlw1pP55yhuNsQJd09kOIfvOI3LDPjTP2G8oGyYa9Q7Yr
 cETPBdc8Ea+JECsoBiKKR2qlILHYUcqyBpkKqbUhWcFJMz54bGEfuBNjJ
 w7u7Purf+isApexTbclJX/nlzn3eoIRAZHIkrir+xzFb5B1hHQLHSVs/z
 WdUS82JbtKiIifcvSu3R1WZileLcPNyJ9VSYQXjy8VcldY4XJR81xBPwe
 efR4WcbqphvxFUhTA2S8E3cm9k/fymIToVCUCyj7awPApiHHjGhwJQq+I
 e4YwWbdTz+lnAcHtnxF0v/5E0DBEJVvutsDAHZgnCDBPgnMJXjbfHKt+6 w==;
X-CSE-ConnectionGUID: pp2XIrpQQqm1pdZ78pYV6g==
X-CSE-MsgGUID: 0skBqSCVR5iaG5lbAtIXhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24670808"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24670808"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 18:15:17 -0700
X-CSE-ConnectionGUID: WcFaR41uR02iYz9vKyz6bQ==
X-CSE-MsgGUID: 80mUisCZQiOjeCbEeH1Chw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="90487626"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 18:15:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 18:15:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 18:15:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 18:15:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 18:15:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0a84KgMPL1VM0GIq3SA6jg4O/kbE5L9hW6RgxCjpjX+BRA0TM73NSHDOxq1fi8wrKIiOBAs1bpeKVxL3UQxGyt3y/rCHH4v8XG2ycjn6aHlPNr3dWP9+a4ffeLSxjy2ZRi2Nc2507ZK35yO/8T3AQC5FruPMN6ZSBKIHQ42TGOOdUzmttTWegFrhu3NOj9jIFgVTvK+HCrDJbM5qgcCEQV6O+sXHerznSJq/Efkd2ApCl27mLUbUsm6Fg7HBxHDSHBLOqn4y4N0w5j9bcVU3g95eOv89QKQX8ERtck6yBrPwBRkxND9NLZSaSw415GdAm/mZfR5rXkJ851Isb0eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDu2D9yJ+D7AKoi+mRKxWaUqsalpEvo1UECM/r9H3R4=;
 b=ymVJCrWrl4Q76yUN5cwPU18qFhyeQLbVabDme/1n5Z54lc0P5r/dK1gVAJLhx650kBuN7EKAchvsAIYG8lZ/F6jqF6gqPbWiS20vcxl/J0G9EzLGJzZF/vPwjcRnXH2HsdozZ5LBmRturWBXhnS86rycQ/IpMY0u/1jGyJTwPOhNigzrSXAFjMI7RrSwJ+fQgTSlBmkBUUQRnxxxfrvIYqT0cUPAJlsx3O7/b/+Ep+V474OwFkdn9ysJ46dJmvcJfLYZfDRPri5i3M1rL1EFVwqaip9kOg+a+RMhXtmLdpB+xa7TJmxwL6OJb3HEWsn8uTV1SAz/8MpX7aUm31geWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH0PR11MB5282.namprd11.prod.outlook.com (2603:10b6:610:bd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 01:15:03 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 01:15:03 +0000
Message-ID: <3f534f7c-c898-4899-b4e7-75e6463435ed@intel.com>
Date: Tue, 10 Sep 2024 18:14:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] drm/xe/guc: Use a two stage dump for GuC logs
 and add more info
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-6-John.C.Harrison@Intel.com>
 <ae8a8bf4-04e4-43fb-b850-c63574990fb9@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ae8a8bf4-04e4-43fb-b850-c63574990fb9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH0PR11MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b096dbc-d74d-4cca-df52-08dcd1ff2a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjR1RFFkUERyTmlrVjFEUGE4SEUrV1V5N0xtS0tGQlF3U3RaY3R1STNoK010?=
 =?utf-8?B?QnVTOWlyaUx2aFd4UXdvaVRwd1d6VSswTFFaa29jaU0vdmNHc3FrbVU2VFpJ?=
 =?utf-8?B?eHhZb3ZoMzdyNEQyT0p0VmcyODNXdy9mWS9YWWMzWTl2cHI1MWcrNDFNQ2NM?=
 =?utf-8?B?SFZiN2tHRlVRWkJhZ1lDY3M4clVUYklaaHh6aTZsNnloYmo3S2tEcW90TS8z?=
 =?utf-8?B?eGsvbTdNR3BnNzl5MXEraHZvYTFLRzBtcHBHcXdwc2trT2JFK1RJczlUTWV2?=
 =?utf-8?B?K3lSVWZIUE8yRk1EdHBBSzN5OWRrbFhoQXh4K2RqblVSZE1QazBnZStIVlZu?=
 =?utf-8?B?OVQwdmw5UXhWcDgrMkhFMDRPekNzQnJ3cnJ6S0taWmlxcWNqRnAvdVBtZnZ1?=
 =?utf-8?B?YlBKN2tVaVNqN0o3eEtHVzVIeTJKUUVNNGxNM0MzQkVyVkU0dEU5NFV2TWlT?=
 =?utf-8?B?KzNlMkRyUHZpK1FrN0xlQncyK3VCemkzMk90cEhqS29RY2JZQVJtMWZiTDFi?=
 =?utf-8?B?YWE3TEt3cGxURmZUQkNIQ3hVdUwrTjgxdm1jRWRrUXhMRFRZVEN0aXVQekk2?=
 =?utf-8?B?d1VVUEN5SlZKZ3hLSkc1b0JVd0FITlhNcGU2UzVPR05wVVJ5OVMzWFEycFA2?=
 =?utf-8?B?MWFLWFMyMytISTNja0V2OEhrUCtHM2VUOVJtenRBK3c4Zm4xREgvTnJGSG9U?=
 =?utf-8?B?eVJML1NSamNLdzN4ZUdrZkJkaDZKU0ROeGcvZzhnTThjVEZVY2kya1BGOWdj?=
 =?utf-8?B?bDRXRVVwOGNxQ2lFMEVVZzgzRitPaWpadmc3RkJQVHYvV2tkTlN6R0ZyS2xI?=
 =?utf-8?B?d1pZRDFPclVXbERsSmlPRk96bGtrTzJBcjJNdEUzb0xIWkNndVZDSXdlNUds?=
 =?utf-8?B?alhSYlBRZGdidEVpNWhTRXROMmZzNll2amtxVU53OEJlc3hVcWszL21WZDFO?=
 =?utf-8?B?eW0vTlROdm5SbzNEaWdza3FZWGFFMmpOei9aT25UQVlqWFUzbWlqZzRpa0dy?=
 =?utf-8?B?WlBVc0JPOThBM2FnbDR6YXJkSUlMRXNTR0ZNNElKYm9OaUhmemx2eDRkUGho?=
 =?utf-8?B?d2d0WmNDckZHZC9LNUxFdW4vYng1c2duNm5lV1lBVU40MGlpTmxMd0FtSlBH?=
 =?utf-8?B?YWxpbkdiRTJPQUtwOG12UHZrdUVFT2dnbjRwdUlaNlRBdjNjYUtXRDFRcEts?=
 =?utf-8?B?VVl2Y3NibFhJeVhucG9NdzE0Tm41Y2IrNWtBTGw5RUd5bVM0WHFqYXJOL3U1?=
 =?utf-8?B?Ykw0bTdkaDN5ZmxPbG9aM1k5eTloQ0pXWmljeUhKUjllbFhQWmhza3FyWEpL?=
 =?utf-8?B?eFA4VjhlbWhHOXZITzJMSHZHWXVqblRLa2FmNGdhUUhqWmY5My80WTRaaG9P?=
 =?utf-8?B?bW1HM1NFZ21Kd0ZiQ2IxcC9iNU11OUpWMVJ6UUtVbHNaclFqc3MyTzdFNnli?=
 =?utf-8?B?Nm5NREVLSGxYSVk1azJBS3AxM1RQbm9RcENZakI1SWFXUHlFZjZvQmxhcUV2?=
 =?utf-8?B?M1gvQmxlWHp5R01JaU5FRlh3a0VsTmhRdlluTGJhYmdINFJsOWszQ0lFT2Jp?=
 =?utf-8?B?ZVQwSGNqUHRlT1ZlbDd6V293b1h4S2FwZmcwUTRtNTJvalhoNWVDbjRFZ3JW?=
 =?utf-8?B?Z2tPbmE5M1JLRWpDeStoZW03ZmxnaUlRQjRQTlhhWjFVdTZhRHREMjZnelBZ?=
 =?utf-8?B?dS9OKzdKTXdpbEJLN09Va09MRGpBSlhsMmZJQUhFdGlzQlhMbEswdUtBRmtM?=
 =?utf-8?B?TFFIS1pCN3g2MllDR2dEMEd6NmlVRzNXQVZjT0JxeG1qRlZNcm1tbEFSNHo4?=
 =?utf-8?B?VHZyeVRrSzBZNDNXYjVGUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUpnRS9IOEJZMzhndU9WVUlLZG94UDlnRkUyc09kdEtKWHEycWN0RWd0RW9o?=
 =?utf-8?B?aUtPdGlCcThoN05IOEJHNWpjU0ZBSGJNQTRhWHhBU1NQaUVDa0JrZGVqSkpU?=
 =?utf-8?B?VmpXMHNveGtKRlN0VEV4dFVYeWZDRGhhQm9BMFJnb2NDZmZnRkg1dE40SzRn?=
 =?utf-8?B?UTBZRUdlSytpeFZSNjBVajVOOW16NVlWZXdqSGZ4N0tDVDVTaU5CR3FBVFh3?=
 =?utf-8?B?dmNkd1V3Q3R1RlRFUGRoeFpTVEtVS1lOaW1TU3o1R3VyQmNOM0Y0cmpnQUVE?=
 =?utf-8?B?VlVSUDNLQjNQS2w4Y3ZpU2xSYW1lOCttSGxCd0Y0NzNjSmdyeDlhWlBUN1JZ?=
 =?utf-8?B?NzNqR2dPOFcwY05vNWdXdFQwU1UvZnFqNmJRZjZWT2dxdng3YWxkM0MzN3dk?=
 =?utf-8?B?eWdUTjZrQUQ2b0dqakZlK1VEckxTZXh4Q0ZrVGJvWUswRE0rS0phTW1DeU53?=
 =?utf-8?B?L2FQSTdmZVFCUDVDY08xU3B0TFBQbXBSZXY0Yjc3RFY4R3h2elZDVHNNYWlR?=
 =?utf-8?B?MFJVU25DSkIzNDJ0ZkJvNEVLVFNaTVpKMWhvaFVVWUc4Y3hvQVRpSDQrcGFm?=
 =?utf-8?B?TEZtUlZuL1FFYU4wYXBTeW5uK2IvcXlPeHVCR1hZUk1IaWlqdVIyUlp2Wm5p?=
 =?utf-8?B?NXBDWG9SdnNEYUpHcllsUGV3VVIrWEwydmZaS3BrUXlUR1RiN3hXeTNkU2Nl?=
 =?utf-8?B?SnpOcTA2NXRvM3V3azgzM0JqTVpZRU5WUmZRR0FaTzEzR0xkME55WmQvcU04?=
 =?utf-8?B?cE0wd1I2bE9PUmhxWTRYKyt6UmJKcEdRSnBpb2JvRm4wVTBMRWgyYzA5ZEQy?=
 =?utf-8?B?MHV3L2FtU3g5elJSck0xSXpTQ0RDT1lzMThITjBFamNhelZRS0d3RUx5Y2oz?=
 =?utf-8?B?SlFmSkxwTllmR0FISHVRcDhTemVicW1jWnJPNHB2ZlViTnFCU3BlaEV6azBt?=
 =?utf-8?B?S2RZWnpiN2dFNEwwcFRobmw2SE95aVBCKzIxOHVHMGx1QWdwaHA3K2pLelJW?=
 =?utf-8?B?QmtSNWs4czJPWDVIQnpzdEJ6cG53Ykd5S3h6T2VYOHFaWFdodnZFMFEwaHpO?=
 =?utf-8?B?WWN4OWdCV0xTT1FFa3U4cU9QRkROaUN6d254S2NDbWtYR2d5VUlCbi9OUURp?=
 =?utf-8?B?SUJRckdVT2tua09vL3JucnRkRC9aOG9aY0JxSnVpbjRHM2RRY0Z6d3ZIb0pK?=
 =?utf-8?B?dUNvaUpoNWRGQ2M4UFd1VUtzb2tHVS9DM3czT2RXVDdXTGhvc2xvaURZNTJx?=
 =?utf-8?B?SWhUZUZQOW5Ta1lDWnhnaENVc2EydzYxUVlKUlZJU2ViYVF5M202RjhyeHBC?=
 =?utf-8?B?RHNZUHRVanQxN040OVV5dDhRaHdzRDk4WURmeW5HSXlLdWZrOTlrdlJWS3Jl?=
 =?utf-8?B?dExadzlLSnZwQmlLKzc1bWx3SGMyd3NieTJUMDUvNVdKaEpjVGlwYlhqcWxs?=
 =?utf-8?B?UmpTaUtkTlhhSGFJY2hsaFFBM25EUmZLQ2g5a3pyWnZVQnJTY0toTVdYUkJT?=
 =?utf-8?B?a01PZHoxQmhQUWFiUWpRbFRVdk9iSVd0UEE3RHNvY0NnbEVyU2JnRDhCT3Jl?=
 =?utf-8?B?dXZqU3J0L2pEaWhtTVlwcDArK3JGRllTbTBkUzFtcldGUWMvUHZmNnJOVmhv?=
 =?utf-8?B?blN4WlBnVnFEUUZIODc1czJKNnVrTU5NMms4UWQ1d2hyQVFTU1JYdjBrUHAr?=
 =?utf-8?B?OTJ3SzF1Nm1xa2NIM3VYMXpQOWxYcmJkZUNzcTUxc21mM0hVOUFLaVlvTGVQ?=
 =?utf-8?B?VkhaTFp3R29uV2xVYktzQ21nUFZRcmJ5cUY2NG83cWpvaE42bFp3VytDSDhI?=
 =?utf-8?B?V1pmRmtkM09nQ2hzaWFZUDZNa05KZFFkcFlMU05JOEFZZDhrVUJoQi9tN3JX?=
 =?utf-8?B?Tk9tN2o0ckJ4Y3pUa21OQmFPdENGOURvVjg0QW9QTXlpOG5LbzNHQUs2SGU4?=
 =?utf-8?B?TVhBWGRLS0FmTnAxSTBseUIxWTU2OHlGTEVYUWplVkF3MUQwZGdNQUxpaEFx?=
 =?utf-8?B?ZHlSUnFLNkpVdWFlN0dEYm1Fd1JWNXo1S2p5Q1VmK3ltYW9OanUyS2laT01C?=
 =?utf-8?B?L2lJQzdxQUpoVU9ES25kMzJhV0lOOTFTcGtkaVVJM0pFWFRBWis2OERSbEV1?=
 =?utf-8?B?K2QraThzSWRNREIwclNJZmFGM0IrYkVJNmQySUdqdlJMRnRSZDVLYjRUblpx?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b096dbc-d74d-4cca-df52-08dcd1ff2a01
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 01:15:03.2958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1K5/mzEcrKTTKcM4DbPCNRsMB6ePWtKYN6rXJ9AHR2BbGb6nnRzKmR9Jm4goXo7ctlMPMaU6pAcxtaCsbAZyNiKkJvZRrzAWlyS4UyPw3m0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5282
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

On 9/10/2024 17:48, Julia Filipchuk wrote:
>> +/**
>> + * xe_guc_log_snapshot_capture - create a new snapshot copy the GuC log for later dumping
>>    * @log: GuC log structure
>> - * @p: the printer object to output to
>> + * @atomic: is the call inside an atomic section of some kind?
>> + *
>> + * Return: pointer to a newly allocated snapshot object or null if out of memory. Caller is
>> + * responsible for calling xe_guc_log_snapshot_free when done with the snapshot.
>>    */
>> -void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>> +struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic)
>>   {
>> +	struct xe_guc_log_snapshot *snapshot;
>>   	struct xe_device *xe = log_to_xe(log);
>> -	size_t size;
>> -	void *copy;
>> +	struct xe_guc *guc = log_to_guc(log);
>> +	struct xe_gt *gt = log_to_gt(log);
>> +	size_t remain;
>> +	int i, err;
>>   
>>   	if (!log->bo) {
>> -		drm_puts(p, "GuC log buffer not allocated");
>> -		return;
>> +		xe_gt_err(gt, "GuC log buffer not allocated\n");
>> +		return NULL;
>> +> +
>> +	snapshot = xe_guc_log_snapshot_alloc(log, atomic);
>> +	if (!snapshot) {
>> +		xe_gt_err(gt, "GuC log snapshot not allocated\n");
>> +		return NULL;
>>   	}
> It seems err is not yet set in this context. So it would be a random
> stack value leaked? Or are there macros setting err I am not aware of here?
>> #define xe_gt_err(_gt, _fmt, ...) \
>> 	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
> Suggest to zero the "int err;" allocation. Or set explicitly.
>
> In general why is xe_gt_err used here over drm_puts? Is it a more
> specific error handler in this context?
The 'err' inside the xe_gt_err macro is not a local variable from 
outside the macro. It is used to generate the next function call down - 
"drm_err". There is no drm_puts any more because this function is now 
just an allocator, not a printer. So there is no print stream to call 
drm_puts on.

>
>
>>   
>> -	size = log->bo->size;
>> +	remain = snapshot->size;
>> +	for (i = 0; i < snapshot->num_chunks; i++) {
>> +		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>> +
>> +		xe_map_memcpy_from(xe, snapshot->copy[i], &log->bo->vmap,
>> +				   i * GUC_LOG_CHUNK_SIZE, size);Suggest cast i to size_t. Is the "i * GUC_LOG_CHUNK_SIZE" implicit
> conversion fine?
It would only be an issue if the GuC log buffer were over 2GB in size. 
However, the log is limited to 16MB by the GuC interface spec. So there 
is no possibility of 32bit overflow.

>
>> +		remain -= size;
>> +	}
>> +
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err) {
>> +		snapshot->stamp = ~0;
> Is this a convention for timestamps when failed?
Not sure if there is a convention as such, but ~0 seems even less likely 
to be valid than zero. And one has to pick something (or add in the 
extra complication of a 'is_stamp_valid' flag).

>
>
>> +	drm_printf(p, "GuC firmware: %s\n", snapshot->path);
>> +	drm_printf(p, "GuC version %u.%u.%u (wanted %u.%u.%u)\n",
>> +		   snapshot->ver_found.major, snapshot->ver_found.minor, snapshot->ver_found.patch,
>> +		   snapshot->ver_want.major, snapshot->ver_want.minor, snapshot->ver_want.patch);
> Missing colon for "GuC version" print format string.
Yup.

>
>
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
Note that you shouldn't really give an r-b when you have so many 
questions / changes requested.

John.

