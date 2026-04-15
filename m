Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD12FA0C51
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 08:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C94410E136;
	Wed, 15 Apr 2026 08:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/9jKrtb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CDA10E136
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776242641; x=1807778641;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+AKd03eSoTXWSbGa6eiVpXgj6ghRD9Vkh65X0GADtPE=;
 b=F/9jKrtbB/halx6VqAyIB6rS28YDW3p2M9+5qBgp9NUSR/8CZLyebooo
 p44+cY80y60pCdIFfeMoqNxuWOGujAHLEyPjG4Qwb/f7VD4AAmeYZ6vEH
 /dIz38BEVQub9FNXdWTADVENVjc9zq+vuHYaXxYWG66UwhSkAeT7nyaHa
 hKv/5OvrfsM7zWKM7JDMuSk1s/n5+jDwnwXqxnuQOur9QA8yXEBJ/okyd
 1OhC/qMn8u7InETZ2cSJGGo+ekEWGnRwNngKMXdq5xj+TSr1t3BpiWfn1
 JlYMWUNYPhVpt+N9DcwTr4Lxf/GncCACT6RJUBt70b+YidICuLZWlljrM Q==;
X-CSE-ConnectionGUID: HfL+96EvRAWMJNhO9bV2Mw==
X-CSE-MsgGUID: 2utw9V8HS56ecri8iWCtDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87915455"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87915455"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 01:44:01 -0700
X-CSE-ConnectionGUID: dPL8sSrDRMe4qfD+7mb2Og==
X-CSE-MsgGUID: KicaUBBpSBSagz+EO3I3HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229322556"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 01:44:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 01:44:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 01:44:00 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 01:44:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7Wfu//eRkavPQnmOPviVQqxlwjy9OlkJxQfe1o0vBBLhYJG3J2t4XvE0fWF5kfF9kGCapQhncvJH/NhoSG+SOxGDiDR7qiauRJmryFq1uXUkf1GjAv7qiYpC1M/OCN5Q3C7BwXBRqjRwJNAeRW880nNXiMpQPDPGZYku2iQvMS7DXesFK7VmGm2C/dXMMSvkCDmXL9RoCFRTqi/Jin/nvAMqtvdL2k3/rmO8Zun1Tpy/rrF6J4rAL/IQgXXK4GqzmguNkef6ft3VQHJuex8r9pv3Z+2LKAxRiFjTpbOVHqbgCeF2uVK+MHj9x+6cBvx5NZxuuignKui38N42RzrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8AKm5Jdos9bpzesNdjFSaGBBEzh6WiVTkL9czEV36o=;
 b=T8IpASZMkeBIM7T1/QYc8/0sX0VnNu350ZiRs2K7khxpKK5rEKd4t8P+DRExV9Y9LcJA6kvfQwbxtpVQXRVzRAy7TSOx2jpYExbnFxccpyFIW9/7JunZP1irwLLDNFlVOcLHWhiQ8vVuGqRexA/z6KUbKpT1ZplRe4uoXurIsTZU7yC5+vi7i7Fz/LTTDZkKWRhcFzt6N7BP3wgg1nNFhE5WaHbr01OWEPXDUzTAMoycgwYCcusiGi5Iirq406o4GZQk9cO9rOw3rdQlkX1+ePDIqAXOMq0AlMTyHNbAgo0YJE9P3Hj3MmjoxmBnsWOlBnkCQuO7YwvuGL/cl7aprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DSWPR11MB9581.namprd11.prod.outlook.com (2603:10b6:8:36e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 08:43:59 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 08:43:59 +0000
Message-ID: <3b6e0cd3-9d8c-42cd-8ca8-f67bb59110d4@intel.com>
Date: Wed, 15 Apr 2026 10:43:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] drm/xe/pci: Introduce PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <zhanjun.dong@intel.com>,
 <lukas@wunner.de>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-10-raag.jadav@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260406140722.154445-10-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0004.eurprd05.prod.outlook.com
 (2603:10a6:803:1::17) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DSWPR11MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a418b2-ffce-48ef-2610-08de9acb22e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11006099003|18096099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: hyrPZKcWl6feuG0F/jPJXdz4QG5Vh5LZLMzjGvMFOWOp5HJS63qAiy3bqSBUyvftqHPUGGTnt35qo4BTD90Aqf63yMNVImiPgC6StiFmlwYbFpVQBWdFMA+dpdmMvUZDt87QRaXwBEEQqBKNsLvvRuxLZWjv73F1BtSK6FZF6yDo5LidT68xy/R0SIw2G0jkQmrtOpRNlZjA/r1kFtvZ5O3Qb4XOviJUo765D0y3IBAFBnxaZtFYzYYV/MCL/2fmBrww+IKzdmcXjTp6AIcfiuQf7tNcuEMdAp04+kV4jdQuo9lY6/UVLCPHBBhLTmhWVQN4oIFr1Nlt5u7b4JY3gRySOVyrlRJMbZUZYeKRiBPO9yYpZCI3HGVejGKCX9iSe/N7pGhOPA+81M0VDZWt0Ui7LEvH30P99r4pzJ6FPfr9LpmetdhCC7l5gtJYpuPg90MsLqQKT/2CioZ5c6K9ZGfoEz9o9KUEkOVCwFZs4BowWTnqd88oRbat5xqmvGtTyP+uOgzkkZ5eJWMur5HGZulIuxviSdad5gO/T1JKG2Jc1o9ML1pPQckUtCOq6rvYQ3NmDZSYXY2rdUzRTdRcMbW3Mfc26zwrL3a0PZVqZPsYOpinojFrtBENEI0RpL9+eAJBbXpr0FJtgE1Y/3saIV0HrprjQqhMz5ENh96WZ4gei/1TQTNWXg7MvdWiOdY/bHF8gtJRVB/wctb+VMwaNCx45rsFRqltSfZtMwbG+2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11006099003)(18096099003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnRSYWM0L2JZbDJ1aEk1bWw5WS9WOFd0ZVY5YlQxQS81anNhWUxDdThDTi9G?=
 =?utf-8?B?UjUwK203a0R5NnJrSzkzeC94YXNTYm1aVUVZMEJMdnp1Uy9nMk9vWC9STmt2?=
 =?utf-8?B?Ulg5WlE1bXVZWWUycHZCditDVmI3UXVVenlxYVVPMDN2QTQ5RUFTQXhZTzFU?=
 =?utf-8?B?OFFzeEFzLzVPRWwxZTNHalhVUlp3OFpWQUpYMHdtUXdKcHdyNUZMaU5Eazlt?=
 =?utf-8?B?aENleWFQUkp6d1VHZE42cnB2c0dwdk1DSDkrNVg4NGlsdzd4UGE4QlJaL2p5?=
 =?utf-8?B?cVZqNENuU0tyNEJZaUlkZHdVd1ltMDI3LzM1YStQK2lyaFF0V1c5aUxwQWIz?=
 =?utf-8?B?ZlFtc3Zpem9tTkt6OVp2bGtrVDNENnNrQmtUTWdSQ1UvTFVaclpsV2Fyc3ZT?=
 =?utf-8?B?Nk5iT2lSZUl2d2ZOWE1EU0ZnN2MrUHRNbk80a3cyZ055UC9YY3VkV0VBSXg0?=
 =?utf-8?B?aDdPTHJmcFpaNTY3NVV4RENTNGoyMDdzbi9HbUxaTHFnb1lkUjhnN2RmNEZI?=
 =?utf-8?B?c3VudXhSTHpHRlVTYTRLMFZDK0NFaVltSDc0VUJMK0dIUUFGU0NMTzkyYW1r?=
 =?utf-8?B?OVRTQXhWQm9nem5Zcm0vT0pCSDQ4RjlwVFordUhIZXZJOXl4M2UwYkE3ejhI?=
 =?utf-8?B?K3dMM0UxV3FaaGpKYTRhVy9xRzdRdHVnVU1vSFFkYVBCR2pSWU13eFROYXkr?=
 =?utf-8?B?VkUrdFVvMnR6MXh0MGkvaUNHeTBkay91Z2ExK1lGOEJsMms0WFJoMk9UYkxj?=
 =?utf-8?B?Ulh2b0lLd1B0eXQrSXJ0VWJaaWNmMFkwYXJmcjNYK0pFakJrUzhURXdvUkFJ?=
 =?utf-8?B?cm5TcVYwY3phcXhkd0p2aElweWt0dTBYcVZsU0lBMVFNYlVnUkFSeDc5K0RI?=
 =?utf-8?B?QTg5eGwwNlNwZUFkZW1vWFVPM2J3eHFzaE8xQS9XWFhKajR4SFAzc1ZEcHB0?=
 =?utf-8?B?dElpRVZBRFU1RVZsVWtJTC9uSDZtNE1qN3RQem9meldTRm4yNnAyMUdZNVBY?=
 =?utf-8?B?aS9ZYVNVT1VIN2x1VitVUHhqZmV1ampZbGxJZTRLK3oyeG56NG5aZ09BeTM3?=
 =?utf-8?B?UGpKN015cTlkM3k0K0RNKzN5TzlpVW5FTEF0RjFFL2pPcHdDNGlKa0RST21M?=
 =?utf-8?B?ZWRDZTN6ajZlekcxaFBqZDFmb0hXQWc3NVY3ZitrNEdTV1UxN0JDak1TN3Fq?=
 =?utf-8?B?K2RYUzVVVGRHcFo3b1djdnRnaG80WkJYdmtGdlR3RGdpZHFQSDNidlg3L0RR?=
 =?utf-8?B?WHlzQWJGZWdCaXRDQTFkc0lrcW5UcVNPOXF0Q29IL0RuUjI4NVp3d1k4VWhG?=
 =?utf-8?B?cjlaNHg5c21tak9WejRMVktwVXFuWGlXcDVyd1F2NE1NUFQrRTdtazBzb1lx?=
 =?utf-8?B?a1hRNFI4dGRDMUJoVTVISlpSb2N3Yk1aZkVDTy9hMTRyLyt4cDY5QmpEWnN1?=
 =?utf-8?B?UVhCbU1FUTRyMkxsTk5vZFlEc2l3elVsWXFxYkxvSW1aNXNMbk40S3diYTJE?=
 =?utf-8?B?SFJ6YUtnR0tJY0tUTis0ZXpsRUxQSFQ4K3dHL0l1bVVpMnFVb2xlblV4aEk3?=
 =?utf-8?B?Tmpza2J1SzJNWWNqMTNuRFovTE50SkgwVTRvT3Uwd0NxanpQeEVTbVJyelYr?=
 =?utf-8?B?SnpYNC9ESVJQSUtNaWwvZGdmVGdpRkpyUXJGWVIwSC9tMGxsUXNhRTI5VW1l?=
 =?utf-8?B?b1VEay9WSU5yeGQxeitKUUhmbWliMEZUanpobXJYYWJmVUdBT3dBdjVkUTIr?=
 =?utf-8?B?NExPblljQTA3UUpBVkQ2UUhXS3Yya2dId3Zzc1ZLZFFNd0xpcmJTaVU1T3Y1?=
 =?utf-8?B?UzlVMlk4WTQ4dWUxNkdKaHRpT0w2NFp4QXozNGM2OUJza3BzUUkzajVTeVh3?=
 =?utf-8?B?YjRZTTl2WHdxbXZILzVpTHhHNllFL0cxeGtGM2k4TzBJWlc2VWF0ZUJvcVBY?=
 =?utf-8?B?TGpPMDZXeFhWT2JuVUpVREhQLy9nWEw1cHVkTzUvNWF1dndLUmM5U2EvOEQz?=
 =?utf-8?B?VmFPMGRsczJmZW4wYjdUandKN05JeWgxbVVCU2ZGUFZuQzlIMU1VY3FKOXRu?=
 =?utf-8?B?QjF6NE9RdXJrS0FIdm04RDJEN09wRENManV1Z3lROEptYlpyN3pMOXRzQTVV?=
 =?utf-8?B?NTFkUGNMak9sYzR2ck4zSDNxMmtFRDRGNzN2V0hPNVRhdVhMYkdad3V3cklW?=
 =?utf-8?B?VnBQWTl5dDJpbm5Vb0JuWitrRnFTYktnWjdQQjlXZVdWU1FWVkFqNmtFbXQ4?=
 =?utf-8?B?V0tTSmFjR1l4RUFLN085YXJOMXppUFh4MWJJcVpKcXFjVmdhaG82emZMYjVR?=
 =?utf-8?B?ajAyRy9wbW83eFhDYmtJQ1Y3Yk95VDd2WXUrcWJEcm9LVytaSzdvUT09?=
X-Exchange-RoutingPolicyChecked: jv6BKnooc534r/V/9R3ZmoEDnv0dD1TGEGoWn6vrj5KbGOocpCC0GBFuzEAgGfN7pZ5ymAANvzyRYa0n0lwMLDq5KtIvPdIA7VAyzKQp+LNLDgoSyoe//ZiF2zC+8AYfOPMTU4aLW6Vrqzlz1psm/4KBqUexp7SWAc6EcXm+wf19HPoA+lJIvdmSEwjjJis/GpYfXT9w19EfD4XKMgWeCpeHhX2De4w6tEL+IK3BJjV2P12qewGJunhZmPnb6NVVvQlbcHYPA1uUQZQrGEem+4dGRxMZY1j+2/RrE+b2USpBWmDTrF1dEbGBR4vtQqYffzE+087VesVFrsFUDnz4Lw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a418b2-ffce-48ef-2610-08de9acb22e2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 08:43:58.8630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s69GcD8+IJ+d4lIXxY3YfHeBr9hJHMsNOHA0MNWQn806JEmsBSOdvaq9+FNpSDAZm8miBg9JssPbYrIe/F7qvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9581
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


On 4/6/2026 16:07, Raag Jadav wrote:
> With bare minimum pieces in place, we can finally introduce PCIe Function
> Level Reset (FLR) handling which re-initializes hardware state without the
> need for reloading the driver from userspace. All VRAM contents are lost
> along with hardware state and driver takes care of recreating the required
> kernel bos as part of re-initialization, but user still needs to recreate
> user bos and reload context after PCIe FLR.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Spell out Function Level Reset (Jani)
> v5: Prevent PM ref leak for wedged device (Matthew Brost)
> ---
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>   drivers/gpu/drm/xe/xe_pci.c          |   1 +
>   drivers/gpu/drm/xe/xe_pci.h          |   2 +
>   drivers/gpu/drm/xe/xe_pci_err.c      | 160 +++++++++++++++++++++++++++
>   5 files changed, 167 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f9abaf687d46..06b5d53e1629 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
>   	xe_page_reclaim.o \
>   	xe_pat.o \
>   	xe_pci.o \
> +	xe_pci_err.o \
>   	xe_pci_rebar.o \
>   	xe_pcode.o \
>   	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 150c76b2acaf..b743b3986205 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -482,6 +482,9 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> +	/** @flr_prepared: Prepared for function-reset */
> +	bool flr_prepared;
> +
>   	/** @wedged: Struct to control Wedged States and mode */
>   	struct {
>   		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 26eb58e11056..f3515c91e534 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1332,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> +	.err_handler = &xe_pci_err_handlers,
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 11bcc5fe2c5b..85e85e8508c3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -8,6 +8,8 @@
>   
>   struct pci_dev;
>   
> +extern const struct pci_error_handlers xe_pci_err_handlers;
> +
>   int xe_register_pci_driver(void);
>   void xe_unregister_pci_driver(void);
>   struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
> new file mode 100644
> index 000000000000..339e8688d37f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_bo_evict.h"
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle.h"
> +#include "xe_i2c.h"
> +#include "xe_irq.h"
> +#include "xe_late_bind_fw.h"
> +#include "xe_pci.h"
> +#include "xe_pcode.h"
> +#include "xe_printk.h"
> +#include "xe_pxp.h"
> +#include "xe_wa.h"
> +
> +/* TODO: Extend support as a follow-up */
> +#define XE_FLR_SKIP		(!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) || \

Any known issues on integrated platforms? I checked it on PTL and didn't 
notice any problems. Everything seems to work fine with display disabled.

> +				 xe->info.probe_display)
> +
> +static int xe_flr_prepare(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	int err;
> +	u8 id;
> +
> +	err = xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		return err;
> +
> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> +
> +	xe_irq_disable(xe);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_flr_prepare(gt);
> +
> +	// TODO: Drop all user bos
> +	xe_bo_pci_dev_remove_pinned(xe);
> +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
> +
> +	return 0;
> +}
> +
> +static int xe_flr_done(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	struct xe_gt *gt;
> +	int err;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
> +	for_each_tile(tile, xe, id)
> +		xe_wa_apply_tile_workarounds(tile);
> +
> +	err = xe_pcode_ready(xe, true);
> +	if (err)
> +		return err;
> +
> +	xe_device_assert_lmem_ready(xe);
> +
> +	err = xe_bo_restore_map(xe);
> +	if (err)
> +		return err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_flr_done(gt);
> +		if (err)
> +			return err;
> +	}
> +
> +	xe_i2c_pm_resume(xe, true);
> +
> +	xe_irq_resume(xe);
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_resume(gt);
> +		if (err)
> +			return err;
> +	}
> +
> +	xe_pxp_pm_resume(xe->pxp);
> +
> +	xe_late_bind_fw_load(&xe->late_bind);
> +
> +	return 0;
> +}
> +
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (XE_FLR_SKIP) {
> +		xe_err(xe, "PCIe FLR not supported\n");
> +		return;
> +	}
> +
> +	if (xe_device_wedged(xe)) {
> +		xe_err(xe, "PCIe FLR aborted, device in unexpected state\n");
> +		return;
> +	}
> +
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	atomic_set(&xe->wedged.flag, 1);
> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but we try to
> +	 * update data structures and cleanup any pending work to avoid side effects during
> +	 * PCIe FLR. This will be similar to xe_pm_suspend() flow but without migration.
> +	 */
> +	if (xe_flr_prepare(xe)) {
> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> +		return;
> +	}
> +
> +	xe->flr_prepared = true;
> +	xe_info(xe, "Prepared for PCIe FLR\n");
> +}
> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (XE_FLR_SKIP)
> +		return;
> +
> +	if (!xe_device_wedged(xe) || !xe->flr_prepared)
> +		return;
> +
> +	/* Unprepare early in case we fail */
> +	xe->flr_prepared = false;
> +
> +	/*
> +	 * We already have the data structures intact, so try to re-initialize the device.
> +	 * This will be similar to xe_pm_resume() flow, except we'll also need to recreate
> +	 * all VRAM contents.
> +	 */
> +	if (xe_flr_done(xe)) {
> +		xe_err(xe, "Re-initialization failed\n");
> +		return;
> +	}
> +
> +	/* Unwedge to allow userspace access */
> +	atomic_set(&xe->wedged.flag, 0);
> +
> +	xe_info(xe, "Re-initialization success\n");
> +}
> +
> +/*
> + * PCIe Function Level Reset (FLR) support only.
> + * TODO: Add PCIe error handlers using similar flow.
> + */
> +const struct pci_error_handlers xe_pci_err_handlers = {
> +	.reset_prepare = xe_pci_reset_prepare,
> +	.reset_done = xe_pci_reset_done,
> +};
