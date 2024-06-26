Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46C0C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 14:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553DD10E8D4;
	Wed, 26 Jun 2024 14:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKRH0g6c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6363010E8D4
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719411244; x=1750947244;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Lb5zPDEt9w3rlYz/aQZl8BpBA6QOUW8EXh/4n8ULaO0=;
 b=DKRH0g6cbi3ToINjydXbkI6AoyFV5ZKcrwUI8Wx5GFNQzthOytjzZaPn
 gz5fdiLAc/64rFAHJdpkx5I7xPn/P2GFoWEDMP++6UQ1GjkL4Z9DJpLmC
 3eY/kXrc16WYus1Ztwag/SimJt3p/ekyZOFvs5VULKrv+WZiomIIr+x/Y
 JU88B03PMkW3mglcg7HRS+74YRmP8RLYCEdhXltxQMQKWVAV5Rpbx11R6
 6HbB/CPgv/w6FsALYzJM41nCSljQ1P4o/rMvGmHgKYgjIG2kPkKfY7wy6
 zep9JEmr4p7hXUSoQf1cHxvBvb5e1Fm7h4pQ2br2Uqz9P8jZZkm87dELP A==;
X-CSE-ConnectionGUID: xtiXWIrxRX+9uFZWlM1/uQ==
X-CSE-MsgGUID: U+N9kMOoS0qpvhWRUvyKQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16446937"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16446937"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 07:14:03 -0700
X-CSE-ConnectionGUID: BDYIWW42TD+s5NCwTg2gQg==
X-CSE-MsgGUID: 6HskgppITz6F5iYzCdoq1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="81559075"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 07:14:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 07:14:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 07:14:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 07:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6oNjNkOjEyqTySlNu+MGGzOsyNmwVF6rPKQxkAy6ht5rb8LqbV4JA/xpsrhZpMShVv4TytQDa8mjt9nF9/JwnxSN5pEl7daA/ylrRS3iEa3IeXAP9pvyyxZlTKFh1teSLothyCWSshUtBPocMhSqUzyMcf8aU/Af+UHZdDiCHoicaX2rt6/rk2zFXytZr6qKMzvmPk8I4g1CMvEqcwlpylWO0F13eWRvz5TTirpWfXvEcV2o47CiGi3q7xXSsEzIK7nSRHce0j4oV+gijLKSyYtBjBvYELX4qAMK/Cj+G4x6wOSVf40KLriX6Zo+1TqJpspJsGmUDE1gBnxAVnnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acdxG5mqJCaS7zYhW9+6RUg7UbGdG1JieYAHCrWzJnw=;
 b=IGbSpGTd/JTqSZbrGapbzlEes8ImT1WXjm3sqAuFLDVid6fItSvqcwj4p92fmAAV1NxLHqVU+W9j0l2lfrzlDxOpCwYK1Q9FzoiObigDYCdBiiA9KSVdahmkOKGJqApHq1U4J59/Zzj+gcoUXPoY8sZ8oVFIEyzNrzeRizl1pfcforRv3rVAMIb8PtCZpfLnWzicsX4Ri21DQ8EQ1Jh2lw3b8H0O+5GiEZGaXYCgUXB6N9Bp/fEjESNr/alqAh62tAGm7pbuuKaIDtCLXsKhnkM3G798mwWUGGhYjEUWUeph2OUKqzLJzNPqfXcQYQf6HBlYF+nDikOu8MbVwWUAiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Wed, 26 Jun
 2024 14:14:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Wed, 26 Jun 2024
 14:14:00 +0000
Date: Wed, 26 Jun 2024 16:13:56 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/pf: Disable VFs on remove
Message-ID: <20240626141356.2m5htc4iqjg3llre@intel.com>
References: <20240626111827.1389-1-michal.wajdeczko@intel.com>
 <20240626111827.1389-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626111827.1389-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR0P278CA0153.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: a33d323d-c958-48aa-471b-08dc95ea398b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUxYYWNXR2J5ajlMWEMzVGxGNTFnMFlMS200UzZDbkNmb1BLb1pJTnF0eitS?=
 =?utf-8?B?UWg5UTAza2t5UEI2Q2c5dW1IQVFBNU9mRmRHUzd2Y3F1SFZ6WlBYVEFXQklF?=
 =?utf-8?B?NHhBQnVxWStoTzVCTHh6clJqMUJiZ3Q0Wm04bjlWNkJSWDlDNzVKL1BOWEhG?=
 =?utf-8?B?ZGdTdU52SEp1QUVnV0l1TVJlVWZqam5kN1htaVRZS1JxaDBHSFpXSWRZSEZ0?=
 =?utf-8?B?RVhmd3Y5Y2daRDVHNTJsT1FvbmkxSVdpVVAzU3FLSGlaa2pqd3M3a0lBNVVC?=
 =?utf-8?B?dHhvVnZvbjhCODBtVU5OV2dSMkVuQ25kY0J4WlphMmYrazlwVHB3amV5bWIw?=
 =?utf-8?B?eXg5RDlLQ0VncFRsTGVUSkpGSmlyK0dkenVTOUhuQkxmQ2VVTVQ4dGdhTnI2?=
 =?utf-8?B?elJzczJjcHhpQSs2TnJuZGRHYWsxL0ZFOGszaDlrQWpIV1FKREduSEp0UnUz?=
 =?utf-8?B?ZnRzSHREMkoyS1dIZUNWQjhKUDVwZklhLy9PRlhoVXlSMEhmaHphYXg1c2ow?=
 =?utf-8?B?NkJYbVdkbGN5enJKbTRhRHpQVk9iQW11MkdaRXMvSVBNdnpBa1RHNTNCajhU?=
 =?utf-8?B?bU4zLzZ2ODg5dmtRd05tblFXdnRGQXY2MktQaUh6dmVqRTB5OGtwcGdKZHZY?=
 =?utf-8?B?aXVpZkxhZFE3NWtDWDF6RTNHSkhqWDFYQjJpeXZ2QWJib2wzdEN1YTlOQkwx?=
 =?utf-8?B?VWdUQ3VCQ0czeDFVWXdIMERzdGFRblZPZ29MdmM5ZUI1ZGpGRDMybHF1SGky?=
 =?utf-8?B?SjB5VEhMSUVKdVFuaEptK3NjeXpVN3J2WGxFanBpT0owdjFLN2srQTJLeUZ6?=
 =?utf-8?B?dCs3MG5DZGRrYnFzNk1GeHczUkdSZ0J5WjJmU1VOL2ZiSHpDSTNXVmhkVk10?=
 =?utf-8?B?M0JkOFdmUytMMDRMSFNXTG5WaE5PendqZktjK1JvMXEzVnVoanQ0VVFYN0x3?=
 =?utf-8?B?Tm5jVHZyUEw4TjVDazZSN0FMYmlGOGZEWkJpNFFobWZJdzExckNTbTRkMXpq?=
 =?utf-8?B?K3BFQTJ3dDNwQ1lKTUQwbFJVRitrbDNjazFhOUcwZ1JDTUVzV0xxZ1RZWkoz?=
 =?utf-8?B?QUluMzJON1p2T0dCTUl5Mi9lRTB1WmJ0RlRPUDYxb0NzR2ZHak0wa2JJM0JI?=
 =?utf-8?B?U05ScDh5NlBPMnltN2RlZ0E0UEtSTEZKZVl4RXFtZW9FK0htdW43QjBYVlVr?=
 =?utf-8?B?SGJyVlBvdW5MMWFUclF5cVFVRnRlSlpaRVEyQkRvQjJqYkhWYWdkRDNMUklu?=
 =?utf-8?B?T2FRYjMyL2tJNFJISkR6WlpWQ01tM2Vxb1ZOcHkzVmJzdXJoRTczOFJJbGs2?=
 =?utf-8?B?WjlCVUg0R1BGaTlHaXlobkkvUWpidjh4N1cyc0VJYkZ0VFZoMHZlWHdJVXRV?=
 =?utf-8?B?d3FSQyswemFXREZOb3FvOUR2QThxNUNqVEJ1YWlLOVJPVzZlZFZicGZKbkNE?=
 =?utf-8?B?a3ljZHpQKzJLMllLMUlqZGNzMUYxRVNQbzBBK09wR1ZsM00zSWZKZ2hnQlI0?=
 =?utf-8?B?dnhWcThsYUMxRXJEMzIrb1M5bEN4aHFLSmJyVmpDMjhuYzg5NEJvRm83U2d2?=
 =?utf-8?B?VVFpbGdERUJLRFlKbFlJZHU5SEJ2SExYU040WDVRanZYeTZmaFlpUWVkWWRZ?=
 =?utf-8?B?MjFYelhNS1dCZDNnaTFwN3I0cEI0MGErZFUxbkVwTXUyT1JFUW1tYU9PQmpP?=
 =?utf-8?B?Nkhmd203OVF3RVNzRkRQT2Q3Y2N6eitvaS9iSVBjbTFnbFNKZDVRT2xwNWRY?=
 =?utf-8?B?Mld6LzBkUUhYOW1UQmxRb29SZG5ZTUpqeG50eTExblh3SG5kY0pyb3pMZUZG?=
 =?utf-8?B?S2tWRkNGcE0zalhtM040dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTNCTVJlVGdsR2RmU09uREZtYWFlcXE0TFVHU2gzTUp5YVd4NGlTUzNhNWpU?=
 =?utf-8?B?cW5ieG45TWZCekR0amJpMnRiTE1WK04rL0FFZzJLeUl6TVIzVGFGRitkTlZO?=
 =?utf-8?B?ZFE0dnRHSExxRjFQMEQ3cTlqa2pIRzZ1dUxxTWt3SGRBSjlRaW9mb3llU2hP?=
 =?utf-8?B?dDEwbHk5NGZmTEQ1bnpnMWhDcDJpQTFBc1ZuSVpUcXhPNkxJanQ5UUY5bEpL?=
 =?utf-8?B?K3NLKzI0cXpHc2hNdmhOQ1RUbEcxdDZjOEZEQUovOXk1Q0lmTlQ5d1JydmIw?=
 =?utf-8?B?WmlqRnovVHZaVVhsaVJ3a0VWaklEc1lGVVBVVGxWNWgzZzhXUGhXaDBwaGxh?=
 =?utf-8?B?bXlBV2d1QngyZ1hHb29CNVlmc3o0ZDZyRE82aVc5bG5QdDZ3VENkWUNYa1ll?=
 =?utf-8?B?VFpZZUZnZ3pwellPcU8zZUZ1dTQxU0EzMml0d3dsaFFoMVA4YVljQlN6OTZF?=
 =?utf-8?B?TXJFZVpXaCtXa1lUUklaUitrZjJBdHVWWVM1NmcybmpZSk0xb3RCK2Z2NWFy?=
 =?utf-8?B?dWlMNDZhb0ZYT1JOaHpFRGIyWkhGNWlTUmp1SWRlbnRmTzZQMUVrdDRtdVZx?=
 =?utf-8?B?cnRJZ0I1R1FxWm5yTFhXYmpQemtxWFFiY29XVjFzNWR1eVA4M2FSTFJzRWh3?=
 =?utf-8?B?YmtuRVZZTEZSMkpNdlZFNHFzaGIwYk1tU3ZLOEZvV3FIaWRKaGo4eWt4K3lt?=
 =?utf-8?B?NFJnbWhsL3hIV3BOUCtDK3dmcWh0SFJlL3hjKzhyam1xdlRoNGw2c3U3Q3hR?=
 =?utf-8?B?aWw1T2NjYUFTMkd3YWN5WHFjY2duUE9VQWYwTUJjeEtzRVZ0c0R5RzltZU9a?=
 =?utf-8?B?eDVyaUFIaFgra1EveHBZL0ZZZTVnYkF4TmFObk9WWE5PNW5TTnE4eG5RaWZK?=
 =?utf-8?B?V0xtVXRuelErK2crTUFROTlKeitIa1VieU5mczNuYUh2VHV4NFcxUU01ZDM1?=
 =?utf-8?B?bTRaNEk4a0pYaHo4L0JzcFRVQWEzbGN4alRDaXRGeXlkZnIwaG8xUWVFdmxq?=
 =?utf-8?B?RWJ4Q3Ziay9PVEdiaEhPWkh3eVlDYTFmV1dWcUUzS2NaZkUrZjJzY29ieE5j?=
 =?utf-8?B?aVlId21zZ09BbHZvMVFpMVlHeURjbTQ3S0dFSVF0ZTRwRjZZdjMyc3RNSCtM?=
 =?utf-8?B?ZkFRNzRmdHNxc0o5TFRMUm9meXBVWW9qMjJyOUZUcGZMYzdrVkZHVlYvVUdu?=
 =?utf-8?B?NzREME81OUdUSStqQjdFQUtmaXVZUWYvZ1lXYkR3OEVkUVlueTJQelU0RE1i?=
 =?utf-8?B?bnRFMW04d1JPaElnZE9aYWQ2WWwxaFd5MVVYaTZZZUtMajFZRWdRcjBsTkV6?=
 =?utf-8?B?M0tmOVNSM0hrOUh5ZzRIQXM1RnRSKzIwYmhxdTFraEh5c0YzbkFDOFkvU2tQ?=
 =?utf-8?B?dTBkcE56TzJhMm1SRnE0ZHpIb0ppMkc3TDlaeUQvS3JMcG5VMnFDWVBmYVMy?=
 =?utf-8?B?NGNiektTSHlXWmJwdlJKUDF6eXZEWjVvb0I4amFDdEYrNXg4VUh0YzBZcFBm?=
 =?utf-8?B?eWlNeVRCdjNxWE1KWWtZUUFuTzJmdVFCK2hveGxzV1NVTHBWeDRjcVNsU1Rj?=
 =?utf-8?B?Rms4N2hEVXBxWkFteEI4WTNvbTk3RDExeUhEZjM2RXp1WEJ0UUZtSUh4WjlN?=
 =?utf-8?B?bkVzSmVIMmRmZHdyR2E2Vk92am5HTkswVWhpRTVEcDJ0czJyYS82c1dwNzlN?=
 =?utf-8?B?TmFWdmxBVXl2SVdOYXVKbmpnM2tyWG41cDgrdnBqVmM1ellWNlBaYkJrQXBT?=
 =?utf-8?B?WWlkTzM4WGRnTDFJU1F3ODV6cDZtcEdwaXp5WHR4NHl0ZHJSaFdDaE1kQVgy?=
 =?utf-8?B?dFAxOGJsbDNNRldlSnFJNnlUR3hPQU1XalBFTnkzd1JSTnYvMzd2NlZ5Q2lJ?=
 =?utf-8?B?YlJVSGdKczZJcnBkYkdSNDdRWmlSb2FqNEdyazIwZU00dGNYZ05JWFpBcW9H?=
 =?utf-8?B?Z1daSzk1SDVNb2NvM2JQK2J1cElNbWpBdE9aZkNSZFVxbW13byt3TW4xV2Ux?=
 =?utf-8?B?NGpNMkxVbjEzSElFN1JPVkRLMHFYQXl6WHpsU3grWVlKNzBpTWttQktTSVZr?=
 =?utf-8?B?Wm1TT3NhYnVuOGZZZWNXTFZvZnNoR20xSGphQTExQzNnZ3RlaXROeEY1SFhy?=
 =?utf-8?B?YXVpM2czL242Qmk3RGVWbGlucVM5TDFrWjYweW5mY1FBRk52dEF6V2szY3M5?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a33d323d-c958-48aa-471b-08dc95ea398b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 14:14:00.1590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOdE/wINIA+xKHLVcxiM+S+Qhn5x/ILXRUfNftViAcJ5wAN2q6awrNm4PhM2PriTdtWrJIq6VPLDw4OtH6LZ4ra62uCx3CKL7rPXqiL2+JQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6981
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-26 13:18:26 +0200]:
> We shouldn't leave VFs enabled when unloading the PF driver.
> Otherwise we will get a message like:
> 
>  [ ] xe 0000:4d:00.0: driver left SR-IOV enabled after remove
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ebff5ea79b1d..4b91a9878f41 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -749,6 +749,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	if (!xe) /* driver load aborted, nothing to cleanup */
>  		return;
>  
> +#ifdef CONFIG_PCI_IOV
> +	if (IS_SRIOV_PF(xe))
> +		xe_pci_sriov_configure(pdev, 0);
> +#endif
> +
>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
>  	pci_set_drvdata(pdev, NULL);
>
LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

-- 
> 2.43.0
> 

-- 
